# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-pluralize-net
_nugetid=Pluralize.NET
pkgver=1.0.13
pkgrel=1
pkgdesc="Pluralize or singularize any English word, Pluralize.NET (NuGet package)"
arch=('any')
url='https://github.com/sarathkcm/Pluralize.NET'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
)
# The latest commit. Upstream hasn't published a release since 1.0.2, the later commits fix rules and
# version the library as 1.0.13.
_commit="5ccb647784d439fc20ce8f1b5b15b790da29148b"
source=("Pluralize.NET-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('98e2d494147e92962c1fdf63b560e14462eda7c0cfdb7fc2cd247c5f177ce3cc7a3cb8b3ecb83494876301c5d69f371cb8d01a13ccfc25b7e8245cfb4d3dcf63')
b2sums=('0659c39c9a86512af83405aa872571eea841472d7bc8653b42f15f2af6596b8b0a6d7096176783d87f0999005a85ac100b411f12c63cac1f9abb31683aa91061')

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
    -p:RepositoryCommit="$_commit"
  )
}

prepare() {
  cd "Pluralize.NET-$_commit" || exit
  # The tests target .NET Core 2.0, test on the .NET runtime that's installed
  sed -i "s|<TargetFramework>netcoreapp2.0</TargetFramework>|<TargetFramework>net$_dotnetsdkver</TargetFramework>|" \
    Pluralize.NET.Tests/Pluralize.NET.Tests.csproj
}

build() {
  _dotnet_env
  cd "Pluralize.NET-$_commit" || exit
  dotnet pack "$_nugetid/$_nugetid.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "Pluralize.NET-$_commit" || exit
  dotnet test "$_nugetid.Tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}"
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
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "Pluralize.NET-$_commit/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  _check_prebuilt "$srcdir/nuget"
}
