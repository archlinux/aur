# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=sqlite-vec
pkgname=python-$_name
pkgver=0.1.6
pkgrel=2
pkgdesc='A vector search SQLite extension that runs anywhere!'
arch=('x86_64' 'aarch64')
url='https://github.com/asg017/sqlite-vec'
license=('MIT OR Apache-2.0')
depends=('python' 'python-numpy' 'glibc')
makedepends=('python-installer' 'gcc' 'sqlite-dist')
checkdepends=('python-pytest' 'python-syrupy')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2df2c99d8ac53f88b0944bbca078993b348ae3f1a164bc97570d47b9563effea')

prepare(){
  cd "$srcdir"/$_name-$pkgver
  sed -i "s/select * from pragma_table_list where type = \'shadow\'/select * from pragma_table_list where type = \'shadow\' order by name/g" tests/test-general.py
}

build(){
  cd "$srcdir"/$_name-$pkgver
  make loadable
  mkdir -p dist/linux-$CARCH
  mv dist/vec0.so dist/linux-$CARCH/
  sqlite-dist sqlite-dist.toml --input dist/ --output distx/ --version $pkgver
}

check(){
  cd "$srcdir"/$_name-$pkgver
  make test-loadable-snapshot-update python=python
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" distx/pip/*.whl
}
