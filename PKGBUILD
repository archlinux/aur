# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-lyricbar
pkgname=deadbeef-plugin-lyricbar-git
pkgver=r175.g5aaef21
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
        "${_pkgname}-makefile.patch"
        "${_pkgname}-formatsecurity.patch")
sha256sums=('SKIP'
            '67e2d837a79db509644f8cecaf8c425864a23d4170ba89ce7361fa172e5ffa72'
            '07ff228cde1c82272222542178f7404c475ca55d2953ccab7fbe08c319c011f1')

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

  # -Werror=format-security
  patch -p1 -i ../${_pkgname}-formatsecurity.patch

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
