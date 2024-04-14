# Maintainer: Nicolas Boichat <nicolas@boichat.ch>
# Forked from ccid package

pkgname=ezifd
pkgver=1.5.5.1
pkgrel=1
pkgdesc='EZUSB/EZ100PU USB Chip/Smart Card Interface Devices driver'
arch=('x86_64')
url='https://github.com/drinkcat/ezIFD'
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb' 'flex')
conflicts=('ezusb')
source=("${pkgname}"'::git+https://github.com/drinkcat/ezIFD.git#commit=v1.5.5.2'
        'PCSC::git+https://github.com/LudovicRousseau/PCSC.git#commit=549922c1355fdd1e85eb0a952fefda7bb96e286a'
        'PCSC-contrib::git+https://github.com/LudovicRousseau/PCSC-contrib.git#commit=deebf6fca223d799b19de3c359697bed7b694bf0')
sha256sums=('1e1e514e23b9d3ca7feb494ddba6fc4572cd2edc4d428dfd9ef2a2b77cb3d8fa'
            'fb27a4d0ebd7f80d6b8427b30c337b160997e00ab92e5d46ba0d256264d02d5c'
            '3f6bc5d74138403ea92362ec826564983401a1ef95f7d8a3a9b1a09fb49cb82b')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.libs/libdep.url "$srcdir/PCSC"
  git config submodule.libs/libdep.url "$srcdir/PCSC-contrib"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"

  autoreconf --install
  ./configure \
    LEXLIB='' \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  # move the configuration file in /etc and create a symbolic link
  mkdir -p "${pkgdir}/etc"
  mv "${pkgdir}/usr/lib/pcsc/drivers/ifd-ez.bundle/Contents/Info.plist" "${pkgdir}/etc/libifd-ez_Info.plist"
  ln -s /etc/libifd-ez_Info.plist "${pkgdir}/usr/lib/pcsc/drivers/ifd-ez.bundle/Contents/Info.plist"
}
