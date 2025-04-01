# Maintainer: Beej Jorgensen <beej@beej.us>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=trn
_filever=4.0-test77
pkgver=4.0test77
pkgrel=7
pkgdesc="Text-based threaded Usenet newsreader"
arch=('i686' 'x86_64')
url="http://trn.sourceforge.net/"
license=('LicenseRef-proprietary')
depends=('ncurses' 'libnsl')
makedepends=('patch' 'expect' 'bison')
optdepends=('aspell: spellcheck support'
  'sendmail: (or any outgoing mailer) outgoing email support')
source=("http://downloads.sourceforge.net/trn/${pkgname}-${_filever}.tar.gz" 
        "${pkgname}-${_filever}-aur.patch"
        "configbot")
install=${pkgname}.install
sha512sums=('9b76ba004fb47dfd162afcfec51630431e8ad7099e5151d4a21b55c8fa670227d6e0756029e57312872c8f4ea986112af50508144caf59adb065212a661f408a'
            '731ec965dd25cf50ce291c7f1002f6d1f40e8e31b678fc6b616ebbaa1fcaf9b9ff69dc567610350e1977692b6bcb3e721bf8adab9cf1d86895b663cc5141208c'
            '2509ee69a54ca05fb15d2936d0f6da6332a6bc4fcf97bd572b6d4eab545b892586a4798db85cde689aa7015a89ce21c3e5b1a16bb73ea2ca7d95bb5f26b0902c')

prepare() {
  cd "$srcdir/${pkgname}-${_filever}"

  # fixes in include order to allow builds, and a fix to allow aspell
  # to be used as the speller:
  patch -Np1 < ${srcdir}/${pkgname}-${_filever}-aur.patch

  # the Configure script is very very interactive, so we
  # let expect handle it.  This expect script runs the
  # Configure script:
  expect -f $srcdir/configbot
}

build() {
  cd "$srcdir/${pkgname}-${_filever}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${_filever}"

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

