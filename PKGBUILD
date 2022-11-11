# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=wine-staging-git
pkgver=7.20.r4.g4303e3ee
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (staging branch, git version)'
arch=('x86_64')
url='https://www.wine-staging.com/'
license=('LGPL')
depends=(
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'faudio'                'lib32-faudio'
    'desktop-file-utils'
)
makedepends=('git' 'autoconf' 'bison' 'perl' 'fontforge' 'flex' 'mingw-w64-gcc'
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'gnutls'                'lib32-gnutls'
    'libxinerama'           'lib32-libxinerama'
    'libxcomposite'         'lib32-libxcomposite'
    'libxmu'                'lib32-libxmu'
    'libxxf86vm'            'lib32-libxxf86vm'
    'libldap'               'lib32-libldap'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'alsa-lib'              'lib32-alsa-lib'
    'libxcomposite'         'lib32-libxcomposite'
    'mesa'                  'lib32-mesa'
    'libgl'                 'lib32-libgl'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libpulse'              'lib32-libpulse'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'sdl2'                  'lib32-sdl2'
    'vkd3d'                 'lib32-vkd3d'
    'libcups'               'lib32-libcups'
    'sane'
    'libgphoto2'
    'gsm'
    'ffmpeg'
    'samba'
    'opencl-headers'
    'vulkan-headers'
)
optdepends=(
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'libldap'               'lib32-libldap'
    'gnutls'                'lib32-gnutls'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'libpulse'              'lib32-libpulse'
    'alsa-plugins'          'lib32-alsa-plugins'
    'alsa-lib'              'lib32-alsa-lib'
    'libjpeg-turbo'         'lib32-libjpeg-turbo'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'sdl2'                  'lib32-sdl2'
    'vkd3d'                 'lib32-vkd3d'
    'sane'
    'libgphoto2'
    'gsm'
    'ffmpeg'
    'cups'
    'samba'
    'dosbox'
)
options=('staticlibs' '!lto')
install="${pkgname}.install"
provides=("wine-staging=${pkgver}" "wine=${pkgver%%.r*}" 'wine-wow64')
conflicts=('wine' 'wine-wow64')
source=('git+https://github.com/wine-staging/wine-staging.git'
        'git://source.winehq.org/git/wine.git'
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
    git -C wine checkout "$(wine-staging/patches/patchinstall.sh --upstream-commit)"
    
    # fix path of opencl headers
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*
    
    # fix openldap 2.5+ detection
    sed 's/-lldap_r/-lldap/' -i wine/configure
    
    # apply all wine-staging patches
    printf '%s\n' '  -> Applying wine-staging patches...'
    wine-staging/patches/patchinstall.sh DESTDIR="${srcdir}/wine" --all
}

pkgver() {
    local _tag
    local _ver
    _tag="$(git -C wine-staging tag --sort='version:refname' | sed '$s/-/./g;s/^v//;s/\.rc/rc/')"
    _ver="$(git -C wine-staging describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/')"
    printf '%s' "${_ver/latest.release/"$_tag"}"
}

build() {
    # does not compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,relro,-z,now/}"
    
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
        --libdir='/usr/lib32' \
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
         libdir="${pkgdir}/usr/lib32" \
         dlldir="${pkgdir}/usr/lib32/wine" \
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
    i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib32/wine/i386-windows"/*.dll
    "${CARCH}-w64-mingw32-strip" --strip-unneeded "${pkgdir}/usr/lib/wine/${CARCH}-windows"/*.dll
}
