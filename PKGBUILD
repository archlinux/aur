# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-vs-validation
_nugetid=Microsoft.VisualStudio.Validation
pkgver=18.7.19
pkgrel=1
pkgdesc="Common input validation and state verification utility methods, Microsoft.VisualStudio.Validation (NuGet package)"
arch=(any)
url='https://github.com/microsoft/vs-validation'
license=(MIT)
_dotnetsdkver="10.0"
makedepends=(
  "dotnet-build-deps-$_dotnetsdkver"
  jq
  python
)
# The commit the package was published from (tag v17.13.22)
_commit="bbf7eb3b41b076a1792f4feda04edc7ff40ad707"
# Microsoft's internal build signs the assemblies, so they're public signed with the public key from
# Arcade, giving them the same strong name as upstream's
_arcadecommit="94f797268292122de4b6344d6265fad658c53703"
source=("vs-validation-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "MSFT.snk::https://raw.githubusercontent.com/dotnet/arcade/$_arcadecommit/src/Microsoft.DotNet.Arcade.Sdk/tools/snk/MSFT.snk"
  "lcl-to-resx.py")
sha512sums=('435ca60c033b4a3d8aafb2cbcbfe97c31f9ab69b985c750d4af3913a801cb64c40005e4f24c5293e8f0e97857bc553f6b2ce483b67c5665562f114c95d9b8c8d'
  '98c02c09b9fed2ad77d8403efa5788053abb66a9c6c2cb8dd5d15ce49daf25e3a128b9b281fa2bc79e7cfc33adfbbfff6901b63fc9b882a890c13737892e71e1'
  'c55166dccaf9729657d5c6d639119d4bb3bc744a8e9f73f7beb7fed6fb3045ed0bf773f2ed59097ebffcc92bac1c25a933c60d1efba7cad1a5e49e90c2f5a4b4')
b2sums=('a95be1662700a59d9d6a9389f30b6d82661769687d0a0a0fdd6a604e8453145389ce88f3279b61f126c29a4751366e1d82d65c0e71f4431359a39f21cbad0022'
  'df52cdab9f311499106f30869455797a02345bf43fd01e942fbb0312228660c88122fba00188484cb03616dfa4b234a83e73f132377c94169f2a26da175ff2ee'
  '8311ff8071a93b0fd5a8b095da0172a9817c577377007269273fe72aff8021c8fa233ad7087f40772760fff015d9827c1c13c6bf5878fba75b69f3c96b872d24')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, which Nerdbank.GitVersioning computes from git. The file
  # version ends in the first two bytes of the commit. The repository information usually comes from
  # git, which would find the repository this PKGBUILD is in instead.
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%.*}.0.0"
    -p:FileVersion="$pkgver.$((16#${_commit:0:4}))"
    -p:InformationalVersion="$pkgver+${_commit:0:10}"
    -p:IncludeSourceRevisionInInformationalVersion=false
    -p:EnableSourceControlManagerQueries=false
    -p:RepositoryType=git
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SignAssembly=true
    -p:PublicSign=true
    -p:AssemblyOriginatorKeyFile="$srcdir/MSFT.snk"
  )
}

prepare() {
  cd "vs-validation-$_commit" || exit
  # Upstream pins an exact SDK (10.0.302 in 18.7), the libraries build with the one installed just as well
  jq 'del(.sdk)' global.json >global.json.new
  mv global.json.new global.json
  # Nerdbank.GitVersioning needs git (see _dotnet_env for the versions), and MicroBuild is Microsoft's
  # internal signing and localisation
  sed -i -E '/GlobalPackageReference Include="(Nerdbank.GitVersioning|Microsoft.VisualStudio.Internal.MicroBuild.VisualStudio)"/d' \
    Directory.Packages.props
  sed -i 's/ DependsOnTargets="GetBuildVersion"//' Directory.Build.props
  # The translations, which MicroBuild applies to the assemblies
  python -I "$srcdir/lcl-to-resx.py" loc/lcl "$_nugetid" "src/$_nugetid"

  # Upstream's NuGet.config, which has the feed the tests need
  mv nuget.config nuget.config.upstream
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
}

# Writes nuget.config with the feed $1 (as key=url)
_nuget_config() {
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
</configuration>
EOF
}

build() {
  _dotnet_env
  cd "vs-validation-$_commit" || exit
  dotnet pack "src/$_nugetid/$_nugetid.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "vs-validation-$_commit" || exit
  # A temp folder of their own, so files with fixed names that another user's build left in /tmp
  # can't get in the way. It stays in /tmp rather than $srcdir, as .NET's named pipes are sockets in
  # it, whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"
  # The tests need packages from the feed upstream uses, which mirrors nuget.org
  _nuget_config "$(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' nuget.config.upstream)"
  # The tests target .NET 8. Since 18.x with xunit v3 on Microsoft.Testing.Platform (global.json's test
  # runner), whose dotnet test takes the project by --project.
  DOTNET_ROLL_FORWARD=Major dotnet test --project "test/$_nugetid.Tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}"
  rm -rf "${_test_tmp:?}"
}

# Fails if a binary in $pkgdir, also inside the .nupkg files there, is identical to one of the packages
# restored from a remote feed like nuget.org into $1, so no prebuilt binary slips in instead of one built
# from source
_check_prebuilt() {
  local _extracted="$srcdir/check-prebuilt" _metadata _file _hash _found=0
  local _binaries=(-type f '(' -name '*.dll' -o -name '*.exe' -o -name '*.so' -o -name '*.so.*' -o -name '*.dylib' ')')
  local -A _prebuilt=()
  while IFS= read -r -d '' _metadata; do
    grep -qE '"source": *"https?://' "$_metadata" || continue
    while IFS= read -r -d '' _file; do
      _prebuilt[$(sha256sum <"$_file")]="${_file#"$1"/}"
    done < <(find "${_metadata%/*}" "${_binaries[@]}" -print0)
  done < <(find "$1" -name .nupkg.metadata -print0)

  rm -rf "$_extracted"
  mkdir -p "$_extracted"
  while IFS= read -r -d '' _file; do
    mkdir -p "$_extracted/${_file#"$pkgdir"/}"
    bsdtar -xf "$_file" -C "$_extracted/${_file#"$pkgdir"/}"
  done < <(find "$pkgdir" -type f -name '*.nupkg' -print0)
  while IFS= read -r -d '' _file; do
    _hash=$(sha256sum <"$_file")
    if [[ -v "_prebuilt[$_hash]" ]]; then
      echo "Prebuilt binary: ${_file#"$_extracted"/} is ${_prebuilt[$_hash]}" >&2
      _found=1
    fi
  done < <(find "$pkgdir" "$_extracted" "${_binaries[@]}" -print0)
  rm -rf "$_extracted"
  return "$_found"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/nuget/packages/"
  install -Dm644 "vs-validation-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
