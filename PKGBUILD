# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=spreadsheet-git
pkgver=r136.15455cc
pkgrel=1
pkgdesc="Spreadsheet program built with Vala and GTK+, especially for elementary OS"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/ryonakano/Spreadsheet"
license=(MIT)
depends=(libgranite.so)
makedepends=(git vala meson)
provides=(spreadsheet)
conflicts=(spreadsheet)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "${pkgname%-git}"
  meson . build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.ryonakano.spreadsheet "$pkgdir/usr/bin/spreadsheet"
  install -Dm 644 "$srcdir/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
