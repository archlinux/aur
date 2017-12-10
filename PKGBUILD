# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=mumudvb
_gitname=MuMuDVB
pkgver=2.1.0
pkgrel=1
pkgdesc="Redistribute a stream from DVB on a network in multicast or in HTTP unicast"
arch=(i686 x86_64 armv7h)
url="http://www.mumudvb.net/"
license=('GPL2')
depends=('glibc')
source=("https://github.com/braice/${_gitname}/archive/${pkgver}.zip"
        "mumudvb.conf")
install="mumudvb.install"
sha256sums=('43706f0d899cebc934dc7a2076497d221b44464b4d986dc263dd2a6c91ae9088'
            'abe3c74a528f59b990e18f91858cb9bb9dd61c715c8904eb561aa7ee4cb79281')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  # Needed for development snapshots
  autoreconf -i -f

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # systemd tmpfile configuration
  install -D -m 0644 ${srcdir}/mumudvb.conf ${pkgdir}/usr/lib/tmpfiles.d/mumudvb.conf

  # docs
  install -d -m 0755 ${pkgdir}/usr/share/doc/mumudvb
  install -d -m 0755 ${pkgdir}/usr/share/man/man8
  cp -r doc/* ${pkgdir}/usr/share/doc/mumudvb/
  mv ${pkgdir}/usr/share/doc/mumudvb/mumudvb.8 ${pkgdir}/usr/share/man/man8
  rm ${pkgdir}/usr/share/doc/mumudvb/Makefile*
}

# vim:set ts=2 sw=2 et:
