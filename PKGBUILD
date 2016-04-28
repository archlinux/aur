# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com> 

pkgname=rtags-git
pkgver=r6139.026884d
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
            '69e04a0b57f329b251fac89710e41448e28b0719c93267fe03c5b98a6d37b172'
            '25d1842a4187a1933ff27833201cfd0879da71a50241860e32edecfc7e75f14f')

pkgver() {
    cd rtags
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	  -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd rtags
    make DESTDIR="${pkgdir}/" install
    install -D --mode=644 ${srcdir}/rdm.service ${pkgdir}/usr/lib/systemd/user/rdm.service
    install -D --mode=644 ${srcdir}/rdm.socket ${pkgdir}/usr/lib/systemd/user/rdm.socket
}
