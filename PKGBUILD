# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Olivier Biesmans <o dot archlinux at biesmans dot fr>

pkgname=certigo
pkgver=1.14.1
pkgrel=1
pkgdesc='A utility to examine and validate certificates in a variety of formats'
arch=('x86_64' 'i686')
url='https://github.com/square/certigo'
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3ed30adc63869fcbded9bff51e07eaadb08c243980ee08f18858cb6c2a86d232')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
  export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
