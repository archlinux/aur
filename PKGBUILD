# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Co-maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r2274.77fe8cf1
pkgrel=1
epoch=1
pkgdesc='The open source, cross platform level editor for idtech games (GtkRadiant fork)'
url='https://netradiant.gitlab.io/'
license=('GPL' 'BSD' 'LGPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'gtkglext' 'minizip' 'libjpeg-turbo' 'libwebp')
makedepends=('git' 'svn' 'wget' 'unzip' 'cmake' 'make')
provides=('netradiant' 'q3map2' 'q3data' 'q2map' 'qdata3' 'h2data')
conflicts=('netradiant-custom')
source=("${pkgname}::git+https://gitlab.com/xonotic/netradiant.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}/"
    # Fetch the Crunch submodule (it is compiled when present)
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}/"

    # Possible values for the GAMEPACKS_LICENSE_LIST filter are "free",
    # "all" (free + proprietary) and "none".
    # If you only want to fetch the Unvanquished and Xonotic gamepacks for example,
    # use -DGAMEPACKS_LICENSE_LIST=none and -DGAMEPACKS_NAME_LIST="Unvanquished Xonotic".
    # See https://gitlab.com/xonotic/netradiant/-/blob/master/README.md for more information.
    cmake -G "Unix Makefiles" -S. -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DFHS_INSTALL=ON \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DDOWNLOAD_GAMEPACKS=ON \
    -DGAMEPACKS_LICENSE_LIST=free \
    -DGAMEPACKS_NAME_LIST=none

    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}/"

    cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Running update-mime-database will erase the map mime type anyway
    rm -r ${pkgdir}/usr/share/mime/
}
