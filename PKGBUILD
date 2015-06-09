# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fritz <V155> Reichwald <fritz.reichwald at gmail.com>
# Contributor: Hauke Wesselmann <hauke at h-dawg.de>

pkgname=barry-git
_realname=barry
pkgver=0.18.4.1.r52.gc6657c5
pkgrel=2
pkgdesc="Barry is an Open Source application that provides a Desktop GUI, synchronization, backup, restore and program management for BlackBerry ™ devices."
url=('http://www.netdirect.ca/software/packages/barry')
license=('GPL')
arch=('i686' 'x86_64')
depends=('libusbx' 'zlib' 'libglademm' 'libtar' 'libxml++' 'wxgtk' 'sdl' 'libgcal')
makedepends=('git')
optdepends=('fuse: for mounting the BB database with bfuse'
            'ppp: for tethering with pppob')
conflicts=('barry')
provides=('barry')
options=('!libtool')
install=(${_realname}.install)
source=("git://repo.or.cz/barry.git"
        "${_realname}.desktop"
        "wx3.0-compat.patch")
sha256sums=('SKIP'
            'cb30b64a392ff5ff0482399cd31e6c997c57e60969145680497a54ffbb8f7d67'
            'd89dec40916c99355426a9430130a34b9c9f8deccf2e0bd2be75c6eea46249f3')

pkgver() {
  cd ${srcdir}/${_realname}
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | sed 's/barry.//g'
}

prepare() {
  cd ${srcdir}/${_realname}

  # Debian patches
  patch -Np1 -i "${srcdir}/wx3.0-compat.patch"

  # Disable Werror
  find /$(pwd) -type f -exec sed -i 's/-Werror//g' '{}' \;

  autoreconf -fi
}

build() {
  cd ${srcdir}/${_realname}

  ./configure --prefix=/usr --libexec=/usr/lib --sbindir=/usr/bin \
    --enable-gui \
    --enable-desktop \
    --without-guisu

  make
}

package() {
  cd ${srcdir}/${_realname}

  make DESTDIR=${pkgdir} install

  # Install PPP scripts for pppob
  mkdir -p ${pkgdir}/etc/ppp/peers/ ${pkgdir}/etc/chatscripts/
  find ${srcdir}/${_realname}/ppp/ -name *.chat -exec cp {} ${pkgdir}/etc/chatscripts/ \;
  find ${srcdir}/${_realname}/ppp/ ! -name *.chat ! -name README -exec cp {} ${pkgdir}/etc/ppp/peers/ \;

  # Install .desktop file and icon
  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp ./desktop/images/barry_logo_icon.xpm ${pkgdir}/usr/share/pixmaps
  
  mkdir -p ${pkgdir}/usr/share/applications
  cp ../barry.desktop ${pkgdir}/usr/share/applications
}
