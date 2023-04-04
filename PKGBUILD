# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Former Maintainer:  Thorsten Töpper <atsutane-tu@freethoughts.de>
# Maintainer: ParaSait <parasait at proton dot me>

pkgname=mathomatic
pkgver=16.0.5
pkgrel=9
pkgdesc='General purpose Computer Algebra System written in C'
arch=('x86_64')
license=('LGPL')
url="http://mathomatic.orgserve.de/math/"
depends=('readline')
makedepends=('python')
checkdepends=('time')
optdepends=('python: for running /usr/share/doc/mathomatic/factorial/factorial'
            'bash: for running a test script'
            'm4: for complex operations using the matho script'
            'rlwrap: for readline editing'
            'gnuplot: for plotting')
# The original author is dead and the projects site no longer exists. Uploaded a backup copy.
source=('https://github.com/Atsutane/mathomatic/raw/master/mathomatic-16.0.5.tar.bz2')
sha256sums=('976e6fed1014586bcd584e417c074fa86e4ca6a0fcc2950254da2efde99084ca')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  2to3 -wn examples/factorial primes/{matho-mult,matho-sum,primorial}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make READLINE=1
  cd primes
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
  cd primes
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir"/usr m4install
  sed -i 's+/build/pkg++' "$pkgdir"/usr/bin/matho

  cd primes
  make prefix="$pkgdir"/usr install
  sed -i "s+$pkgdir++" "$pkgdir/usr/bin/matho"
}

# vim:set ts=2 sw=2 et:
