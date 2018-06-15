# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com> 

pkgname=rtags-git
pkgver=v2.18.r103.g1ea5e1d1
pkgrel=1
pkgdesc="RTags is a client/server application that indexes C/C++ code."
arch=('i686' 'x86_64')
url="https://github.com/Andersbakken/rtags"
license=('GPL3')
depends=('bash' 'clang')
makedepends=('cmake' 'git' 'llvm' 'zlib')
optdepends=('bash-completion: for bash completion' 'zlib' 'lua: Lua bindings')
provides=('rtags')
conflicts=('rtags')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd rtags
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd rtags
    git submodule init
    git submodule update
}

build() {
    cd rtags
    cmake . \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
          -DRTAGS_NO_BUILD_CLANG=1 \
          -DBUILD_TESTING=OFF
    make
    sed -i "s#\$RDM#/usr/bin/rdm#" ${srcdir}/rtags/share/etc/services/system/rdm.service
}

package() {
    cd rtags
    make DESTDIR="${pkgdir}/" install
    install -D --mode=644 ${srcdir}/rtags/share/etc/services/system/rdm.service ${pkgdir}/usr/lib/systemd/user/rdm.service
    install -D --mode=644 ${srcdir}/rtags/share/etc/services/system/rdm.socket ${pkgdir}/usr/lib/systemd/user/rdm.socket
}
