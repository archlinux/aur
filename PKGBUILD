# Maintainer: Martin Hoeher <martin@rpdev.net>
pkgname=OpenTodoList
pkgver=3.25.0
pkgrel=1
pkgdesc="Maintain todo lists, notes and images in libraries, which can be synced via various services like NextCloud between your devices."
arch=('x86_64')
url="https://opentodolist.rpdev.net/"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-tools' 'qt5-quickcontrols2' 'syntax-highlighting' 'libsecret' 'ttf-roboto' 'noto-fonts')
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://gitlab.com/rpdev/opentodolist.git#commit=${pkgver}")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
        cd "$srcdir/${pkgname%}"
        release_build=yes
        if [ -n "$release_build" ]; then
            printf "${pkgver}"
        else
            printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
        fi
}

prepare() {
        cd "$srcdir/${pkgname%}"
        git submodule update --init --recursive
}

build() {
        cd "$srcdir/${pkgname%}"
        mkdir -p build
        cd build
        qmake CONFIG+=release INSTALL_PREFIX=/usr ..
        make
}

check() {
        cd "$srcdir/${pkgname%}"
        cd build
        make check
}

package() {
        cd "$srcdir/${pkgname%}"
        cd build
        make INSTALL_ROOT="$pkgdir/" install
}
