pkgname='stork-agent'
pkgver='2.1.1'
pkgrel='1'
pkgdesc="The agent that monitors Kea DHCP and BIND 9 as part of ISC Stork."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork')
_repo='stork'
source=("https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz")
        # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
sha512sums=('b77a37592ce0d70037783c7511287a150e46feca814496126cfffb4917c9c555e3f4da77ebfa30be0db9fdc3a8889112884f6356d9ae5f196cd0c6479adacb49')

build() {
  tar -xzf "${_repo}-${pkgver}.tar.gz"
  cd "${_repo}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath'
  rake build:agent
  cd ..
}

package() {
  cd "${_repo}-${pkgver}"
  rake install:agent DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
  cd ..
}
