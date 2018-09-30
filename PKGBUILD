# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_discord_presence
pkgname=deadbeef-plugin-discord-git
pkgver=r22.g7d8c637
pkgrel=1
pkgdesc="DeaDBeeF Discord rich presence plugin"
arch=('i686' 'x86_64')
url="https://github.com/kuba160/ddb_discord_presence"
license=('BSD')
depends=('deadbeef-git')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/kuba160/${_pkgname}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '2abb2e87faafa82c2fb6f88c93068379dd70011ad9e28d1600ad98459331bf4a')

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

  make submodules_load
}

build() {
  cd "${_pkgname}"
  make COPT="${CFLAGS}" CXXOPT="${CXXFLAGS}"
}

package() {
  cd "${_pkgname}"
  install -m0755 -d "${pkgdir}/usr/lib/deadbeef"
  make PREFIX="${pkgdir}/usr/lib/deadbeef" install
}
