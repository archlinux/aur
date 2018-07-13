# Maintainer Daichi Shinozaki <dsdseg@gmail.com>
pkgname=nodejs-nan
_pkgname=${pkgname#nodejs-}
pkgver=2.10.0
pkgrel=1
pkgdesc="Native Abstractions for Node.js"
arch=('any')
url="http://github.com/rvagg/nan"
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('3859b4cc9bfba3a6d16227ca7d66132691f42b24850f971f56b7a5225143cd2b')

prepare() {
  cd "$srcdir"
  tar -zxvf $pkgname-$pkgver.tar.gz $_pkgname-$pkgver/LICENSE.md
}

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 "$srcdir"/$_pkgname-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
