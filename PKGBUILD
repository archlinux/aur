# Maintainer: Kyle Manna <kyle at kylemanna dot com>
#
# Forked from main KeePassX 2 AUR:
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>
#
# Details: https://github.com/keepassx/keepassx/pull/52
#

pkgname=keepassx2-yubikey-git
pkgver=2.0.0.r75.g3de1231
pkgrel=1
pkgdesc="KeePassX cross platform password manager with support for the YubiKey challenge-response hardware token."
arch=('i686' 'x86_64')
url="https://github.com/kylemanna/keepassx"
license=('GPL2')
depends=('libxtst' 'libgcrypt' 'zlib' 'qt5-tools' 'qt5-x11extras' 'yubico-c' 'yubikey-personalization')
install=keepassx2.install
makedepends=('git' 'cmake')
conflicts=('keepassx-svn' 'keepassx' 'keepassx2', 'keepassx2-git')
source=("${pkgname}::git+https://github.com/keepassx/keepassx.git#commit=3de123166b3f33af782adb81c242b735ca6affb7")
md5sums=('SKIP')

_check_repo_added() {
    cd "${srcdir}/${pkgname}"
    git show-ref --verify --quiet refs/remotes/keepassx-yubikey/yubikey
    return $?
}

prepare() {
    cd "${srcdir}/${pkgname}"
    if ! _check_repo_added ; then
        git remote add -t yubikey keepassx-yubikey https://github.com/kylemanna/keepassx.git
        git fetch keepassx-yubikey
        git merge --no-ff --no-edit keepassx-yubikey/yubikey
    fi
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin -DCMAKE_INSTALL_LIBDIR=/usr/lib -DWITH_GUI_TESTS=ON
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
