# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com> 

pkgname=rtags-git
pkgver=r6697.a9796852
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
            '2ceac912b6ae0e41d4d9634b6d60027ce4b4f9912ac927b82f5d2e4beae5cf4a'
            '56bf4f3e8208ea142c61ed6f80b4907f15e2bab8d690763cff8fb15f893ad16d')

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
