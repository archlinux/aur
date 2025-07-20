# Maintainer: Mike Pento <mjpento@gmail.com>

# list of source files to be patched
_file_list=(
    'libscream.c'
    'options.c'
    'pixmap.c'
    'pixmap.h'
    'screen.c'
)

pkgname=eterm
_pkgname=Eterm
pkgver=0.9.6
pkgrel=4
_pkgrel=1
pkgdesc="A vt102 terminal emulator intended as a replacement for xterm."
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/eterm/0.9.6-1"
license=('custom')
depends=('libast>=0.7' 'libxmu' 'libxres' 'libutempter' 'xorg-fonts-75dpi'
'xorg-fonts-misc')
options=('!libtool' '!debug')
provides=('esetroot')
conflicts=('esetroot')
install=${pkgname}.install
source=(https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${pkgname}/${pkgver}-${_pkgrel}/${pkgname}_${pkgver}.orig.tar.gz 
    eterm.install
    patches.tgz
)

md5sums=('90e424584c22d4050496874d14f78bb1'
    '32eddc4b9f4d34b0603c4af2ecaee39a'
    '8e4bb6a66b2d61feeae8108d0e1ae122'
)

prepare() {
    cd ${_pkgname}-${pkgver}/src

    # patch sources
    for _file in ${_file_list[@]}; do
	    patch -b < ../../patches/${_file}.patch
    done
}

build() {
  cd ${_pkgname}-${pkgver}
  CONF=""
  [ "${CARCH}" = "x86_64" ] && CONF="--disable-mmx"
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-trans --enable-utmp \
    --enable-multi-charset=utf-8 \
    --enable-xim --with-theme-update \
    --with-backspace=bs --without-terminfo \
    --enable-multi-charset ${CONF}
  
  make CFLAGS+=-std=gnu89
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

