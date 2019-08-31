# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_discord_presence
pkgname=deadbeef-plugin-discord-git
pkgver=r24.g07beb73
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
            '967ae7feb4416b196db7a1e4b32cff779c6d96e4a6009a85e41d160486681d34')

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
