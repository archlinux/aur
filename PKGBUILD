# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-markdig
pkgver=1.5.1
pkgrel=1
pkgdesc="Fast, powerful, CommonMark compliant, extensible Markdown processor for .NET (NuGet packages)"
arch=('any')
url='https://github.com/xoofx/markdig'
license=('BSD-2-Clause')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('7d7b7f3a70d3728ee622ebcd0b70688f9f75ff8eb8acd2955d6fde713e8c5667bc0ce844db50072a698f82e48102129362ff703d65fa20f3bc0877eb1cd78ae6')
b2sums=('02c70f99d35eb9dd7bd76e34d8c22cffe3858ca2814ba9a6346493ae6e77b6de1985c4e7183d23ae246e60744eab5c8119b775c7497c123bc599a5c1842b1d39')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The version is set like upstream's MinVer setup (src/Markdig/Markdig.targets) does it
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%.*}.0.0"
    -p:FileVersion="$pkgver.0"
    -p:ContinuousIntegrationBuild=true
  )
}

prepare() {
  cd markdig || exit
  # Pins an SDK we don't have
  rm src/global.json
  # MinVer is a prebuilt tool that derives the version from git, it's passed in build() instead.
  # The .NET Framework build would need prebuilt reference assemblies.
  sed -i -e '/<PackageReference Include="MinVer">/,/<\/PackageReference>/d' \
    -e '/<Target Name="PatchVersion"/,/<\/Target>/d' \
    -e 's|<TargetFrameworks>net462;|<TargetFrameworks>|' \
    src/Markdig/Markdig.targets
}

build() {
  _dotnet_env
  cd markdig || exit
  # Markdig.Signed is the same library, strong named with the key in its folder
  local _project
  for _project in Markdig Markdig.Signed; do
    dotnet pack "src/$_project/$_project.csproj" "${_build_arguments[@]}" \
      -p:IncludeSymbols=false --output "$srcdir/nupkg"
  done
}

check() {
  _dotnet_env
  cd markdig || exit
  dotnet test src/Markdig.Tests/Markdig.Tests.csproj "${_build_arguments[@]}" --framework "net$_dotnetsdkver"
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
  install -Dm644 "$srcdir"/nupkg/{Markdig,Markdig.Signed}."$pkgver".nupkg \
    -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 markdig/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
