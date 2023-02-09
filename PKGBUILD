# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli
_binname=privatebin
pkgver=1.4.0
pkgrel=1
pkgdesc='CLI for privatebin server'
arch=('x86_64')
url='https://github.com/gearnode/privatebin'
license=('ISC')
conflicts=("${pkgname}-git")
makedepends=('go' 'pandoc')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b957e7363618df1fe74b1b663d9a7d73c2b851736cb47e96d563ae4765dd3f58')

prepare() {
  cd $_binname-$pkgver
  pandoc --standalone --to man doc/privatebin.1.md -o privatebin.1
  pandoc --standalone --to man doc/privatebin.conf.5.md -o privatebin.conf.5
}

build() {
  cd $_binname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $_binname "cmd/privatebin/main.go"
}

package() {
  cd $_binname-$pkgver
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 privatebin.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 privatebin.conf.5 -t "${pkgdir}"/usr/share/man/man5/
}
