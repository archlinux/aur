# Maintainer : Vitor Veloso <vitorveloso@iid.org.br>
# Based on wine-git: 
## Contributor : Daniel Bermond <dbermond@archlinux.org>
## Contributor: Sidney Crestani <sidneycrestani@archlinux.net>
## Contributor: sxe <sxxe@gmx.de> 


pkgname=winecx
pkgver=$(curl -s 'https://media.codeweavers.com/pub/crossover/source/?C=M;O=A' |
    grep -oP 'crossover-sources-\K[0-9.]+(?=\.tar\.gz)' |
    tail -n 1)
pkgrel=1
pkgdesc='CrossOver Wine'
arch=('x86_64')
url='https://www.codeweavers.com/crossover/'
license=('LGPL')

depends=(
    'desktop-file-utils'
    'fontconfig'      'lib32-fontconfig'
    'freetype2'       'lib32-freetype2'
    'gcc-libs'        'lib32-gcc-libs'
    'gettext'         'lib32-gettext'
    'libpcap'         'lib32-libpcap'
    'libunwind'       'lib32-libunwind'
    'libxcursor'      'lib32-libxcursor'
    'libxkbcommon'    'lib32-libxkbcommon'
    'libxi'           'lib32-libxi'
    'libxrandr'       'lib32-libxrandr'
    'wayland'         'lib32-wayland'
)
makedepends=('git' 'perl' 'mingw-w64-gcc'
    'alsa-lib'              'lib32-alsa-lib'
    'gnutls'                'lib32-gnutls'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'libcups'               'lib32-libcups'
    'libgphoto2'
    'libpulse'              'lib32-libpulse'
    'libxcomposite'         'lib32-libxcomposite'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'libxxf86vm'            'lib32-libxxf86vm'
    'mesa'                  'lib32-mesa'
    'mesa-libgl'            'lib32-mesa-libgl'
    'opencl-headers'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'pcsclite'              'lib32-pcsclite'
    'samba'
    'sane'
    'sdl2'                  'lib32-sdl2'
    'unixodbc'
    'v4l-utils'             'lib32-v4l-utils'
    'vulkan-headers'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
)
optdepends=(
    'alsa-lib'              'lib32-alsa-lib'
    'alsa-plugins'          'lib32-alsa-plugins'
    'cups'                  'lib32-libcups'
    'dosbox'
    'gnutls'                'lib32-gnutls'
    'gst-plugins-bad'
    'gst-plugins-base'      'lib32-gst-plugins-base'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'gst-plugins-good'      'lib32-gst-plugins-good'
    'gst-plugins-ugly'
    'libgphoto2'
    'libpulse'              'lib32-libpulse'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'pcsclite'              'lib32-pcsclite'
    'samba'
    'sane'
    'sdl2'                  'lib32-sdl2'
    'unixodbc'
    'v4l-utils'             'lib32-v4l-utils'
    'wine-gecko'
    'wine-mono'

)
options=('staticlibs' '!lto')


provides=("winecx=${pkgver}" "bin32-winecx=${pkgver}" "winecx-wow64=${pkgver}")
conflicts=('winecx')
replaces=('winecx')

source=("https://media.codeweavers.com/pub/crossover/source/crossover-sources-${pkgver}.tar.gz"
        'distversion.h'
        '30-win32-aliases.conf'
        'winecx'
        'winecx64')
sha256sums=('SKIP'
            '5d30dd4fa71b55ae5f3e30782a2c93ec506a6c6f65017c1a0995230ad7b39a82'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            'SKIP'
            'SKIP')


prepare() {
    # Alteração: Ajuste para a nova estrutura de diretórios
    mkdir -p "${srcdir}/sources/wine/programs/winedbg"
    cp "${srcdir}/distversion.h" "${srcdir}/sources/wine/programs/winedbg/distversion.h"
    rm -rf build-{32,64}
    mkdir -p build-{32,64}
}

build() {

    export CFLAGS+=' -ffat-lto-objects -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types' 
    # apply flags for cross-compilation
    export CROSSCFLAGS="${CFLAGS/-Werror=format-security/} -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
 #   export CFLAGS+=' -ffat-lto-objects'
    # apply flags for cross-compilation
 #   export CROSSCFLAGS="${CFLAGS/-Werror=format-security/}"
    export CROSSCXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
    export CROSSLDFLAGS="${LDFLAGS//-Wl,-z*([^[:space:]])/}"
    
    # build wine 64-bit
    printf '%s\n' '  -> Building wine-64...'
    cd build-64
    # Alteração: Ajuste para a nova estrutura de diretórios
    ../sources/wine/configure \
        --prefix='/opt/winecx' \
        --libdir='/opt/winecx/lib' \
        --with-x \
        --with-wayland \
        --with-gstreamer \
        --with-vulkan \
        --enable-win64
    make -j4
    
    # build wine 32-bit
    printf '%s\n' '  -> Building wine-32...'
    cd "${srcdir}/build-32"
    export PKG_CONFIG_PATH='/opt/winecx/lib32/pkgconfig'
    # Alteração: Ajuste para a nova estrutura de diretórios
    ../sources/wine/configure \
        --prefix='/opt/winecx' \
        --libdir='/opt/winecx/lib32' \
        --with-x \
        --with-wayland \
        --with-gstreamer \
        --with-vulkan \
        --with-wine64="${srcdir}/build-64"
    make -j4
}

package() {
    # package wine 32-bit
    # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
    printf '%s\n' '  -> Packaging wine-32...'
    cd build-32
    make -j8 prefix="${pkgdir}/opt/winecx" \
         libdir="${pkgdir}/opt/winecx/lib32" \
         dlldir="${pkgdir}/opt/winecx/lib32/wine" \
         install
    
    # package wine 64-bit
    printf '%s\n' '  -> Packaging wine-64...'
    cd "${srcdir}/build-64"
    make -j8 prefix="${pkgdir}/opt/winecx" \
         libdir="${pkgdir}/opt/winecx/lib" \
         dlldir="${pkgdir}/opt/winecx/lib/wine" \
         install
    
    # font aliasing settings for win32 applications
    install -d -m755 "${pkgdir}/opt/winecx/share/fontconfig/conf.default"
    install -D -m644 "${srcdir}/30-win32-aliases.conf" -t "${pkgdir}/opt/winecx/share/fontconfig/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/opt/winecx/share/fontconfig/conf.default/30-win32-aliases.conf"

    # Create symbolic links in /usr/bin
    install -d "${pkgdir}/usr/bin"
    
    install -D -m755 "${srcdir}/winecx" -t "${pkgdir}/usr/bin/"
    install -D -m755 "${srcdir}/winecx64" -t "${pkgdir}/usr/bin/"

    #ln -s /opt/winecx/bin/wine "${pkgdir}/usr/bin/winecx"
    #ln -s /opt/winecx/bin/wine64 "${pkgdir}/usr/bin/winecx64"
    #ln -s /opt/winecx/bin/wineserver "${pkgdir}/usr/bin/winecxserver"
}
