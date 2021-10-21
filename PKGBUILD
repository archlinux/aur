# Maintainer: Wil Thomason <wbthomason at cs dot cornell dot edu>

pkgname='python-scalene-git'
pkgver=r2002.1fea191
pkgrel=1
pkgdesc='Scalene is a high-performance, high-precision CPU and memory profiler for Python'
arch=('any')
url='https://github.com/emeryberger/scalene'
license=('Apache-2.0')
depends=('python>=3.7' 'python-numpy' 'python-cloudpickle' 'python-rich' 'python-pynvml')
makedepends=('python-setuptools' 'make' 'clang' 'git')
source=("${pkgname}::git+https://github.com/emeryberger/scalene.git"
        "git+https://github.com/emeryberger/Heap-Layers")
sha256sums=('SKIP' 'SKIP')
provides=('python-scalene')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"
  ln -s "$srcdir/Heap-Layers" Heap-Layers
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 scalene/libscalene.so ${pkgdir}/usr/lib/libscalene.so
  python setup.py install --root="${pkgdir}" --optimize=1
}
