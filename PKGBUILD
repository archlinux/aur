# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python38-uri-template
pkgver=1.2.0
pkgrel=1
pkgdesc='An implementation of RFC 6570 URI Templates'
arch=('any')
url='https://github.com/plinss/uri_template'
license=('MIT')
depends=('python38')
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-setuptools'
)
_commit='ae070b1716c853fbc5a3c879e6ef1d1cfb2c9533'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # below string is extracted from upstream's setup.py
  # version='0.0.0',  # version will get replaced by git version tag - do not edit
  sed -e "s:\(version='\)0.0.0:\1$pkgver:" -i setup.py
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python38 test.py
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
