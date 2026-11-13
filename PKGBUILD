# Maintainer: cgar <notify-cgar -AT- outlook -DOT- com>

pkgname='nkit-git'
pkgver=3
pkgrel=1

_pkgname='NKit'
_gc_gh_ver='GrindCore-20261105-230'
_gc_ng_ver='0.10.0'
_projects=( 'NKitApp' 'NKDSApp' )
_dotnet_sdk='10.0'
_dotnet_runtime='linux-x64'

pkgdesc='Command line disc image tools. Convert/extract/verify/fix (nkit). Dedupe/mount (nkds).'
arch=('x86_64')
url='https://github.com/Nanook/NKit'
license=('MIT')

makedepends=(git "dotnet-sdk-$_dotnet_sdk")
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
options=('!strip' '!debug')

source=(
  # Append #branch=xxx or #commit=xxx or #tag=xxx after ${url} if you want a specific version. E.g: #branch=bugfix/misc
  "git+${url}"
  "${_gc_gh_ver,,}.zip::https://github.com/Nanook/GrindCore/releases/download/${_gc_gh_ver}/grindcore.zip"
)

b2sums=(
  SKIP
  82c907161dc3b3d0f9d3c2febae077de3f31a1b9817ac3d81501a0c17c37ef0b5b73d816000133240716493a4c8bc7289eefca5677bb416a8d8ad0ba9015d670
)

_dotnet_source() {
  export NUGET_PACKAGES="$srcdir/nuget-cache"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
  export DOTNET_NOLOGO=1
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --abbrev=7 --tags | sed -E \
    -e 's/^v//' \
    -e 's/([^-]*-g)/r\1/' \
    -e 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  _dotnet_source
  for p in "${_projects[@]}"; do
    dotnet restore "$p/${p}.csproj" --runtime "$_dotnet_runtime"
  done

  cp "$srcdir/linux-x64/native/libGrindCore.a" "$NUGET_PACKAGES/grindcore/$_gc_ng_ver/runtimes/linux-x64/native/" \
    || ( error 'Adding native grindcore library to nuget cache failed, cannot continue'; return 1 )
  msg2 'Native grindcore library added to nuget cache successfuly'
}

build() {
  cd "${srcdir}/${_pkgname}"

  _dotnet_source
  for p in "${_projects[@]}"; do
    dotnet publish "$p/${p}.csproj" \
      --framework "net${_dotnet_sdk}" \
      --runtime "${_dotnet_runtime}" \
      --configuration "Release" \
      --property:StripSymbols=true \
      --property:AllowUnsafeBlocks=true \
      --property:PlatformName="${_dotnet_runtime}" \
      --property:DebugSymbols=false \
      --property:DebugType=none \
      --output "publish" \
      --property:Version="$(printf '%s' "$pkgver" | sed 's/\./-/3')"
      # Version weirdness as pkgver() forbids hyphens but then nuget forbids too many dots.
  done
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 'LICENSE'           "$pkgdir/usr/share/licenses/${_pkgname,,}/LICENSE"
  install -Dm644 'README.md'         "$pkgdir/usr/share/doc/${_pkgname,,}/README.md"
  install -Dm644 'RELEASE_NOTES.md'  "$pkgdir/usr/share/doc/${_pkgname,,}/RELEASE_NOTES.md"

  cd 'publish'
  install -Dm755 'nkit'  "$pkgdir/usr/bin/nkit"
  install -Dm755 'nkds'  "$pkgdir/usr/bin/nkds"

  cd 'defaults'
  install -Dm644 'nkit.yaml' "$pkgdir/usr/share/${_pkgname,,}/nkit.yaml"

  cd 'fix'
  for fix_file in *.yaml; do
    install -Dm644 "$fix_file" "$pkgdir/usr/share/${_pkgname,,}/fix/$fix_file"
  done
}
