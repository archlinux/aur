# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-powershellstandard-library
_nugetid=PowerShellStandard.Library
pkgver=5.1.1
pkgrel=1
pkgdesc="Reference assembly for PowerShell modules that run on Windows PowerShell 5.1 and PowerShell 7 (NuGet package)"
arch=('any')
url='https://github.com/PowerShell/PowerShellStandard'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-source-build-reference-packages
  git
)
# The commit of the 5.1.1 release ("release 5.1.1 - which adds an assembly for net452"), upstream
# doesn't tag. The later commits only change documentation and the template, before master moves on to
# PowerShell Standard 7.
_commit="b69d5e6a5107287a5981db515bae4d5631278f76"
source=("git+$url.git#commit=$_commit")
sha512sums=('e06ea3440792c4c7ad1cffa48cfff9f11434edc88344b200b1f4aa828d2fd0a81e5ff57f9b20f22838e74cec8997f23a88c559adc07ca355443b37e5fe3b447d')
b2sums=('88d59ba95cf513d89e59dab0a1e7869c2dd7f28e8073160335689c5f685325be210039875504f992778a00fef531b6fc00d8b2744e6ff8b3ab5c4289e15433c1')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The repository information usually comes from git, which would find the repository this PKGBUILD
  # is in instead
  _build_arguments=(
    --configuration Release
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
  )
}

prepare() {
  cd PowerShellStandard || exit
  # NETStandard.Library and the System.* reference packages come from dotnet-source-build-reference-packages
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-build-reference-packages" value="/usr/share/dotnet/source-build-reference-packages" />
  </packageSources>
</configuration>
EOF
  # Only for .NET Standard: the .NET Framework 4.5.2 build would need its reference assemblies, and is
  # only used by Windows PowerShell. Public signed with the key in the repository, giving it the same
  # strong name as upstream's. The packages it compiles against in the versions the reference packages
  # have; System.Security.SecureString and System.Security.Principal are part of .NET Standard 2.0. The
  # nuspec's file name differs in case.
  sed -i -E \
    -e 's|<TargetFrameworks>netstandard2.0;net452</TargetFrameworks>|<TargetFramework>netstandard2.0</TargetFramework>|' \
    -e 's|<DelaySign>True</DelaySign>|<PublicSign>True</PublicSign>|' \
    -e 's|(Include="System.IO.FileSystem.AccessControl" Version=)"[^"]*"|\1"5.0.0"|' \
    -e 's|(Include="System.Security.AccessControl" Version=)"[^"]*"|\1"6.0.0"|' \
    -e 's|(Include="System.Security.Permissions" Version=)"[^"]*"|\1"6.0.0"|' \
    -e '/Include="System.Security.(SecureString|Principal)"/d' \
    -e 's|PowershellStandard.Library.nuspec|PowerShellStandard.Library.nuspec|' \
    src/5/System.Management.Automation-lib.csproj
  sed -i '/net452/d' src/5/PowerShellStandard.Library.nuspec
}

build() {
  _dotnet_env
  cd PowerShellStandard || exit
  dotnet pack src/5/System.Management.Automation-lib.csproj "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

# No check(): the tests compare the library with the PowerShell running them, and powershell, which
# needs this package to build, runs them in its check() instead

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
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 PowerShellStandard/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
