# Maintainer: Daniel Landau <daniel.landau@iki.fi>
# Co-Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

pkgname=thunderbird-enigmail
pkgver=2.0.8
pkgrel=1
pkgdesc="Thunderbird extension that enables sending and receiving signed and encrypted e-mail messages"
arch=('any')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('thunderbird>=38' 'gnupg>=2.0.7')
makedepends=('zip' 'python2' 'perl>=5.8')
source=("https://www.enigmail.net/download/source/enigmail-${pkgver}.tar.gz"{,.asc}) # gpg --recv-keys 9369CDF3 DD5F693B
validpgpkeys=('10B2E4A0E718BB1B2791DAC4F040E41B9369CDF3'
              '4F9F89F5505AC1D1A260631CDB1187B9DD5F693B')
sha512sums=('9d2e95c2eae6ca22897eb8b2961964d96fd633e7d33a8c0c04a29b4cbc8585777598578abfb0484b96827ca165fe9c8b873e5e7f7cb3ba8cd0779ddc4f10e305'
            'SKIP')

build() {
  cd "$srcdir/enigmail"
  PYTHON=/usr/bin/python2 ./configure
  make -j1 # fails with -j greater than 1
}

package() {
  cd "$srcdir/enigmail"
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' package/install.rdf)"
  install -d -m755 "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"
  cd "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"
  bsdtar -xf "$srcdir"/enigmail/build/enigmail-*.xpi

  # Uncomment the following lines if you use thunderbird-nightly
  # install -d -m755 "$pkgdir"/opt/thunderbird-nightly-*/extensions/"$emid"
  # cd "$pkgdir"/opt/thunderbird-nightly-*/extensions/"$emid"
  # unzip "$srcdir"/enigmail/build/enigmail-*.xpi
}
