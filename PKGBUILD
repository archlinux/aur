# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_discord_presence
pkgname=deadbeef-plugin-discord-git
pkgver=r26.g70c06e1
pkgrel=1
pkgdesc="DeaDBeeF Discord rich presence plugin"
arch=('i686' 'x86_64')
url="https://github.com/kuba160/ddb_discord_presence"
license=('BSD')
depends=('deadbeef')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/kuba160/${_pkgname}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '2c234522f8854be7ca7222b4929b88259dda8638a62efe377985889bce5d4e84')

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
