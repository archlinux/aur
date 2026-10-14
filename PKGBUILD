# Maintainer: jinzhongjia <mail@nvimer.org>
pkgname=zt
pkgver=0.11.0
pkgrel=1
pkgdesc="Minimal terminal emulator in Zig (X11 backend, no GPU required)"
arch=('x86_64' 'aarch64')
url="https://github.com/midasdf/zt"
license=('MIT')
depends=(
  'libxcb'
  'xcb-imdkit'
  'libxkbcommon'
  'libxkbcommon-x11'
)
makedepends=('zig>=0.17.0')
provides=("${pkgname}=${pkgver}")
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e906d189f17c7331f7167351cbf8aa5064714832df7339efa77996ae5d1bff6')

build() {
  cd "${pkgname}-${pkgver}"
  # zig 0.17 dropped `zig build --global-cache-dir`; the env var still works.
  ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-global-cache" zig build \
    -Dbackend=x11 \
    -Doptimize=ReleaseFast \
    -Dstrip=true \
    --prefix "${srcdir}/install" \
    --cache-dir "${srcdir}/.zig-cache" \
    --summary all
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${srcdir}/install/bin/zt" "${pkgdir}/usr/bin/zt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
