pkgname='stork-agent'
pkgver='2.0.0'
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
sha512sums=('e80557289a2b4f7bd997de319951ba2d777131ac78b3ccbd0692da66482b2e518346571f55f0ac76d9bbc5fa39efb7e5d439382ed34643708b683b20a8ee68de')

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
