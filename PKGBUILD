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
pkgrel=7
pkgdesc="DKMS module which contains linux device driver for the Ralink RT2860 ABGN WLAN Card. It's based on halou89's rt5592sta_linux_patched package."
arch=('i686' 'x86_64')
url="http://asus.com"
license=('GPL')
depends=('dkms' 'make' 'linux-headers' )
depends_x86_64=('lib32-glibc')
depends_i686=('glibc')
makedepends=('git')
conflicts=("rt5592sta_linux" "rt5592sta_linux_patched" "rt5592sta_linux_patched-dkms")
optdepends=()
options=()
changelog=
source=("asus-pce-n53-linux::git+https://github.com/lesf0/asus-pce-n53-linux.git"
	'dkms.conf'
)
sha1sums=('SKIP'
          'f214e701536900681df50d38308e8d4084230478')

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
  cd "${srcdir}/asus-pce-n53-linux/"
  for d in `find . -type d | grep -v '.git'`
  do
    install -dm755 "$installDir/$d"
  done
  for f in `find . -type f | grep -v '.git' | grep -v Quick`
  do
	install -m644 "$(pwd)/$f" "$installDir/$f"
  done
  msg2 "Installing RT2860STA.dat"
  install -dm755 "${pkgdir}/etc/Wireless/RT2860STA"
  install -m644 "$(pwd)/RT2860STA.dat" "${pkgdir}/etc/Wireless/RT2860STA/RT2860STA.dat"
  install=${pkgname}.install
}

# vim:set ts=2 sw=2 et:
