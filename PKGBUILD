# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=mumudvb
_gitname=MuMuDVB
pkgver=1.7.2
pkgrel=1
pkgdesc="Redistribute a stream from DVB on a network in multicast or in HTTP unicast"
arch=(i686 x86_64)
url="http://www.mumudvb.net/"
license=('GPL')
depends=('glibc')
options=(docs emptydirs)
source=("https://github.com/braice/${_gitname}/archive/${pkgver}.zip"
        "mumudvb.install"
        "mumudvb.conf")
install="mumudvb.install"
sha256sums=('76a9810b0f0d5c3323792288956790be93f89f492bb373de14d3642c008901ea'
            '8d6ae9ed0f8c6d00254549bfae6bc20ca0984dce8c85eb1ef00d555e49b41264'
            'abe3c74a528f59b990e18f91858cb9bb9dd61c715c8904eb561aa7ee4cb79281')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  # Needed for development snapshots
  # autoreconf -i -f

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # systemd tmpfile configuration
  install -D -m 0644 ${srcdir}/mumudvb.conf ${pkgdir}/usr/lib/tmpfiles.d/mumudvb.conf

  # docs
  install -d -m 0775 ${pkgdir}/usr/share/doc/mumudvb/configuration_examples
  install -d -m 0775 ${pkgdir}/usr/share/doc/mumudvb/html
  install -D -m 0644 doc/mumudvb.8 ${pkgdir}/usr/share/man/man8/mumudvb.8
  install -m 0644 doc/configuration_examples/* ${pkgdir}/usr/share/doc/mumudvb/configuration_examples
  install -m 0644 doc/html/* ${pkgdir}/usr/share/doc/mumudvb/html
  install -m 0644 doc/README* ${pkgdir}/usr/share/doc/mumudvb
  install -m 0644 doc/QUICKSTART.txt ${pkgdir}/usr/share/doc/mumudvb
  install -m 0644 doc/WEBSERVICES.txt ${pkgdir}/usr/share/doc/mumudvb
}

# vim:set ts=2 sw=2 et:
