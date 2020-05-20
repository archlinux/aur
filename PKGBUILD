# Maintainer: Wil Thomason <wbthomason at cs dot cornell dot edu>

pkgname='python-scalene-git'
pkgver=r461.822c83d
pkgrel=2
pkgdesc='Scalene is a high-performance, high-precision CPU and memory profiler for Python'
arch=('any')
url='https://github.com/emeryberger/scalene'
license=('Apache-2.0')
depends=('python>=3.6' 'python-numpy')
makedepends=('python-setuptools' 'make' 'clang' 'git')
source=("${pkgname}::git+https://github.com/emeryberger/scalene.git")
sha256sums=('SKIP')
provides=('python-scalene')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"
  if [ ! -d Heap-Layers ] || [ -z "$(ls -A Heap-Layers)" ]; then
    git clone https://github.com/emeryberger/Heap-Layers
  fi
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 libscalene.so ${pkgdir}/usr/lib/libscalene.so
  python setup.py install --root="${pkgdir}" --optimize=1
}
