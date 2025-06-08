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
pkgrel=3
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
    libscream.c.patch
    options.c.patch
    pixmap.c.patch
    pixmap.h.patch
    screen.c.patch)
md5sums=('90e424584c22d4050496874d14f78bb1'
    '32eddc4b9f4d34b0603c4af2ecaee39a'
    '7fbfdca8ed67ff4872ba703b23b0c900'
    'e9062f21600ab9829c4f056818785e62'
    '9ca51d90d07a0ea770e32a453be979ac'
    '300891726fe97cf1b5196d970a4cf3fd'
    '055a664ebfa477f28705a4bd74aefe5d')

prepare() {
    cd ${_pkgname}-${pkgver}/src

    # patch sources
    for _file in ${_file_list[@]}; do
	patch -b ${_file} < ../../../${_file}.patch
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

