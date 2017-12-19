# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=ccid-git
pkgver=ccid.1.4.26.r35.g582f882
pkgrel=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver (git version)"
arch=('x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb' 'flex')
backup=(etc/reader.conf.d/libccidtwin)
makedepends=('pkg-config' 'git')
provides=("ccid")
conflicts=("ccid")
backup=(etc/reader.conf.d/libccidtwin)
source=("git+https://alioth.debian.org/anonscm/git/pcsclite/CCID.git"
        "git+https://alioth.debian.org/anonscm/git/pcsclite/PCSC.git"
        "git+https://anonscm.debian.org/git/pcsclite/contrib.git")
md5sums=('SKIP' 'SKIP' 'SKIP')
validpgpkeys=(F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E) # Ludovic Rousseau <ludovic.rousseau@free.fr>

pkgver() {
  cd "${srcdir}/CCID"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/CCID
    git submodule init 
    git config submodule.PCSC.url $srcdir/PCSC
    git config submodule.contrib_libPCSCv2part10.url $srcdir/contrib
    git submodule update
}

build() {
  cd "${srcdir}/CCID"
  sed -i "/^AC\_INIT/ { s,]),-git]), }" configure.ac
  ./bootstrap
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-twinserial \
              --enable-serialconfdir=/etc/reader.conf.d
  make
}

package() {
  cd "${srcdir}/CCID"

  make DESTDIR="${pkgdir}" install
  # move the configuration file in /etc and create a symbolic link
  mv "${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist" "${pkgdir}/etc/libccid_Info.plist"
  ln -s /etc/libccid_Info.plist ${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist

  install -Dm644 src/92_pcscd_ccid.rules "${pkgdir}/usr/lib/udev/rules.d/92_pcscd_ccid.rules"
}
