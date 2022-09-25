# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli
_binname=privatebin
pkgver=1.1.1
pkgrel=2
pkgdesc='CLI for privatebin server'
arch=('x86_64')
url='https://github.com/gearnode/privatebin'
license=('ISC')
conflicts=("${pkgname}-git")
makedepends=('go' 'pandoc')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "add_custom_user_agent.patch")
sha256sums=('84565e748a59495a8bc10a00e841eb24a4d245769da18200c32693841523e2e3'
            '5ca9790d62ece94cb5a47e19bb873afe6911b1c3d8d0762732ffe3c5a04be172')

prepare() {
  cd $_binname-$pkgver
  patch -p1 --input="../add_custom_user_agent.patch"
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
