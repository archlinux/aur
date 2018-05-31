# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

pkgname=icedove-enigmail
pkgver=2.0.6.1
pkgrel=1
pkgdesc="Icedove extension that enables sending and receiving signed and encrypted e-mail messages"
arch=('any')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('icedove>=38' 'gnupg>=2.0.7')
makedepends=('zip' 'python2' 'perl>=5.8')
source=("https://www.enigmail.net/download/source/enigmail-${pkgver}.tar.gz"{,.asc}) # gpg --recv-keys 9369CDF3 DD5F693B
validpgpkeys=('10B2E4A0E718BB1B2791DAC4F040E41B9369CDF3'
              '4F9F89F5505AC1D1A260631CDB1187B9DD5F693B')
sha512sums=('231e17f207d021d4a73b00abd1697003d7fc644df73c7e5ea8e83340ef011a3a627a9ac48ce3acb60e4cb415ee2038d294258173f9def01dd48d52ab6fc3669a'
            'SKIP')

build() {
  cd "$srcdir/enigmail"
  PYTHON=/usr/bin/python2 ./configure
  make -j1 # fails with -j greater than 1
}

package() {
  cd "$srcdir/enigmail"
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' package/install.rdf)"
  install -d -m755 "$pkgdir"/usr/lib/icedove/extensions/"$emid"
  cd "$pkgdir"/usr/lib/icedove/extensions/"$emid"
  bsdtar -xf "$srcdir"/enigmail/build/enigmail-*.xpi
}
