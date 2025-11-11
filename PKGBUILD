# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-lyricbar
pkgname=deadbeef-plugin-lyricbar-git
pkgver=r195.gf6b939b
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
            'c78f6e9e84c4ea09f0e31609e434928ac16a6b7a01cec22ac8b86905743bd3f0')

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
