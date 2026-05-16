# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=sshportal
pkgver=1.30.12
pkgrel=5
pkgdesc="Transparent SSH bastion daemon"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/alterway/sshportal'
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'sshportal.service'
        'sshportal.confd')
sha256sums=('3c5abc89c47fd115190dbdad0ff3a4b5fb00eae32cb73b02c092a6d64eb997dd'
            'bd5294d5d810491e15d7010e26128a415f0c0ce6e88f162f24efe4df5e3d0380'
            'ebe1be4e1e6911a154e0e0f2b1e289b20260774dbab9186c067e2ad11dfc86d0')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${srcdir}/gomodcache"
  go clean -modcache
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "${pkgname}-${pkgver}"
  go build -v -o sshportal \
  -buildmode=pie \
  -trimpath \
  -mod=readonly \
  -modcacherw \
  -ldflags="-linkmode external" \
  .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 sshportal -t "${pkgdir}/usr/bin"

  install -Dvm644 "${srcdir}/sshportal.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -Dvm644 "${srcdir}/sshportal.confd" \
    "${pkgdir}/etc/conf.d/sshportal"

  install -Dvm644 AUTHORS -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
