# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=qman-git
pkgver=1.3.1.r28.gb461fb9
pkgrel=1
pkgdesc="A more modern manual page viewer for our terminals"
arch=('x86_64' 'aarch64')
url="https://github.com/plp13/qman"
license=("BSD-2-Clause")
depends=("ncurses" "libinih" "zlib" "bzip2" "xz" "man-db")
makedepends=("git" "meson" "python-cogapp")
checkdepends=("cunit")
provides=("qman")
conflicts=("qman")
backup=("etc/xdg/qman/qman.conf")
source=("git+https://github.com/plp13/qman.git#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd qman
  git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

build() {
  opts=(
    "-Ddocdir=share/doc/qman"
    "-Dman-pages=enabled"
    "-Ddocs=enabled"
    "-Dtests=$(if check_option check y; then echo enabled; else echo disabled; fi)"
  )
  arch-meson build qman "${opts[@]}"
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
  cd qman
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
