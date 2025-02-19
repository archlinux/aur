pkgname='stork-server'
pkgver='2.1.1'
pkgrel='1'
pkgdesc="A dashboard for BIND 9 and Kea DHCP."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('java-runtime' 'python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork')
_repo='stork'
source=(
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz"
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-server-ldap-${pkgver}.tar.gz"
  "${pkgname}.sysuser"
)
  # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
  # "https://gitlab.isc.org/isc-projects/stork-hook-ldap/-/archive/v${pkgver}/stork-hook-ldap-v${pkgver}.tar.gz"
sha512sums=(
  'b77a37592ce0d70037783c7511287a150e46feca814496126cfffb4917c9c555e3f4da77ebfa30be0db9fdc3a8889112884f6356d9ae5f196cd0c6479adacb49'
  '724b8462f4006a28e62e1c67f66bf9aab64d6b8c9c108b85f5917e2cd382fc81c304c6dc28c1611036c8e2366d7ba822a20a73f8e0cd9a1f1be86fe24591c23a'
  '524a319ab3b938bdab902b82c99744dcbf90cf5b44dc2bc7003b5fac7b77f6bb07d260c7f5cdd3fee8d3f673ca23611b00d1ded27a96da6fcb85d16e70b7a580'
)

build() {
  tar -xzf "${_repo}-${pkgver}.tar.gz"
  tar -xzf "${_repo}-server-ldap-${pkgver}.tar.gz"
  cd "${_repo}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath'
  rm -rf ./hooks/stork-server-ldap
  cp -rf "../${_repo}-server-ldap-${pkgver}/" ./hooks/stork-server-ldap
  rake build:server
  rake hook:build
  cd ..
}

package() {
  cd "${_repo}-${pkgver}"
  rake install:server DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
  install -Dm644 "./hooks/stork-server-ldap/build/stork-server-ldap.so" "${pkgdir}/usr/lib/stork-server-ldap.so"
  install -Dm644 "${srcdir}/${pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  cd ..
}
