# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=packer-builder-arm-image
pkgver=0.1.6
pkgrel=1
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/${pkgname}"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-user-static')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('73160cb96ca6ed059c89deab73df2647e4b96399084b98339a185aa574e26922')

prepare() {
  mkdir -p src/github.com/solo-io/
  ln -rTsf "${pkgname}-${pkgver}" "src/github.com/solo-io/${pkgname}"
}

build() {
  export GOPATH="${srcdir}"
  cd "src/github.com/solo-io/${pkgname}"
  go install \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/src/github.com/solo-io/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
