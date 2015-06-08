# Maintainer: d.woffinden
pkgname=z3-git
pkgver=4.4.0.r0.g7f6ef0b
pkgrel=1
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'python2')
optdepends=('python2: bindings for python2')
conflicts=('z3-bin' 'z3-codeplex')
provides=('z3')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=("$pkgname"::"git+$url")
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/z3-//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  python2 scripts/mk_make.py

  cd "$srcdir/$pkgname/build"
  make
}

package() {
  cd "$srcdir/$pkgname"
  # If we specify --prefix in build(), it tries to create
  # "$pkgdir/usr/lib/python2.7/dist-packages" immediately, which we can't have.
  python2 scripts/mk_make.py --prefix="$pkgdir/usr"

  cd "$srcdir/$pkgname/build"
  make install

  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Arch uses site-packages over dist-packages
  mv "$pkgdir/usr/lib/python2.7/dist-packages" "$pkgdir/usr/lib/python2.7/site-packages"

  # These are identical, so make a symlink and save 18M
  rm "$pkgdir/usr/lib/python2.7/site-packages/libz3.so"
  ln -s ../../libz3.so "$pkgdir/usr/lib/python2.7/site-packages/libz3.so"
}

