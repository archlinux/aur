# Maintainer: Beej Jorgensen <beej@beej.us>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=trn
_filever=4.0-test77
pkgver=4.0test77
pkgrel=8
pkgdesc="Text-based threaded Usenet newsreader"
arch=('i686' 'x86_64')
url="http://trn.sourceforge.net/"
license=('LicenseRef-trn')
depends=('ncurses' 'libnsl' 'libnet')
makedepends=('patch' 'expect' 'bison')
optdepends=('aspell: spellcheck support'
  'sendmail: (or any outgoing mailer) outgoing email support')
source=("http://downloads.sourceforge.net/trn/${pkgname}-${_filever}.tar.gz" 
        "${pkgname}-${_filever}-aur.patch")
sha256sums=('9ab0430244903ad86ed74fcc2fdc39dc043d23968888e071313050a967b8a6ff'
            '137770df753c476b0028b47ff83c7bad3ad68196b105a6d49ab609514ebf97b8')

prepare() {
  cd "$srcdir/${pkgname}-${_filever}"

  # This patch is against Beej's trn update[1]. It doesn't change any
  # logic; it modernizes the code so it builds.
  #
  # [1] https://github.com/beejjorgensen/trn-4.0-test77
  patch -Np1 < ${srcdir}/${pkgname}-${_filever}-aur.patch

  # The patch includes an expect script to autoconfigure
  TRN_CONFIG_BUFTEST_NOSLEEP=1 expect -f configbot.archlinux
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

