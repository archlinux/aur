# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=oxen-core
pkgver=10.4.1
pkgrel=1
pkgdesc='oxend and oxen cli wallets'
url='https://github.com/oxen-io/oxen-core'
arch=('x86_64')
license=('custom')
options=('!buildflags')
makedepends=('git' 'cmake' 'boost' 'zeromq' 'sqlite' 'libsodium' 'curl')
_sha='80968bfdedc47dce0dd4c9b32574359833123700'
source=("${pkgname}-git::git+${url}.git#commit=${_sha}")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}-git"
  git submodule update --init --recursive
}

build() {
  cmake -B build -S "${pkgname}-git" \
    -D CMAKE_BUILD_TYPE:STRING='Release' \
    -D CMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  # It is install 'bin' with 'SQLiteCpp *.h' files, but need only 'bin'
  # DESTDIR="${pkgdir}" cmake --install build

  install -d -m755 "${pkgdir}/usr/bin"
  cp -r "build/bin/." "${pkgdir}/usr/bin"

  install -D -m644 "${pkgname}-git/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
