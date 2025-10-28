# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Co-maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r2618.04201ff5
pkgrel=1
epoch=1
pkgdesc='The open source, cross platform level editor for idtech games (GtkRadiant fork)'
url='https://netradiant.gitlab.io/'
license=('Apache-2.0' 'BSD-3-Clause' 'GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MIT' 'Zlib')
arch=('i686' 'x86_64')
depends=('bash' 'cairo' 'gdk-pixbuf2' 'gcc-libs' 'glibc' 'glib2' 'gtk2' 'gtkglext' 'libglvnd' 'libjpeg-turbo'
         'libpng' 'libwebp' 'libxml2' 'libx11' 'minizip' 'pango' 'zlib')
makedepends=('cmake' 'git' 'make' 'svn' 'unzip' 'wget')
optdepends=('gtk3: compile and run netradiant with gtk3, it works but with some drawbacks')
provides=('netradiant' 'h2data' 'q2map' 'q3data' 'q3map2' 'qdata3')
source=("${pkgname}::git+https://gitlab.com/xonotic/netradiant.git"
        "git+https://github.com/DaemonEngine/crunch.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Fetch the Crunch submodule
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.libs/crunch.url "${srcdir}/crunch"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}/"

    # Possible values for the GAMEPACKS_LICENSE_LIST filter are "free",
    # "all" (free + proprietary) and "none".
    # If you only want to fetch the Unvanquished and Xonotic gamepacks for example,
    # use -DGAMEPACKS_LICENSE_LIST=none and -DGAMEPACKS_NAME_LIST="Unvanquished Xonotic".
    # See https://gitlab.com/xonotic/netradiant/-/blob/master/README.md for further instructions.

    # Add -DGTK_TARGET=3 to build and run NetRadiant with gtk3 instead of gtk2 + gtkglext, don't forget
    # to edit the package dependencies accordingly.

    cmake -G "Unix Makefiles" -S. -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DFHS_INSTALL=ON \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DRADIANT_ABOUTMSG="NetRadiant git build for Arch Linux" \
    -DDOWNLOAD_GAMEPACKS=ON \
    -DGAMEPACKS_LICENSE_LIST=free \
    -DGAMEPACKS_NAME_LIST=none

    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}/"

    cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "../crunch/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/crunch/license.txt"
    
    # Running update-mime-database will erase the map mime type anyway
    rm -r "${pkgdir}/usr/share/mime/"
}
