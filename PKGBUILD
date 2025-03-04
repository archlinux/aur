# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=wine-staging-git
pkgver=10.2.r11.g0682c264
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (staging branch, git version)'
arch=('x86_64')
url='https://www.wine-staging.com/'
license=('LGPL-2.1-or-later')
depends=(
    'attr'            'lib32-attr'
    'desktop-file-utils'
    'fontconfig'      'lib32-fontconfig'
    'freetype2'       'lib32-freetype2'
    'gcc-libs'        'lib32-gcc-libs'
    'gettext'         'lib32-gettext'
    'libpcap'         'lib32-libpcap'
    'libxcursor'      'lib32-libxcursor'
    'libxi'           'lib32-libxi'
    'libxrandr'       'lib32-libxrandr'
)
makedepends=('perl' 'mingw-w64-gcc'
    'git'
    'alsa-lib'              'lib32-alsa-lib'
    'ffmpeg'
    'giflib'                'lib32-giflib'
    'gnutls'                'lib32-gnutls'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'gtk3'                  'lib32-gtk3'
    'libcups'               'lib32-libcups'
    'libgphoto2'
    'libpulse'              'lib32-libpulse'
    'libva'                 'lib32-libva'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'libxxf86vm'            'lib32-libxxf86vm'
    'mesa'                  'lib32-mesa'
    'mesa-libgl'            'lib32-mesa-libgl'
    'opencl-headers'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'samba'
    'sane'
    'sdl2'                  'lib32-sdl2'
    'v4l-utils'             'lib32-v4l-utils'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
)
optdepends=(
    'alsa-lib'              'lib32-alsa-lib'
    'alsa-plugins'          'lib32-alsa-plugins'
    'cups'                  'lib32-libcups'
    'dosbox'
    'ffmpeg'
    'giflib'                'lib32-giflib'
    'gnutls'                'lib32-gnutls'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'gtk3'                  'lib32-gtk3'
    'libgphoto2'
    'libpulse'              'lib32-libpulse'
    'libva'                 'lib32-libva'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'samba'
    'sane'
    'sdl2'                  'lib32-sdl2'
    'v4l-utils'             'lib32-v4l-utils'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'wine-gecko'
    'wine-mono'
)
options=('staticlibs' '!lto')
install="${pkgname}.install"
provides=("wine-staging=${pkgver}" "wine=${pkgver%%.r*}" 'wine-wow64')
conflicts=('wine' 'wine-wow64')
source=('git+https://gitlab.winehq.org/wine/wine-staging.git'
        'git+https://gitlab.winehq.org/wine/wine.git'
        '30-win32-aliases.conf'
        'wine-binfmt.conf')
sha256sums=('SKIP'
            'SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4')

prepare() {
    rm -rf build-{32,64}
    mkdir -p build-{32,64}
    
    # restore the wine tree to its git origin state, without wine-staging patches
    printf '%s\n' '  -> Cleaning wine source code tree...'
    git -C wine reset --hard HEAD  # restore tracked files
    git -C wine clean -xdf         # delete untracked files
    
    # change back to the wine upstream commit that this version of wine-staging is based in
    printf '%s\n' '  -> Changing wine HEAD to the wine-staging base commit...'
    git -C wine config --local advice.detachedHead false
    git -C wine checkout "$(wine-staging/staging/patchinstall.py --upstream-commit)"
    
    # apply all wine-staging patches
    printf '%s\n' '  -> Applying wine-staging patches...'
    wine-staging/staging/patchinstall.py DESTDIR="${srcdir}/wine" --all
}

pkgver() {
    git -C wine-staging describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    
    # apply flags for cross-compilation
    export CROSSCFLAGS="${CFLAGS/-Werror=format-security/} -g"
    export CROSSCXXFLAGS="${CXXFLAGS/-Werror=format-security/} -g"
    export CROSSLDFLAGS="${LDFLAGS//-Wl,-z*([^[:space:]])/}"
    
    # fix build with gcc 14
    export CFLAGS+=' -Wno-incompatible-pointer-types'
    
    # build wine-staging 64-bit
    # (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
    printf '%s\n' '  -> Building wine-staging-64...'
    cd build-64
    ../wine/configure \
        --prefix='/usr' \
        --libdir='/usr/lib' \
        --with-x \
        --with-gstreamer \
        --with-xattr \
        --enable-win64
    make
    
    # build wine-staging 32-bit
    printf '%s\n' '  -> Building wine-staging-32...'
    cd "${srcdir}/build-32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    ../wine/configure \
        --prefix='/usr' \
        --libdir='/usr/lib' \
        --with-x \
        --with-gstreamer \
        --with-xattr \
        --with-wine64="${srcdir}/build-64"
    make
}

package() {
    # package wine-staging 32-bit
    # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
    printf '%s\n' '  -> Packaging wine-staging-32...'
    cd build-32
    make prefix="${pkgdir}/usr" \
         libdir="${pkgdir}/usr/lib" \
         dlldir="${pkgdir}/usr/lib/wine" \
         install
    
    # package wine-staging 64-bit
    printf '%s\n' '  -> Packaging wine-staging-64...'
    cd "${srcdir}/build-64"
    make prefix="${pkgdir}/usr" \
         libdir="${pkgdir}/usr/lib" \
         dlldir="${pkgdir}/usr/lib/wine" \
         install
    
    # font aliasing settings for win32 applications
    install -d -m755 "${pkgdir}/usr/share/fontconfig/conf.default"
    install -D -m644 "${srcdir}/30-win32-aliases.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
    
    # wine binfmt
    install -D -m644 "${srcdir}/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"
    
    # strip native PE libraries
    i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib/wine/i386-windows"/*.dll
    "${CARCH}-w64-mingw32-strip" --strip-unneeded "${pkgdir}/usr/lib/wine/${CARCH}-windows"/*.dll
}
