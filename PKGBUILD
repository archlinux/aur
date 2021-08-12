# Maintainer: Andreas "Cocaine Johnsson" Björkman <akb95@disroot.org>
# Contributor: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_discord_presence
pkgname=deadbeef-plugin-discord-git
pkgver=r34.g0c2fa68
pkgrel=1
pkgdesc="DeaDBeeF Discord rich presence plugin"
arch=('i686' 'x86_64')
url="https://github.com/kuba160/ddb_discord_presence"
license=('BSD')
depends=('deadbeef')
makedepends=('git' 'wget')
source=("${_pkgname}::git+https://github.com/kuba160/${_pkgname}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '5f9f2a604c20f0ea877542c2dcc7cc3d5372b026f310bdfd65214664452683a9')

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
  make discord-rpc-patch
}

build() {
  cd "${_pkgname}"
  ( cd discord-rpc ; make thirdparty/rapidjson-1.1.0 )
  make COPT="${CFLAGS}" CXXOPT="${CXXFLAGS}"
}

package() {
  cd "${_pkgname}"
  install -m0755 -d "${pkgdir}/usr/lib/deadbeef"
  make PREFIX="${pkgdir}/usr/lib/deadbeef" install
}
