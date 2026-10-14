pkgname='stork-server'
pkgver='2.6.0'
pkgrel='1'
pkgdesc="A dashboard for ISC BIND 9 DNS, ISC Kea DHCP, PowerDNS, and other services."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('java-runtime' 'python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork/server.env')
_repo='stork'
source=(
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz"
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-server-ldap-${pkgver}.tar.gz"
  "${pkgname}.sysuser"
)
  # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
  # "https://gitlab.isc.org/isc-projects/stork-hook-ldap/-/archive/v${pkgver}/stork-hook-ldap-v${pkgver}.tar.gz"
sha512sums=(
  '845ebc0ea2b9365a844b9124deb570d61ffe537c402ba16583081bd2e98a5e1a00c0a054a061fb610eaabb676aa58604c053c1218cb1bd4201e30ec2c07c4f29'
  'fe7f16f4a26348a78db67791aaa0280ba6c26376a409a78468f7be03928a122c1e025077c43564a27ecdd1256284011e1f0aefb2d13e395cb981463864cf7e93'
  '7bc58bdea15aebe457bebb2fb69d5ac4585e5dc6f5697e41f446860d418601ae9652a886f81b2e0d7c085ee643395d3aeabf88bdacbb3d1e41464162f17ab9dd'
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
  mv "${pkgdir}/lib" "${pkgdir}/usr"
  mkdir -p "${pkgdir}/usr/lib/stork-server/hooks"
  mkdir -p "${pkgdir}/usr/share"
  rmdir "${pkgdir}/hooks"
  install -Dm644 "./hooks/stork-server-ldap/build/stork-server-ldap.so" "${pkgdir}/usr/lib/stork-server/hooks/stork-server-ldap.so"
  install -Dm644 "${srcdir}/${pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  cd ..
}
