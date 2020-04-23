# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mylg-git
pkgver=0.2.6.r60.gfaba867
pkgrel=1
pkgdesc="myLG is an open source software utility which combines the functions of the different network probes in one network diagnostic tool"
arch=('x86_64')
url='http://mylg.io'
license=('MIT')
makedepends=('go-pie' 'git' 'dep')
source=("git+https://github.com/mehrdadrad/mylg")
sha256sums=('SKIP')

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