# $Id$
# Maintainer: Ido Rosen (ido) <ido@kernel.org>
# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Alexander Konarev (kale-ru) <AVKonarev@gmail.com>
# Contributor: Alexander Konarev <avkonarev@gmail.com.cc>
# Contributor: Andre Bartke (andre) <andrew@archlinux.us>

pkgname=aksusbd
pkgver=7.80
_pkgrel=1
_tarballname=Sentinel_LDK_RedHat_and_SuSE_RPM_Run-time_Installer
pkgrel=1 # ${_pkgrel}
pkgdesc="SafeNet Sentinel LDK AKSUSB daemon supporting Sentinel HASP, HASP HL, HASP4 and Hardlock keys."
arch=('i686' 'x86_64')
url="https://safenet.gemalto.com/"
license=('custom')
source=("${_tarballname}-${pkgver}.tar.gz::https://fdsdown.safenet-inc.com/filesSN/Index/7f8dd7b54da0482d910bd461ba0d991e?sid=5aeeaadf4fb59788102400818110c73b"
        "service-usr-bin-i386.patch"
        "service-usr-bin-x86_64.patch"
        "LICENSE"
        "${pkgname}.install")
sha256sums=('21db58ea3acbb32ce358473dd20b372c4ccafee92739bc6f71b236cc5277ad31'
            '75c02721799e3f2b498d67265201445c963063b331c61402205db2ad91e72ec3'
            'd63548bac27eab7cf4a524830643705bafc63349d2e3c5276a37d3382e5598ec'
            'c67d1383c94e2fda4c25a70d5a5d4a90d692586ff7977eb5e9e82139f85e22dd'
            'db96b8b8f1ae5af6bbe6eaa3b4cf635341b8c07d294442cb3bfb1b78a20a54ec')
makedepends=('libarchive')
conflicts=('ehaspd')
install=$pkgname.install
options=('!strip')

prepare(){
  cd $srcdir

  # Extract RPM into $srcdir:
  bsdtar -xvf ${_tarballname}/${pkgname}-${pkgver}-${_pkgrel}.${CARCH}.rpm

  # Change /usr/sbin/ to /usr/bin/
  patch -p1 < service-usr-bin-i386.patch
  patch -p1 < service-usr-bin-x86_64.patch
}

package() {
  cd $srcdir
  ### x86_64 hasplmd segfaults -- continue to install 32bit-version.
  ### Uncomment the section below to install x86_64 on such systems anyway.
  # if [ "${CARCH}" != "i386" ]; then
  #   arch_suffix=_${CARCH}
  # fi

  # Binaries:
  install -dm755 ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/usr/sbin/{aksusbd,hasplmd}${arch_suffix} \
      ${pkgdir}/usr/bin/

  # udev rules:
  install -dm755 ${pkgdir}/usr/lib/udev/rules.d
  install -m644 ${srcdir}/etc/udev/rules.d/* \
      ${pkgdir}/usr/lib/udev/rules.d/

  # systemd service
  install -dm755 ${pkgdir}/usr/lib/systemd/system/
  install -m644 ${srcdir}/var/hasplm/init/aksusbd${arch_suffix}.service \
      ${pkgdir}/usr/lib/systemd/system/aksusbd.service
  install -m644 ${srcdir}/var/hasplm/init/hasplmd${arch_suffix}.service \
      ${pkgdir}/usr/lib/systemd/system/hasplmd.service

  # LICENSE and readme.html:
  install -Dm644 ${srcdir}/${_tarballname}/readme.html \
      ${pkgdir}/usr/share/${pkgname}/readme.html
  install -Dm644 ${srcdir}/LICENSE \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
