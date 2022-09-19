# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-lyricbar
pkgname=deadbeef-plugin-lyricbar-git
pkgver=r80.ga1b2dba
pkgrel=3
pkgdesc="DeaDBeeF lyric bar plugin"
arch=('i686' 'x86_64')
url="https://github.com/loskutov/deadbeef-lyricbar"
license=('MIT')
depends=('deadbeef' 'libxml++')
provides=('deadbeef-plugin-lyricbar')
conflicts=('deadbeef-plugin-lyricbar')
optdepends=('gtkmm3' 'gtkmm')
makedepends=('git' 'pkgconf' 'gtkmm3' 'gtkmm')
source=("${_pkgname}::git+${url}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '205abce61bf4bb4a1a59bcac3a440a88904d688846d21eedb5ea6f73f4415f97')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Arch compile FLAGS
  patch -p1 -i ../${_pkgname}-makefile.patch
}

build() {
  cd "${_pkgname}"
  make COPTS="${CFLAGS}" CXXOPTS="${CXXFLAGS}" gtk2
  mv ddb_lyricbar_gtk2.so ddb_lyricbar_gtk2.so.save
  make clean
  make COPTS="${CFLAGS}" CXXOPTS="${CXXFLAGS}"
  mv ddb_lyricbar_gtk2.so.save ddb_lyricbar_gtk2.so
}

package() {
  cd "${_pkgname}"
  make prefix="${pkgdir}/usr" install
}
