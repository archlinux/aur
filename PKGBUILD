# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-vs-threading
_nugetid=Microsoft.VisualStudio.Threading.Only
_project=Microsoft.VisualStudio.Threading
pkgver=18.12.1
pkgrel=2
pkgdesc="Async synchronisation primitives, async collections, TPL and dataflow extensions, Microsoft.VisualStudio.Threading.Only (NuGet package)"
arch=(any)
url='https://github.com/microsoft/vs-threading'
license=(MIT)
_dotnetsdkver="10.0"
makedepends=(
  "dotnet-build-deps-$_dotnetsdkver"
  dotnet-vs-validation
  jq
  python
)
# The commit the package was published from (tag v18.12.1)
_commit="816950dca421b07df18e26aa75adcf09a35a0db6"
# Microsoft's internal build signs the assemblies, so they're public signed with the public key from
# Arcade, giving them the same strong name as upstream's
_arcadecommit="94f797268292122de4b6344d6265fad658c53703"
source=("vs-threading-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "MSFT.snk::https://raw.githubusercontent.com/dotnet/arcade/$_arcadecommit/src/Microsoft.DotNet.Arcade.Sdk/tools/snk/MSFT.snk"
  "lcl-to-resx.py")
sha512sums=('d8e5bf92bb94d4a01e29c104f2f0d41330e7aa3413d8de981ddd73a0c4e10a394e7ed8b406dd01b981e5266a5fea6050ea036616c210ddcd4406adae824bb0c7'
  '98c02c09b9fed2ad77d8403efa5788053abb66a9c6c2cb8dd5d15ce49daf25e3a128b9b281fa2bc79e7cfc33adfbbfff6901b63fc9b882a890c13737892e71e1'
  'c55166dccaf9729657d5c6d639119d4bb3bc744a8e9f73f7beb7fed6fb3045ed0bf773f2ed59097ebffcc92bac1c25a933c60d1efba7cad1a5e49e90c2f5a4b4')
b2sums=('b2f3c835c7b97159cb5b36c90cbbcd61ae4f0d3e930beb0e93e05431676e3f7aaea7a5a0f530b79f9a249f22302520be2405b886d6be932dea1af5923c936f6e'
  'df52cdab9f311499106f30869455797a02345bf43fd01e942fbb0312228660c88122fba00188484cb03616dfa4b234a83e73f132377c94169f2a26da175ff2ee'
  '8311ff8071a93b0fd5a8b095da0172a9817c577377007269273fe72aff8021c8fa233ad7087f40772760fff015d9827c1c13c6bf5878fba75b69f3c96b872d24')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, which Nerdbank.GitVersioning computes from git and
  # version.json. The file version ends in the first two bytes of the commit. The repository
  # information usually comes from git, which would find the repository this PKGBUILD is in instead.
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="$(jq -r .assemblyVersion "$srcdir/vs-threading-$_commit/version.json").0.0"
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

# .NET runtime packages the library is built against
_runtimepackages=(
  Microsoft.Bcl.AsyncInterfaces
)

# Packages built from source by other packages (makedepends), in the system feed
_systempackages=(
  Microsoft.VisualStudio.Validation
)

# Writes nuget.config with the feed $1 (as key=url) for everything but the packages of the system
# feed and the runtime packages, which are taken from the source-built artifacts if prepare() found
# them there
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-system" value="/usr/share/nuget/packages" />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-system">
EOF
    for _package in "${_systempackages[@]}"; do
      echo "      <package pattern=\"$_package\" />"
    done
    echo '    </packageSource>'
    if [[ -f "$srcdir/runtime-packages" ]]; then
      echo '    <packageSource key="dotnet-source-built">'
      for _package in "${_runtimepackages[@]}"; do
        echo "      <package pattern=\"$_package\" />"
      done
      echo '    </packageSource>'
    fi
    cat <<EOF
    <packageSource key="${1%%=*}">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >nuget.config
}

prepare() {
  # The runtime packages come from the .NET dotnet-build-deps-10.0 chooses, so the build never mixes
  # two builds of .NET: the source-built artifacts of Arch Linux (dotnet-source-built-artifacts)
  # with dotnet-build-deps-10.0, Microsoft's build from nuget.org with dotnet-build-deps-10.0-bin.
  mkdir -p nuget-local
  local _artifacts
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_runtimepackages[@]/%/.*.nupkg}"
    touch runtime-packages
  done

  cd "vs-threading-$_commit" || exit
  # Upstream pins a newer feature band of the .NET SDK, which isn't needed
  jq 'del(.sdk)' global.json >global.json.new
  mv global.json.new global.json
  # Nerdbank.GitVersioning needs git (see _dotnet_env for the versions), and MicroBuild is Microsoft's
  # internal signing and localisation
  sed -i -E '/GlobalPackageReference Include="(Nerdbank.GitVersioning|Microsoft.VisualStudio.Internal.MicroBuild.VisualStudio)"/d' \
    Directory.Packages.props
  sed -i 's/ DependsOnTargets="GetBuildVersion"//' Directory.Build.props
  # The translations, which MicroBuild applies to the assemblies
  python -I "$srcdir/lcl-to-resx.py" loc/lcl "$_project" "src/$_project"

  # Upstream's NuGet.config, which has the feed the tests need
  mv nuget.config nuget.config.upstream
}

build() {
  _dotnet_env
  cd "vs-threading-$_commit" || exit
  # Only the library, the analyzers would need Roslyn for Visual Basic. On Linux, upstream builds for
  # all frameworks but the one for Windows (WPF).
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  dotnet pack "src/$_project/$_project.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "vs-threading-$_commit" || exit
  # A temp folder of their own, so files with fixed names that another user's build left in /tmp
  # can't get in the way. It stays in /tmp rather than $srcdir, as .NET's named pipes are sockets in
  # it, whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"
  # The tests need packages from the feed upstream uses, which mirrors nuget.org
  _nuget_config "$(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' nuget.config.upstream)"
  # The test runner targets .NET 8. global.json selects Microsoft.Testing.Platform for dotnet test.
  # Like upstream's CI (tools/dotnet-test-cloud.ps1), without the tests marked as unstable, see
  # https://github.com/microsoft/vs-threading/issues/1041
  DOTNET_ROLL_FORWARD=Major dotnet test --project "test/$_project.Tests/$_project.Tests.csproj" "${_build_arguments[@]}" \
    --filter-not-trait 'TestCategory=FailsInCloudTest'
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
  install -Dm644 "vs-threading-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
