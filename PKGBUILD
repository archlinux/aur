# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=packer-builder-arm-image
_pkgname=packer-plugin-arm-image
pkgver=0.2.6
pkgrel=1
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/${_pkgname}"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-user-static')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('d34a7cdb00263ebcbfc78fcf32cf47d7d4880f525747feef6177ceb320c93c9745dcb8e443d406b141bfc3389f52fc60cb14e616c6b02b8d38ebc1b2c3d40c1c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # From https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
  go mod download
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\"" \
    -mod=readonly \
    -modcacherw \
    -o ${_pkgname} \
    .
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
