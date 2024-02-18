# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=packer-plugin-arm-image
pkgver=0.2.7
pkgrel=1
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/${pkgname}"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-user-static' 'packer')
makedepends=('go')
replaces=('packer-builder-arm-image')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('320a2d54644a61e1c3e02caccea3ff1833e0ad411ec329edcbce94fb68f6fb4ac83e09c3120055ebf8eeccafac89e775bfab529924f05eadd8bcfa7c189c2c9e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
