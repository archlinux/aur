# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=fbc-git
pkgver=1.07
pkgrel=3
_pkgname=fbc
_bootver=1.07.3
pkgdesc="FreeBASIC Compiler (Development version)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.freebasic.net"
license=('GPL2' 'LGPL')
makedepends=('libffi' 'ncurses5-compat-libs')
provides=('fbc')
conflicts=('freebasic' 'fbc')
options=(staticlibs)
source=("$_pkgname"::'git+https://github.com/freebasic/fbc')
sha256sums=('SKIP')

pkgver() {
cd "${srcdir}/${_pkgname}"
cut -c14-17 version.mk
}

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

warning "Setting up libffi compatibility headers (run update-libffi-compat as root if build fails)"
warning "Downloading bootstrap fbc compiler"
cd "${srcdir}"
wget http://downloads.sourceforge.net/fbc/Binaries%20-%20Linux/FreeBASIC-${_bootver}-linux-${_arch}.tar.gz
tar xzf FreeBASIC-${_bootver}-linux-${_arch}.tar.gz
cd FreeBASIC-${_bootver}-linux-${_arch}
export PATH=`pwd`/bin:${PATH}
}

build() {
cd "${srcdir}/${_pkgname}"
make all
}

package() {
cd "${srcdir}/${_pkgname}"
make prefix="${pkgdir}/usr/" install
}
