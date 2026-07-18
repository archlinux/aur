# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>

pkgbase=modemu2k
pkgname=('modemu2k' 'modemu2k-docs')
pkgver=0.2.4
pkgrel=1
pkgdesc="Hayes-style AT-command modem emulator bridging serial-style I/O to TCP/Telnet"
arch=('x86_64')
url="https://theimpossibleastronaut.github.io/modemu2k/"
license=('GPL-2.0-or-later')
makedepends=(
  'doxygen'
  'groff'
  'meson'
  'ninja'
)

source=("https://github.com/theimpossibleastronaut/${pkgbase}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('7ad7994e3ffee235a62228f0cb99f37a8b473979b54ae089b5e249796f70650c')

build() {
  arch-meson "${pkgbase}-${pkgver}" build \
    -Db_sanitize=none \
    -Dgen-docs=true \
    -Dhelper-scripts=true
  meson compile -C build
}

check() {
  meson test -C build --no-suite network
}

package_modemu2k() {
  DESTDIR="${pkgdir}" meson install -C build
  # HTML docs ship separately via modemu2k-docs.
  rm -rf "${pkgdir}/usr/share/doc/${pkgbase}/html"
  install -Dm 644 "${pkgbase}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
  rm -f "${pkgdir}/usr/share/doc/${pkgbase}/COPYING"
}

package_modemu2k-docs() {
  pkgdesc="HTML API documentation for modemu2k"
  arch=('any')
  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -r "${srcdir}/build/html" "${pkgdir}/usr/share/doc/${pkgbase}/html"
  install -Dm 644 "${pkgbase}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/modemu2k-docs"
}
