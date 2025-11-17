# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="qman"
pkgver="1.5.1"
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
backup=("etc/xdg/qman/qman.conf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plp13/qman/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e550958523d0fef90fd0123a61a8f10099ed0c9735e06d8152662d8965b5a0e1")

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
