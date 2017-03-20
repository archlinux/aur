# Mainteiner: David P. <megver83@openmailbox.org>

pkgname=pm-utils
pkgver=1.4.1
pkgrel=1
pkgdesc="Utilities and scripts for suspend and hibernate power management"
arch=('any')
url="http://pm-utils.freedesktop.org"
license=('GPL')
depends=('bash' 'procps' 'pm-quirks')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
source=(http://pm-utils.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz
02-logging-append.patch
12-fix-intel-audio-powersave-hook.patch
13-49bluetooth-sync.patch
14-disable-sata-alpm.patch
        11netcfg)
md5sums=('1742a556089c36c3a89eb1b957da5a60'
         'a45149617bf3eb8dc32e6d9e22ae715d'
         'edada31a7d722763513fbe705d95d19d'
         '298f78b873c03c025700d5da619ac134'
         'd0040f7d30b6a0dd195b5401abbbbdb9'
         '9839687c8787d99fd4ff36aa3238c27b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/02-logging-append.patch"
  patch -Np1 -i "${srcdir}/12-fix-intel-audio-powersave-hook.patch"
  patch -Np1 -i "${srcdir}/13-49bluetooth-sync.patch"
  patch -Np1 -i "${srcdir}/14-disable-sata-alpm.patch"
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var
  make
  make DESTDIR="${pkgdir}" install

  # install additional hooks
  install -m755 "${srcdir}/11netcfg" "${pkgdir}/usr/lib/pm-utils/sleep.d/"

  # nm >=0.8.2 has native udev suspend/resume support
  rm -f "${pkgdir}/usr/lib/pm-utils/sleep.d/55NetworkManager"
  
  # Remove hooks that cause hardware failure or don't make sense at all
  rm -f "${pkgdir}/usr/lib/pm-utils/power.d/"{harddrive,disable_wol}
}
