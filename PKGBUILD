# Maintainer: Tomas Jasek<tomsik68(at)gmail(dot)com>
# Contributor: Hamza Alloush<hamzaalloush(at)live(dot)com>
# Contributor: Eugen Dahm <eugen.dahm(at)gmail(dot)com>


# due to stupid naming conventions of the source package
_zippkgname=Linux_PCE_N53_1008
_srctarname=DPO_GPL_RT5592STA_LinuxSTA_v2.6.0.0_20120326.tar.bz2

# name of the base package
_pkgbase=rt5592sta
pkgname=rt5592sta_linux_patched-dkms
pkgver=2.6.0.0
pkgrel=3
pkgdesc="DKMS module which contains linux device driver for the Ralink RT2860 ABGN WLAN Card. It's based on halou89's rt5592sta_linux_patched package."
arch=('i686' 'x86_64')
url="http://asus.com"
license=('GPL')
depends=('dkms')
depends_x86_64=('lib32-glibc')
depends_i686=('glibc')
makedepends=(make linux-headers)
conflicts=("rt5592sta_linux", "rt5592sta_linux_patched", "rt5592sta_linux_patched-dkms")
optdepends=()
options=()
changelog=
source=("http://dlcdnet.asus.com/pub/ASUS/wireless/PCE-N53/${_zippkgname}.zip"
	'arch_build_preparation.patch'
	'rt5592sta_fix_64bit_3.8.patch'
	'extra.patch'
	'4.9_preperation.patch'
	'dkms.conf'
)
sha1sums=('955b29d74fd66576b86dd1feee107f73b4605e3e'
          'd938f53945eb5e6c88eb58a942c451c61122cec1'
          '7a11b444f9861463bdfbbafe95c7443d9e1767aa'
          '3574c691fb771459471fcd2297b10003ccbea875'
	  '20420077e9e008c5b88305e420dd8969ffd41807'
	  '44a0dad0043e3482dec70d490325e651e333c72f')

build() {
   cd "${srcdir}/Linux"
   tar -xjf ${_srctarname}
   cd $(basename -s .tar.bz2 $_srctarname)
   msg2 "Applying patches..."
   # patch the moronic makefile
   patch -p1 -i "${srcdir}/arch_build_preparation.patch"
   # patching for 3.8 kernel compatibility
   patch -p1 -i "${srcdir}/rt5592sta_fix_64bit_3.8.patch"
   patch -p1 -i "${srcdir}/extra.patch"
   patch -p1 -i "${srcdir}/4.9_preperation.patch"
}

package() {
  msg2 "Installing DKMS module..."
  installDir="$pkgdir/usr/src/$pkgname-$pkgver"
       
       
  install -dm755 "$installDir"
  # Copy dkms.conf
  msg2 "Copying dkms.conf..."

  install -m644 "${srcdir}/dkms.conf" "$installDir"

  # Set name and version in dkms.conf
  msg2 "Configuring dkms.conf..."
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "$installDir/dkms.conf"
  msg2 "Copying sources..."
  # Copy sources
  cd "${srcdir}/Linux/DPO_GPL_RT5592STA_LinuxSTA_v2.6.0.0_20120326/"
  for d in `find . -type d`
  do
    install -dm755  "$installDir/$d"
  done
  for f in `find . -type f`
  do
	install -m644 "$(pwd)/$f" "$installDir/$f"
  done
  # TODO:
  #cp RT2860STA.dat  /etc/Wireless/RT2860STA/RT2860STA.dat
  msg2 "Installing RT2860STA.dat"
  install -dm755 "${pkgdir}/etc/Wireless/RT2860STA"
  install -m644 "$(pwd)/RT2860STA.dat" "${pkgdir}/etc/Wireless/RT2860STA/RT2860STA.dat"
  install=${pkgname}.install
}

# vim:set ts=2 sw=2 et:
