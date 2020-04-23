# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=copy-pasta-git
pkgver=0.0.1.r28.g954489a
pkgrel=1
pkgdesc="Universal copy paste service, works across different machines"
arch=('x86_64')
url='https://github.com/jutkko/copy-pasta'
license=('MIT')
provides=("${pkgname%-git}")
makedepends=('git' 'dep' 'go-pie')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/github.com/${pkgname%-git}
  ln -rTsf ${pkgname%-git} gopath/src/github.com/${pkgname%-git}/${pkgname%-git}
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname%-git}/${pkgname%-git}
  dep init -v
  dep ensure -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname%-git}/${pkgname%-git}
  go install -v .
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}