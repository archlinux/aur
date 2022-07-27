# Maintainer: Beej Jorgensen <beej@beej.us>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=trn
pkgver=4.0test77
pkgrel=5
pkgdesc="Text-based threaded Usenet newsreader"
arch=('i686' 'x86_64')
url="http://trn.sourceforge.net/"
license=('custom')
depends=('heimdal' 'ncurses')
makedepends=('patch' 'expect' 'bison')
optdepends=('aspell: spellcheck support'
  'sendmail: (or any outgoing mailer) outgoing email support')
source=('http://downloads.sourceforge.net/trn/trn-4.0-test77.tar.gz' 
        'trn-4.0-test77-aur.patch' 'configbot')
install=trn.install
md5sums=('e0680ae4e6062747f88ba982326ac4c0'
         'cbe0903d86aa2a016093c0a2dd9604ef'
         '852f1309e9681bc340682484bd2322dc')

prepare() {
  cd "$srcdir/trn-4.0-test77"

  # fixes in include order to allow builds, and a fix to allow aspell
  # to be used as the speller:
  patch -Np1 < ${srcdir}/trn-4.0-test77-aur.patch

  # The heimdal library really shouldn't be here
  export LD_LIBRARY_PATH=/usr/heimdal/lib:$LD_LIBRARY_PATH

  # the Configure script is very very interactive, so we
  # let expect handle it.  This expect script runs the
  # Configure script:
  expect -f $srcdir/configbot
}

build() {
  cd "$srcdir/trn-4.0-test77"

  # build it!

  make
}

package() {
  cd "$srcdir/trn-4.0-test77"

  # install, forcing the paths to what was set in Configure:
  make \
    rnbin=${pkgdir}/usr/bin \
    rnlib=${pkgdir}/usr/lib/trn \
    inewsbin=${pkgdir}/usr/bin \
    mansrc=${pkgdir}/usr/share/man/man1 \
    install

  # custom license install
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

