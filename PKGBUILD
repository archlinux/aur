# Maintainer: Martin Hoeher <martin@rpdev.net>
# Automatically released from https://gitlab.com/rpdev/opentodolist/-/pipelines/239682158
pkgname=opentodolist
pkgver=3.30.0
pkgrel=2
pkgdesc="Maintain todo lists, notes and images in libraries, which can be synced via various services like NextCloud between your devices."
arch=('x86_64')
url="https://opentodolist.rpdev.net/"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-tools' 'qt5-quickcontrols2' 'qt5-remoteobjects' 'syntax-highlighting' 'libsecret' 'ttf-roboto' 'noto-fonts')
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
            printf "%s" "$(git describe --long --tags | cut -f1 -d'-')"
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
        # Some unit tests are failing sometimes - this is due to multi-threading issues
        # where the test does not "wait in the right order" (kind of). Ideally, we'd fix
        # this, however, in order to avoid issues, retry the testing.
        # If the test fails three times, this is a clear sign that something IS broken.
        make check || make check || make check
}

package() {
        cd "$srcdir/${pkgname%}"
        cd build
        make INSTALL_ROOT="$pkgdir/" install
}
