# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=speedtest-zpeters
_pkgver=1.0.3-a
pkgver=1.0.3a+8748f9a
pkgrel=5
pkgdesc='Command line client for speedtest.net written in Go'
url=https://github.com/zpeters/speedtest
arch=('any')
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-${_pkgver//-}.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "fix-typo-that-set-wrong-upload-speeds.patch::$url/commit/8748f9a95838fb31ba6fac973c47b7973c722cdd.patch")
sha512sums=('9b5222e2b2287afd808d90306761021551a1aa073506efca7dd14e33433c098b32a3933328d293f0ead500fbe546f94ee2a18c1eef48a126373d49063af4c73d'
            'f3371f5b678dc9879455f022330adb3ae0dc48252e7287a1ece5f6e840c9f7e951f6ef2d4e59ec288c8fb0a8cddec56782e0510fd4168298020d4798970ad6c1')

prepare() {
  mkdir -p src/github.com/zpeters
  ln -fnrs speedtest-$_pkgver src/${url#*//}
  cd speedtest-$_pkgver
  patch -p1 -i ../fix-typo-that-set-wrong-upload-speeds.patch
}

build() {
  cd speedtest-$_pkgver
  export GOPATH="$srcdir"
  go get -u -v github.com/{dchest/uniuri,google/go-github/github,spf13/viper,urfave/cli}
  make VERSION=$pkgver
}

check() {
  cd speedtest-$_pkgver
  export GOPATH="$srcdir"
  go get -u -v github.com/stretchr/testify/assert
  go test ./...
}

package() {
  cd speedtest-$_pkgver
  install -Dm755 bin/speedtest-$pkgver "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
