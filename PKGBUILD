# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=oxen-core
pkgver=10.3.0
pkgrel=1
pkgdesc='Oxen core containing oxend and oxen cli wallets '
url='https://github.com/oxen-io/oxen-core'
arch=('x86_64')
license=('custom')
options=('!buildflags')
makedepends=('git' 'cmake' 'boost' 'zeromq' 'sqlite' 'libsodium' 'curl')
conflicts=('oxen-core-bin' 'loki-core-git')
_commit=b309bf8bb65dc28dca8b79f0b0721a4babb1c72a
source=("${pkgname}-git::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

# Tags can be force pushed or deleted. Ensure the commit contains the tag.
_check_tag() {
  tag=$(git tag --contains "${_commit}")
  if [[ "${tag}" != "v${pkgver}" ]]; then
    echo "Commit [${_commit}] must contains tag [v${pkgver}], but contains [${tag}]"
    exit 1
  fi
}

prepare() {
  cd "${pkgname}-git"
  _check_tag
  git submodule update --init --recursive
}

build() {
  cmake -B build -S "${pkgname}-git" \
    -D CMAKE_BUILD_TYPE:STRING='Release' \
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
