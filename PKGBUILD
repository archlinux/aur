# Maintainer: luspi <luspi@gmx.de>
pkgname=alsa-utils-transparent
_pkgname=alsa-utils
pkgver=1.1.7
pkgrel=1
pkgdesc="A patched version of the alsa-utils package to support transparent terminals"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org"
#can not use >=$pkgver due to use of letters in alsa-lib update versioning
depends=("alsa-lib>1.0.24" 'dialog' 'pciutils' 'ncurses' 'psmisc' 'libsamplerate')
makedepends=('xmlto' 'docbook-xsl')
license=('GPL')
source=(ftp://ftp.alsa-project.org/pub/utils/$_pkgname-${pkgver}.tar.bz2
        90alsa
        transparency.patch)
md5sums=('2b88796c6b05520e59eec6049de02f64'
         '529216f6a46e61a546640e08ea7a0879'
         '586f985eea6abf0a6a6c753ea4fa542e')
conflicts=('alsa-utils')
provides=('alsa-utils')

build() {
  cd $srcdir/$_pkgname-${pkgver}
  patch -Np1 -i ${srcdir}/../transparency.patch
  ./configure --prefix=/usr --disable-alsaconf --sbindir=/usr/bin \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --disable-rst2man
  make
  # fix udev rules genaration
  cd alsactl
  make 90-alsa-restore.rules
}
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m755 ../90alsa ${pkgdir}/etc/pm/sleep.d/90alsa

  # install alsa udev rule file
  install -D -m644 alsactl/90-alsa-restore.rules \
          ${pkgdir}/usr/lib/udev/rules.d/90-alsa-restore.rules

  # dir where to save ALSA state
  install -d ${pkgdir}/var/lib/alsa
}

