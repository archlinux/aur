# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Sidney Crestani <sidneycrestani@archlinux.net>
# Contributor: sxe <sxxe@gmx.de>

pkgname=wine-git
pkgver=9.0rc3.r16.geed778467ab
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (git version)'
arch=('x86_64')
url='https://www.winehq.org/'
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
    'libxi'           'lib32-libxi'
    'libxrandr'       'lib32-libxrandr'

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
install="${pkgname}.install"
provides=("wine=${pkgver}" "bin32-wine=${pkgver}" "wine-wow64=${pkgver}")
conflicts=('wine' 'bin32-wine' 'wine-wow64')
replaces=('bin32-wine')
source=('git+https://gitlab.winehq.org/wine/wine.git'
        '30-win32-aliases.conf'
        'wine-binfmt.conf')
sha256sums=('SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4')

prepare() {
    rm -rf build-{32,64}
    mkdir -p build-{32,64}
}

pkgver() {
    git -C wine describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
    # does not compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    
    # build wine 64-bit
    # (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
    printf '%s\n' '  -> Building wine-64...'
    cd build-64
    ../wine/configure \
        --prefix='/usr' \
        --libdir='/usr/lib' \
        --with-x \
        --with-gstreamer \
        --enable-win64
    make
    
    # build wine 32-bit
    printf '%s\n' '  -> Building wine-32...'
    cd "${srcdir}/build-32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    ../wine/configure \
        --prefix='/usr' \
        --libdir='/usr/lib32' \
        --with-x \
        --with-gstreamer \
        --with-wine64="${srcdir}/build-64"
    make
}

package() {
    # package wine 32-bit
    # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
    printf '%s\n' '  -> Packaging wine-32...'
    cd build-32
    make prefix="${pkgdir}/usr" \
         libdir="${pkgdir}/usr/lib32" \
         dlldir="${pkgdir}/usr/lib32/wine" \
         install
    
    # package wine 64-bit
    printf '%s\n' '  -> Packaging wine-64...'
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
}
