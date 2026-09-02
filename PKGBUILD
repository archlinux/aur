# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Ainola
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=imv-git
_pkgname=imv
pkgver=5.0.1.r31.g7dc0dda
pkgrel=1
pkgdesc='A command line image viewer intended for use with tiling window managers'
url="https://git.sr.ht/~exec64/imv"
arch=(x86_64 i686)
license=('MIT')
depends=(
  glu
  libheif
  libinih
  libjpeg-turbo
  libnsgif
  libnsbmp
  libpng
  librsvg
  libtiff
  libwebp
  libxkbcommon
  libxkbcommon-x11
  pango
  qoi
  wayland-protocols
)
makedepends=(
  asciidoc
  cmake
  git
  meson
)
# checkdepends=(
#   cmocka
#   tinyxxd
# )
provides=(imv)
conflicts=(renameutils imv)
source=("git+https://git.sr.ht/~exec64/imv")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i "s/unicode_lib = dependency('icu-io')/unicode_lib = dependency('icu-uc')/" meson.build
}

build() {
  cd "${_pkgname}"
  arch-meson build -D test=disabled
  meson compile -C build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
