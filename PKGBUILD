# Maintainer: RiverOnVenus <error@zhui.dev>
# Contributor: Sean V Kelley <seanvk@posteo.de>
pkgname=jitterdebugger-git
pkgver=0.3.r70.g045a274
pkgrel=1
pkgdesc="Real time response measurement tool"
arch=('i686' 'x86_64')
url="https://github.com/igaw/jitterdebugger"
license=('MIT')
depends=(
  'glibc'
  'python3'
  'python-pandas'
  'python-numpy'
  'python-matplotlib'
  'hdf5>=1.8.17'
  )
makedepends=('git')
provides=(
  'jitterdebugger'
  'jitterplot'
  'jittersamples'
  )
conflicts=('jitterdebugger')
options=('!emptydirs')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/JSCC = h5cc -shlib/JSCC = h5cc/' Makefile
  sed -i 's|$(JSCC) \$\^ -o \$@|$(JSCC) $^ -lhdf5_hl -o $@|' Makefile
}


build() {
  export LD_RUN_PATH='$ORIGIN/lib/'
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
  unset LD_RUN_PATH
}

package() {
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/man/jitterdebugger.1" "$pkgdir/usr/share/man/man1/jitterdebugger.1"
  install -Dm644 "$srcdir/$pkgname/man/jitterplot.1" "$pkgdir/usr/share/man/man1/jitterplot.1"
  install -Dm644 "$srcdir/$pkgname/man/jittersamples.1" "$pkgdir/usr/share/man/man1/jittersamples.1"
  install -Dm755 "$srcdir/$pkgname/jitterdebugger" "$pkgdir/usr/bin/jitterdebugger"
  install -Dm755 "$srcdir/$pkgname/jitterplot" "$pkgdir/usr/bin/jitterplot"
  install -Dm755 "$srcdir/$pkgname/jittersamples" "$pkgdir/usr/bin/jittersamples"
}
