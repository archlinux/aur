# $Id$
# Maintainer: Ido Rosen (ido) <ido@kernel.org>
# Contributor: Alexander Konarev (kale-ru) <AVKonarev@gmail.com>
# Contributor: Alexander Konarev <avkonarev@gmail.com.cc>
# Contributor: Andre Bartke (andre) <andrew@archlinux.us>

pkgname=aksusbd
pkgver=7.40
_pkgrel=1
_tarballname=Sentinel_LDK_RedHat_and_SuSE_RPM_Run-time_Installer
pkgrel=${_pkgrel}
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
sha256sums=('ec579f8a0a6688af00ca74f0c8e32c0298c0b54cd92d4d49c3407d98c0dbd8a3'
            '33c9ed6db9fd1881ad93060074adcd29af6ac79ec4a9a6bf3e29080fd53223a5'
            '574bdf1726d0ff34376a9b574b794f533865931a2d9cf0606c638fcf7206f96b'
            'ca21170ab441cade3e0b0730770e633808cf2a57c693515970b2d5a767cff816'
            'c67d1383c94e2fda4c25a70d5a5d4a90d692586ff7977eb5e9e82139f85e22dd'
            'e5b17862fcc959ff48098ffdca04671d0303d290494edfebad495f6e3b82ba68'
            '06123d1817e5627828e7416b5c349318b3e6da65cd8cb0197cbc0138cbb76908')
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

