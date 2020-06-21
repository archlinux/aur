# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=packer-builder-arm-image
pkgver=0.1.6
pkgrel=2
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/${pkgname}"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-user-static')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('e563eb298286bc990bbb26e58944c37aec688eded6ea84300156e6e663888de8b29bdd7bb867ac0acc3f7d8dd6733d6cceded777d42ffa0767885aca157a0313')

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
