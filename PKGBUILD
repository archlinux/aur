# Maintainer: soh @ AUR

pkgname=tun2socks-git
_pkgname=tun2socks
pkgver=v2.5.1.r0.g7ab86fd
pkgrel=1
pkgdesc='create a network interface which passes all traffic through proxy'
arch=('x86_64')
url='https://github.com/xjasonlyu/tun2socks'
license=('GPL3')
depends=()
source=('git+https://github.com/xjasonlyu/tun2socks')
makedepends=('go' 'git' 'make')
optdepends=()
backup=()
b2sums=('SKIP')
provides=('tun2socks')
conflicts=('tun2socks' 'tun2socks-bin')


pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${srcdir}/${_pkgname}
  GO111MODULE=on CGO_ENABLED=0 go build -v \
        -buildmode=pie -trimpath -mod=readonly -modcacherw \
        -tags "full" \
        -ldflags="-s -w -extldflags=-Wl,-z,now,-z,relro" \
        -o tun2socks
}

package(){
  cd ${srcdir}/${_pkgname}
  install -Dm755 tun2socks ${pkgdir}/usr/bin/tun2socks
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/tun2socks/LICENSE
}
