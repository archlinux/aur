# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="qman"
pkgver="1.4.2"
pkgrel="1"
epoch="1"
pkgdesc="A more modern manual page viewer for our terminals"
arch=("x86_64" "aarch64")
url="https://github.com/plp13/qman"
license=("BSD-2-Clause")
depends=("ncurses" "zlib" "bzip2" "xz" "man-db")
makedepends=("git" "meson" "python-cogapp")
checkdepends=("cunit")
provides=("qman")
conflicts=("qman-git")
replaces=("qman-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plp13/qman/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("c624a52ae2611b8b7402ebab945feaea8768363fcdfe5f6390f93688cc263a48")

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/install_dir\: 'man\/man1'/install_dir: 'share\/man\/man1'/g" "man/meson.build"
}

build() {
  opts=(
    "-Dconfigdir=/etc/xdg/qman"
    "-Ddocdir=share/doc/qman"
    "-Dman-pages=enabled"
    "-Ddocs=enabled"
    "-Dconfig=enabled"
    "-Dgzip=enabled"
    "-Dbzip2=enabled"
    "-Dlzma=enabled"
    "-Dtests=disabled"
  )
  arch-meson build "${pkgname}-${pkgver}" "${opts[@]}"
  meson compile -C build
}

check() {
  arch-meson build "${pkgname}-${pkgver}" --reconfigure -Dtests=enabled
  meson test -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
