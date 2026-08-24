# Maintainer: Sergii Fesenko <sergii_f@outlook.com>

pkgname=whatsv-git
pkgver=v0.2.0.r1.gf6c4bae
pkgrel=1
pkgdesc="Simple WhatsApp Web Client"
arch=('x86_64')
url="https://github.com/sfesenko/whatsv"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'vala' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/sfesenko/whatsv.git")
sha256sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  # Prefer git describe if tags exist, fallback to commit date
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    git log -1 --format='%cs' | tr '-' '.'
  fi
}

build() {
  meson setup --prefix /usr build "${pkgname}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
