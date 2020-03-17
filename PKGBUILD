# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=python-boto
pkgver=2.49.0.20190327
_commit=9e1cd3bd76e738d80630f1bd9160fd87c8eab865
pkgrel=3
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-requests' 'python-httpretty')
source=("$pkgname-$_commit.tar.gz::https://github.com/boto/boto/archive/$_commit.tar.gz"
         boto-python-3.8.patch)
sha512sums=('a68b7560caef3328970b9d1febc77fb28e537e4012b692b492d69428aca7deccf539e883cba4975497059ccdc56452f6e46f4a101b6e93f007667fe45c842e24'
            '3e32db201adb637d3b6041f9e7be65889f1306042cbed36e4884207cbf772dc8f7691be9a505ec79f111b99c8313e0d42436c1f9a2dfa095de6cc77a7fe4bc6d')

prepare() {
  mv boto-{$_commit,$pkgver}
  (cd boto-$pkgver
   patch -p1 -i ../boto-python-3.8.patch # Fix escaping with python 3.8
  )
}

check() {
  cd "$srcdir"/boto-$pkgver
  python tests/test.py default
}

package() {
  cd boto-$pkgver

  python setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  
  # Remove (somewhat deprecated) python 2 tools.
  rm -r "$pkgdir"/usr/bin
}
