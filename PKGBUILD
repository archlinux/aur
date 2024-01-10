# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=fbc
pkgver=1.10.1
pkgrel=2
_bootver=1.10.1
pkgdesc="FreeBASIC Compiler (Release version)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.freebasic.net"
license=('GPL2' 'LGPL')
makedepends=('libffi' 'libxpm' 'gpm' 'libffi' 'libxrandr' 'mesa')
provides=('fbc')
conflicts=('freebasic' 'fbc-git')
options=(staticlibs)
bspkg=("https://downloads.sourceforge.net/fbc/Source%20Code/FreeBASIC-${_bootver}-source-bootstrap.tar.xz")
source=("https://downloads.sourceforge.net/fbc/Source%20Code/FreeBASIC-${_bootver}-source.tar.gz")
sha256sums=('SKIP')

prepare() {
if [ "$CARCH" = "i686" ]; then
_arch='x86'
fi

if [ "$CARCH" = "x86_64" ]; then
_arch='x86_64'
fi

if [ "$CARCH" = "aarch64" ]; then
_arch='aarch64'
fi

if [ "$CARCH" = "armv7h" ]; then
_arch='arm'
fi
}

build() {
cd "${srcdir}"
wget ${bspkg}
tar xf FreeBASIC-${_bootver}-source-bootstrap.tar.xz
cd FreeBASIC-${_bootver}-source-bootstrap
make CFLAGS="$CFLAGS $(pkg-config --cflags libffi)" bootstrap-minimal
export PATH=`pwd`/bin:${PATH}
export FBCINCDIR=`pwd`/inc
cd "${srcdir}/FreeBASIC-${_bootver}-source"
make FBCFLAGS="-i $FBCINCDIR" all
make unit-tests
make warning-tests
}

package() {
cd "${srcdir}/FreeBASIC-${_bootver}-source"
make prefix="${pkgdir}/usr/" install
}
