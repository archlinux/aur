# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="wipemychat"
pkgver=1.2.2
pkgrel=1
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/rusq/${pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b309c19e2d394c722a6198a2cca9f7ad5353c837ede12bc94031e1143a5dd600')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" .
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENCE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
