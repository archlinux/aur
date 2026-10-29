# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=g0v0-robin
_pkgname=${pkgname%-bin}
pkgver=2026.1022.1
_pkgtag=v${pkgver}-g0v0
pkgrel=1
pkgdesc="g0v0! -- free and open rhythm experience! (Robin pre-release channel)"
arch=(x86_64 aarch64)
url="https://github.com/GooGuTeam/g0v0"
license=("MIT" "custom:CC-BY-NC 4.0")
makedepends=(dotnet-sdk-10.0)
depends=(
  zlib
  libgl
  dotnet-runtime-10.0
  osu-mime
)
provides=(g0v0)
conflicts=(g0v0 g0v0-bin g0v0-robin-bin g0v0-git)
options=(!strip !debug)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/GooGuTeam/g0v0/archive/refs/tags/${_pkgtag}.tar.gz"
  "icon.png"
  "https://raw.githubusercontent.com/GooGuTeam/g0v0-resources/master/LICENCE.md"
  "g0v0.desktop"
  "g0v0-uri-handler.desktop"
  "g0v0"
)
sha256sums=('7db2b2c90c203c3d2dab656f1951e85122a9002db9b8d829b5e7ee52e1ea54a8'
            'c93f6981c6c528e717d5215eeed775cf4926fe61476d95163b3ecd5770f40dda'
            '96276add86bd921e64255ce7e5487599dbe13e6e48e96a6af1a58cc99c187648'
            '26ecc3e357b03798cd8cc4ada4348d9e8eef1f3c725f8176e3b9533185c0bd0a'
            'dfbe774cb090a23f4000859dd9bb6c79717e20d091737893b915a55db5b4965a'
            'c68c96c42b8b6b7cdb7a80dea4f7befc4eb311da56e4386a04ed5c01c7e0bef0')

build() {
  cd "$srcdir/g0v0-${_pkgtag#v}"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net10.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output \
    /property:Version="$pkgver"
}

package() {
  cd "$srcdir/g0v0-${_pkgtag#v}"
  install -d "$pkgdir/opt/g0v0"
  cp -r output/* "$pkgdir/opt/g0v0"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/g0v0"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/g0v0.desktop"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/g0v0-uri-handler.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/g0v0.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENCE.md"

  # Fix Vulkan renderer. See: https://github.com/ppy/osu/discussions/27659#discussioncomment-9101487
  ln -sf /usr/lib/libdl.so.2 "$pkgdir/opt/g0v0/libdl.so"
}
