# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
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
            '137e78e144b6f43bd3469758c5b0f6d82fe3fc08c2121903b98dd8e4e3a9498d')

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
