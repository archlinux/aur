# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openslp
pkgver=2.0.0
pkgrel=2
pkgdesc="Open-source implementation of Service Location Protocol"
arch=('x86_64')
url="http://www.openslp.org"
license=('BSD')
depends=('bash' 'openssl')
makedepends=('doxygen')
backup=('etc/slp.conf' 'etc/slp.reg' 'etc/slp.spi')
options=(!makeflags)
source=(https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz
        openslp.service
        openslp-2.0.0-null-pointer-deref.patch
        openslp-2.0.0-openssl-1.1-fix.patch)
sha256sums=('924337a2a8e5be043ebaea2a78365c7427ac6e9cee24610a0780808b2ba7579b'
            '8bba465806891a5df4702ab25866bd43258a6b0370b6e0941d188568ef82bdb9'
            'da639ca50ea3e7eeb747505171bc7678a444b6755a7068b0cd294cc87f1ebdbe'
            'bf38f7a251ff41582c17451af185a964d1ed235d0f2ff294e1d2761da17ab078')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|$(datadir)/doc|$(docdir)|' doc/Makefile.in
  patch -Np1 -i ../openslp-2.0.0-null-pointer-deref.patch
  patch -Np1 -i ../openslp-2.0.0-openssl-1.1-fix.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/openslp-${pkgver} \
    --enable-slpv1 \
    --enable-slpv2-security # service would fail to start without this
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" INSTALL_DATA="cp -r" install-docs
  rm "${pkgdir}/usr/share/doc/openslp-${pkgver}/openslp-doxy-${pkgver}.tar.gz"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/openslp.service" "${pkgdir}/usr/lib/systemd/system/openslp.service"
}
