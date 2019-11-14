# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=jitterdebugger-git
pkgver=r106.daeff0a
pkgrel=3
pkgdesc="Real time response measurement tool"
arch=('i686' 'x86_64')
url="https://github.com/igaw/jitterdebugger"
license=('MIT')
depends=('python3'
         'hdf5>=1.8.17')
makedepends=('git')
provides=('jitterdebugger'
          'jitterplot'
          'jittersamples')
options=('!emptydirs')
changelog=
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/igaw/jitterdebugger.git'
source=("$pkgname"::'git://github.com/igaw/jitterdebugger.git')
# Because the sources are not static, skip Git checksum:
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Since there are no tags currently on master, use number of revisions
  # since the beginning of history.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export LD_RUN_PATH='$ORIGIN/lib/'
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
  unset LD_RUN_PATH
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/man/jitterdebugger.1" "$pkgdir/usr/share/man/man1/jitterdebugger.1"
  install -Dm644 "$srcdir/$pkgname/man/jitterplot.1" "$pkgdir/usr/share/man/man1/jitterplot.1"
  install -Dm644 "$srcdir/$pkgname/man/jittersamples.1" "$pkgdir/usr/share/man/man1/jittersamples.1"
  install -Dm755 "$srcdir/$pkgname/jitterdebugger" "$pkgdir/usr/bin/jitterdebugger"
  install -Dm755 "$srcdir/$pkgname/jitterplot" "$pkgdir/usr/bin/jitterplot"
  install -Dm755 "$srcdir/$pkgname/jittersamples" "$pkgdir/usr/bin/jittersamples"
}
