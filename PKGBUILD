# $Id: PKGBUILD 53530 2011-08-05 06:06:18Z bfanella $
# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Stas Solovey <whats_up@tut.by>

pkgname=nas
pkgver=1.9.4
pkgrel=1
pkgdesc='Network Audio System is a network transparent, client/server audio transport system'
arch=('i686' 'x86_64')
url='http://radscan.com/nas.html'
license=('MIT')
depends=('libxaw')
makedepends=('imake')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.src.tar.gz"
        'license'
        'nasd.service'
        'nasd')
md5sums=('dac0e6cd3e5d6a37ae1dff364236a752'
         'f11eb8c3fb83946e66e60f7532e8d5da'
         '3bd8268d3655509b6e10475060dfbf10'
         'fb0acd5e3fae362a55d2fbeeb9be0dbb')

build() {
  	cd ${pkgname}-${pkgver}

  	xmkmf
  	make World
}

package() {
  	cd ${pkgname}-${pkgver}

  	make DESTDIR=${pkgdir} USRLIBDIR=/usr/lib install
	chmod 644 ${pkgdir}/usr/include/audio/*

# Remove static libraries
        rm ${pkgdir}/usr/lib/*.a
# Rename config file
        mv ${pkgdir}/etc/nas/nasd.conf{.eg,}

        install -D -m644 ${srcdir}/nasd.service ${pkgdir}/usr/lib/systemd/system/nasd.service
        install -D -m644 ${srcdir}/nasd ${pkgdir}/etc/conf.d/nasd
	install -D -m644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
