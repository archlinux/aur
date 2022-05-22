# Maintainer: Jakub Wasylków <kuba_160@protonmail.com>
# Contributor: Andreas "Cocaine Johnsson" Björkman <akb95@disroot.org>
# Contributor: Deposite Pirate <dpirate at metalpunks dot info>

_pkgname=ddb_discord_presence
pkgname=deadbeef-plugin-discord-git
pkgver=r51.g18103a9
pkgrel=1
pkgdesc="DeaDBeeF Discord rich presence plugin"
arch=('i686' 'x86_64')
url="https://github.com/kuba160/ddb_discord_presence"
license=('ZLIB', 'MIT')
depends=('deadbeef')
makedepends=('git' 'wget')
source=("${_pkgname}::git+https://github.com/kuba160/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  make submodules_load
  make discord-rpc-patch
}

build() {
  cd "${_pkgname}"
  ( cd discord-rpc ; make thirdparty/rapidjson-1.1.0 )
  make COPT="${CFLAGS}" CXXOPT="${CXXFLAGS}" libdiscord-rpc.a
  make COPT="${CFLAGS}" CXXOPT="${CXXFLAGS}" discord_presence
}

package() {
  cd "${_pkgname}"
  install -m0755 -d "${pkgdir}/usr/lib/deadbeef"
  make PREFIX="${pkgdir}/usr/lib/deadbeef" install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSES/*
  sed -n '/## License/,$ p' README.md > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
