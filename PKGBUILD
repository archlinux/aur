# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-publicsuffix2
pkgver=2.20190812
_pkgver=2.2019-08-12
pkgrel=2
pkgdesc='Get a public suffix for a domain name using the Public Suffix List'
arch=(any)
url=https://github.com/nexb/python-publicsuffix2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$_pkgver.tar.gz::$url/archive/release-$_pkgver.tar.gz)
sha512sums=('e3d7484b19d4c8afe8cf93b9c5e8cc1782f81d84018458a18837b958794fe6e0e6bf3fdb940e60dcfc82a72f4517eb46baaae231a7fc280e03320bae39238b74')

pkgver() {
  echo ${_pkgver//-/}
}

build() {
  cd $pkgname-release-$_pkgver
  python setup.py build
}

check() {
  cd $pkgname-release-$_pkgver
  # Include local build
  sed -i "42s/^/import os\nsys.path.insert(0, os.path.join(os.path.dirname(__file__), 'build\/lib'))\n/" tests.py || warning "Tests failed"
  python tests.py
}

package() {
  cd $pkgname-release-$_pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 publicsuffix2.LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
