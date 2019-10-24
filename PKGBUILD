# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-lyricbar
pkgname=deadbeef-plugin-lyricbar-git
pkgver=r66.g003b85a
pkgrel=1
pkgdesc="DeaDBeeF lyric bar plugin"
arch=('i686' 'x86_64')
url="https://github.com/loskutov/deadbeef-lyricbar"
license=('MIT')
depends=('deadbeef' 'libxml++')
optdepends=('gtkmm3' 'gtkmm')
makedepends=('git')
source=("${_pkgname}::git+${url}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '7c3088f5e4f703aca04011158e27087643410a189c2dcbb1fbd65fdbca8b216f')

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
