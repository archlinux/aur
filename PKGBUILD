# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=qman-git
pkgver=1.3.1.r5.gd21ef51
pkgrel=1
pkgdesc="A more modern manual page viewer for our terminals"
arch=('x86_64' 'aarch64')
url="https://github.com/plp13/qman"
license=("BSD-2-Clause")
depends=("ncurses" "libinih" "zlib" "bzip2" "xz" "man-db")
makedepends=("git" "meson" "python-cogapp")
provides=("qman")
conflicts=("qman")
source=("git+https://github.com/plp13/qman.git#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd qman
  git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
  cd qman
  sed -r "s|install_dir: 'man/man1'|install_dir: 'share/man/man1'|g" \
      -i man/meson.build
}

build() {
  arch-meson build qman
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
  cd qman
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
