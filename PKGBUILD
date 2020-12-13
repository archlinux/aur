# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>
# Contributor: Silvio Knizek <killermoehre@gmx.net>

pkgname=trousers
pkgver=0.3.15
pkgrel=2
pkgdesc="Open-source TCG Software Stack implementation for use with a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('openssl')
options=('libtool')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'sysusers.conf'
        'tmpfiles.conf'
        'tcsd.service'
        '70-tpmd.rules'
        '01-tss-user.patch')
#        'trousers-0.3.14-fno-common.patch')
sha256sums=('1e5be93e518372acf1d92d2f567d01a46fdb0b730487e544e6fb896c59cac77f'
            '4c2684501e7a67132d4f53466b32fc06bd2a0275d4cf1fbd5479d0cdb2349bc7'
            '225414a8da825351da33760a141a607f731c513c36527e4624b36a607c5aa7e6'
            '653c3a94ec628e7a7fb150d0d289b0866c6b3bb9aa57af2c59724517d205d7bd'
            'c50ea41a4809699dd50f2e621acc6baafb2dffa43cd5a0df8a0679f1d1b1b884'
            'd6d2f72389ffc1f61c363d839de24ba7ebb9a6453d99ece151a65933ebb0235c')
#            '770fd94510adb90605eb38745b62450a4cda25c2b8c9c6c8ea2e6043582d0e27')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/01-tss-user.patch
  #patch -p1 -i ${srcdir}/trousers-0.3.14-fno-common.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --with-openssl=/usr \
              --with-gui=openssl
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/tcsd.service ${pkgdir}/usr/lib/systemd/system/tcsd.service
  install -Dm644 ${srcdir}/70-tpmd.rules ${pkgdir}/usr/lib/udev/rules.d/70-tpmd.rules
  install -Dm644 ${srcdir}/sysusers.conf ${pkgdir}/usr/lib/sysusers.d/trousers.conf
  install -Dm644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/trousers.conf
}

# vim:set ts=2 sw=2 et:
