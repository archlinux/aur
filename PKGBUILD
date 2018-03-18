# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=megaglest-git
pkgver=3.13.0.r81.g6e8cdcab0
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (git version)'
arch=('i686' 'x86_64')
url='https://megaglest.org/'
license=('GPL3')
depends=(
    # official repositories:
        'curl' 'xerces-c' 'sdl2' 'libvorbis' 'openal' 'libgl' 'lua' 'icu'
        'ftgl' 'glew' 'libircclient' 'miniupnpc' 'wxgtk3' 'glu' 'libx11'
        'fontconfig' 'freetype2' 'fribidi' 'libjpeg-turbo' 'vlc' 'libxml2'
        'openssl' 'libpng' 'zlib' 'glib2' 'libxext' 'libsm' 'libice'
    # AUR:
        'megaglest-data-git'
)
makedepends=('git' 'cmake' 'xorg-server-xvfb' 'help2man')
provides=('megaglest')
conflicts=('megaglest')
source=("$pkgname"::'git+https://github.com/MegaGlest/megaglest-source.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # - SSE is available only from Pentium 3 onwards (i686 is way older)
    # - SSE and SSE2 are availabe on all x86_64 CPUs
    [ "$CARCH" = 'i686'   ] && local _sse='0'
    [ "$CARCH" = 'x86_64' ] && local _sse='2' # (supported: 0-3)
    
    cd "$pkgname"
    
    rm -rf build
    mkdir -p build
    cd build
    
    cmake \
        -DBUILD_MEGAGLEST:BOOL='ON' \
        -DBUILD_MEGAGLEST_MAP_EDITOR:BOOL='ON' \
        -DBUILD_MEGAGLEST_MODEL_IMPORT_EXPORT_TOOLS:BOOL='ON' \
        -DBUILD_MEGAGLEST_MODEL_VIEWER:BOOL='ON' \
        -DBUILD_MEGAGLEST_TESTS:BOOL='OFF' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_CXX_FLAGS='-lX11' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL='FALSE' \
        -DFORCE_EMBEDDED_LIBS:BOOL='OFF' \
        -DFORCE_LUA_VERSION:STRING='OFF' \
        -DFORCE_MAX_SSE_LEVEL:STRING="$_sse" \
        -DWANT_DEPRECATION_WARNINGS:BOOL='OFF' \
        -DWANT_DEV_OUTPATH:BOOL='OFF' \
        -DWANT_GIT_STAMP:BOOL='ON' \
        -DWANT_SINGLE_INSTALL_DIRECTORY:BOOL='OFF' \
        -DWANT_STATIC_LIBS:BOOL='OFF' \
        -DWANT_USE_FTGL:BOOL='ON' \
        -DWANT_USE_FontConfig:BOOL='ON' \
        -DWANT_USE_FriBiDi:BOOL='ON' \
        -DWANT_USE_GoogleBreakpad:BOOL='OFF' \
        -DWANT_USE_Ircclient:BOOL='ON' \
        -DWANT_USE_OpenSSL:BOOL='ON' \
        -DWANT_USE_STREFLOP:BOOL='ON' \
        -DWANT_USE_VLC:BOOL='ON' \
        -DWANT_USE_XercesC:BOOL='ON' \
        -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-gtk3' \
        -Wno-dev \
        ..
        
    # using '-j1' will avoid errors when building manpages with xvfb
    make -j1
}

package() {
    cd "${pkgname}/build"
    
    make -j1 DESTDIR="$pkgdir" install
}
