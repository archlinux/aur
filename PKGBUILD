# Maintainer: d.woffinden
pkgname=z3-git
pkgver=4.4.1.r1416.g8370bb8
pkgrel=1
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'python')
optdepends=('python: bindings for python')
conflicts=('z3' 'z3-bin' 'z3-codeplex')
provides=('z3')
source=("$pkgname"::"git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/z3-//;s/-/.r/;s/-/./'
}

build() {
  # /usr/lib/python3.5/site-packages
  pypath=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

  # TODO: optionally generate Java/.NET/OCaml bindings?

  cd "$srcdir/$pkgname"
  python scripts/mk_make.py --python --prefix="$pkgdir/usr" --pypkgdir="$pkgdir$pypath"

  cd "$srcdir/$pkgname/build"
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make install

  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

