# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=iwqt
pkgver=0.0.1
pkgrel=1
pkgdesc="An iwd network applet for linux systems"
url="https://github.com/FinGu/iwqt"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('iwd' 'qt6-base' 'sdbus-cpp')
makedepends=('meson' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FinGu/iwqt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6efbd948027601b61b7dfd4dafd9772c19fdfcb81bcee9bfdbfc27174d215003f8875201f10d206a73669f5cdf2aa3448991d876fee914dc0321e5f737afcdc4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Currently no subprojects but leaving this here for conisistancy.
  meson subprojects download --sourcedir=.
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

# no tests currently
# check() {
#   cd "${srcdir}/${pkgname}-${pkgver}"
#   meson test -C build
# }

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
  # build does not follow --prefix
  mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/local"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
