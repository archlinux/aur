# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Emile Pesik <emile [at] aerion [dot] co [dot] uk>

pkgname=rephrase
pkgver=0.2
pkgrel=4
_debianrel=4
pkgdesc='A specialized passphrase recovery tool for GnuPG.'
arch=('i686' 'x86_64')
url='https://packages.debian.org/sid/rephrase'
depends=('gnupg')
optdepends=('cryptsetup: can recover Cryptsetup/LUKS passphrases')
license=('GPL3', 'GPL2')
source=("https://deb.debian.org/debian/pool/main/r/rephrase/${pkgname}_${pkgver}.orig.tar.gz"
  "https://deb.debian.org/debian/pool/main/r/rephrase/${pkgname}_${pkgver}-${_debianrel}.debian.tar.xz")
md5sums=('d73b9b30194f3ebbf92f19737a62ddfa'
  '790197413e1c4bbacb3894d625c2b029')

prepare() {
  for p in debian/patches/*.patch; do
    patch -d ${pkgname}-${pkgver} -p1 < $p
  done
}

build() {
  cd ${pkgname}-${pkgver}
  make GPG=/usr/bin/gpg
}

package() {
  cd ${pkgname}-${pkgver}
  make BINDIR="${pkgdir}/usr/bin" DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING ../debian/copyright -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 ../debian/${pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
