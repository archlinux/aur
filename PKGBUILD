# Maintainer: BowDown097 <bowdown097 at sneed dot church>

_pkgname=qttube
_pkgver=1.0
pkgname=${_pkgname}-git
pkgver=${_pkgver}.r573.g39b8dc2
pkgrel=1
pkgdesc="A Qt frontend for YouTube."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/BowDown097/QtTube"
license=('GPL3')
depends=('qt6-base' 'qt6-webchannel' 'qt6-webengine')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('cmake' 'git')
optdepends=('libxss: for preventing the screen from sleeping while watching videos')
source=("git+https://github.com/BowDown097/QtTube"
        "git+https://github.com/BowDown097/qttube-plugin-interface"
        "git+https://github.com/woboq/verdigris")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    # Switch this to "git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'"
    # once there's some actual versioning going!
    cd "${srcdir}/QtTube"
    local _revision=$(git rev-list --count $(git rev-list --max-parents=0 HEAD)..HEAD)
    local _commit=$(git rev-parse --short HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
    printf "${_pkgver}.r%s.g%s" "${_revision:?}" "${_commit:?}"
}

prepare() {
    cd "${srcdir}/QtTube"
    git submodule init
    git config submodule.depends/plugin_interface.url "${srcdir}/plugin_interface"
    git -c protocol.file.allow=always submodule update

    cd "${srcdir}/QtTube/plugin_interface"
    git submodule init
    git config submodule.depends/verdigris.url "${srcdir}/verdigris"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "${srcdir}/QtTube" \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "${srcdir}/QtTube"
    install -Dm644 "application/program_info/qttube.desktop" "$pkgdir/usr/share/applications/qttube.desktop"
    install -Dm644 "application/res/qttube.svg" "$pkgdir/usr/share/pixmaps/qttube.svg"
}
