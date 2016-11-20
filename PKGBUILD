# $Id$
# Maintainer: Ido Rosen (ido) <ido@kernel.org>
# Contributor: Alexander Konarev (kale-ru) <AVKonarev@gmail.com>
# Contributor: Alexander Konarev <avkonarev@gmail.com.cc>
# Contributor: Andre Bartke (andre) <andrew@archlinux.us>

pkgname=aksusbd
pkgver=7.51
_pkgrel=1
_tarballname=Sentinel_LDK_RedHat_and_SuSE_RPM_Run-time_Installer
pkgrel=1 # ${_pkgrel}
pkgdesc="SafeNet Sentinel LDK AKSUSB daemon supporting Sentinel HASP, HASP HL, HASP4 and Hardlock keys."
arch=('i686' 'x86_64')
url="https://safenet.gemalto.com/"
license=('custom')
source=("ftp://ftp.cis-app.com/pub/hasp/Sentinel_HASP/Runtime_(Drivers)/${pkgver}/${_tarballname}.tar.gz"
        "aksusbd.service"
        "winehasp.service"
        "hasplmd.service"
        "LICENSE"
        "udev-rules.patch"
        "${pkgname}.install")
sha256sums=('28effa888ffc0aaffd535bd0166770564c82655415fb42bd8a1008f47d1fbfb4'
            '5551253cf3f048f3c1418c8f3e7378651a47807201de98f3e759fa81b38a859f'
            'd4558107c7c9cf94f4b1e95ca5036e5cb43e59c5bc9ac35e2fbb70a194dc091a'
            'e3be521db63423519161eb50c5561601fcfeb3341320e4d077b968d0a30d541a'
            'c67d1383c94e2fda4c25a70d5a5d4a90d692586ff7977eb5e9e82139f85e22dd'
            '83145c8323a987572607a4f3a4af5498a84f5974f2d60a698b15fb87f9d64d35'
            '8d5a12de57caf36af433f7c2890969b1a9fbd3ae5ce9d20d5706a5f67125ebd9')
makedepends=('rpmextract')
conflicts=('ehaspd')
install=$pkgname.install
options=('!strip')

prepare(){
  cd $srcdir

  # Extract RPM into $srcdir:
  rpmextract.sh ${_tarballname}/${pkgname}-${pkgver}-${_pkgrel}.i386.rpm

  # Comment out redundant legacy udev rules:
  patch -p1 < udev-rules.patch
}

package() {
  cd $srcdir

  # Binaries:
  install -dm755 ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/usr/sbin/* \
      ${pkgdir}/usr/bin/

  # (patched) udev rules:
  install -dm755 ${pkgdir}/usr/lib/udev/rules.d
  install -m644 ${srcdir}/etc/udev/rules.d/* \
      ${pkgdir}/usr/lib/udev/rules.d/

  # Legacy init scripts (for posterity):
  install -Dm644 ${srcdir}/etc/init.d/${pkgname} \
      ${pkgdir}/usr/share/${pkgname}/${pkgname}.init

  # systemd service (based on etc/init.d/aksusbd):
  install -dm755 ${pkgdir}/usr/lib/systemd/system/
  install -m644 ${srcdir}/{aksusbd,winehasp,hasplmd}.service \
      ${pkgdir}/usr/lib/systemd/system/

  # LICENSE and readme.html:
  install -Dm644 ${srcdir}/${_tarballname}/readme.html \
      ${pkgdir}/usr/share/${pkgname}/readme.html
  install -Dm644 ${srcdir}/LICENSE \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

