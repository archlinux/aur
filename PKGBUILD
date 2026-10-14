pkgname='stork-agent'
pkgver='2.6.0'
pkgrel='1'
pkgdesc="The agent that monitors ISC BIND 9 DNS, ISC Kea DHCP, and other services as part of ISC Stork."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('go' 'nodejs' 'protoc-gen-go' 'protoc-gen-go-grpc' 'python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork/agent.env')
_repo='stork'
source=(
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz"
  "${pkgname}.sysuser"
)
        # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
sha512sums=(
  '845ebc0ea2b9365a844b9124deb570d61ffe537c402ba16583081bd2e98a5e1a00c0a054a061fb610eaabb676aa58604c053c1218cb1bd4201e30ec2c07c4f29'
  '5a1ff88f2e64db884696c7c86aa0d119caa9a7ae3dd0d9ab9c750281353100af7f96ff0af642489002e2d01fa623fd173762078b27b9caf5e7f4aacee08eea48'
)

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
  install -Dm644 "${srcdir}/${pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  cd ..
}
