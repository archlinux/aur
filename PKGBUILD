# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com> 

pkgname=rtags-git
pkgver=v2.10.r17.g1c2ffdf7
pkgrel=1
pkgdesc="RTags is a client/server application that indexes C/C++ code."
arch=('i686' 'x86_64')
url="https://github.com/Andersbakken/rtags"
license=('GPL3')
depends=('bash' 'clang')
makedepends=('cmake' 'git' 'llvm' 'zlib')
optdepends=('bash-completion: for bash completion' 'zlib' 'lua>=5.3: Lua bindings')
provides=('rtags')
conflicts=('rtags')
source=("git+${url}.git"
        rdm.service
        rdm.socket)
sha256sums=('SKIP'
            'de5199dba756137c9f689879ab2e842f7d7477f7f6a9091178a72888484d1102'
            '25d1842a4187a1933ff27833201cfd0879da71a50241860e32edecfc7e75f14f')

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
          -DRTAGS_NO_BUILD_CLANG=1
    make
}

package() {
    cd rtags
    make DESTDIR="${pkgdir}/" install
    install -D --mode=644 ${srcdir}/rdm.service ${pkgdir}/usr/lib/systemd/user/rdm.service
    install -D --mode=644 ${srcdir}/rdm.socket ${pkgdir}/usr/lib/systemd/user/rdm.socket
}
