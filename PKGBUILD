# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>
# Contributor: Silvio Knizek <killermoehre@gmx.net>

pkgname=trousers
pkgver=0.3.10
pkgrel=3
pkgdesc="Open-source TCG Software Stack implementation for use with a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('openssl')
makedepends=('gtk2')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}.install
        tcsd
        tcsd.service
        70-tpmd.rules)
sha256sums=('eb9569de5c66d9698f6c3303de03777b95ec72827f68b7744454bfa9227bc530'
            '70ffb97a47b931a73c8a0141af74d8068eff1c173a813cecd50918be2e5b2844'
            '22e30fbf8c6634cb86402d804fda1b97a17ae08ddb67461396fe38998cb0e631'
            'd3fe859f70a09097c4e697c7f95d3c907cf60f717fd7994e21c81042f2a47b21'
            'c50ea41a4809699dd50f2e621acc6baafb2dffa43cd5a0df8a0679f1d1b1b884')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --with-openssl=/usr \
              --with-gui=gtk
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm755 ${srcdir}/tcsd ${pkgdir}/etc/rc.d/tcsd
  install -Dm644 ${srcdir}/tcsd.service ${pkgdir}/usr/lib/systemd/system/tcsd.service
  install -Dm644 ${srcdir}/70-tpmd.rules ${pkgdir}/usr/lib/udev/rules.d/70-tpmd.rules
}

# vim:set ts=2 sw=2 et:
