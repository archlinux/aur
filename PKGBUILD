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
            '2a530156b5cb7637cb94e8bd91b31141f30f8041d56cf6aa076000d15307f3aa'
            '56bf4f3e8208ea142c61ed6f80b4907f15e2bab8d690763cff8fb15f893ad16d')

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
