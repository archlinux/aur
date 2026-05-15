# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-lyricbar
pkgname=deadbeef-plugin-lyricbar-git
pkgver=r197.gcf9f821
pkgrel=1
pkgdesc="DeaDBeeF lyric bar plugin"
arch=('i686' 'x86_64')
url="https://github.com/AsVHEn/deadbeef-lyricbar"
license=('MIT')
provides=('deadbeef-plugin-lyricbar')
conflicts=('deadbeef-plugin-lyricbar')
depends=('deadbeef' 'gtkmm3' 'curl')
makedepends=('git' 'pkgconf' 'taglib')
source=("${_pkgname}::git+${url}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '226daee6935c5826d0ad1cefc5671b1c667352017605c852a962b49a727f84c8')

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

  # Fucked up Makefile
  glib-compile-resources --generate-source src/resources.xml
  glib-compile-resources --generate-header src/resources.xml
}

build() {
  cd "${_pkgname}"
  make COPTS="${CFLAGS}" CXXOPTS="${CXXFLAGS}"
}

package() {
  cd "${_pkgname}"
  make prefix="${pkgdir}/usr" install
}
