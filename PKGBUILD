# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Sidney Crestani <sidneycrestani@archlinux.net>
# Contributor: sxe <sxxe@gmx.de>

pkgname=wine-git
pkgver=4.20.r74.ga9c4b309f6
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (git version)'
arch=('i686' 'x86_64')
url='https://www.winehq.org/'
license=('LGPL')
_depends=(
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
makedepends=('git' 'autoconf' 'ncurses' 'bison' 'perl' 'fontforge' 'flex'
    'gcc>=4.5.0-2'
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
    'libpulse'              'lib32-libpulse'
    'alsa-lib'              'lib32-alsa-lib'
    'libxcomposite'         'lib32-libxcomposite'
    'mesa'                  'lib32-mesa'
    'libgl'                 'lib32-libgl'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'vkd3d'                 'lib32-vkd3d'
    'sdl2'                  'lib32-sdl2'
    'libcups'               'lib32-libcups'
    'libgphoto2'
    'sane'
    'gsm'
    'vulkan-headers'
    'opencl-headers'
    'samba'
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
    'ncurses'               'lib32-ncurses'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'vkd3d'                 'lib32-vkd3d'
    'sdl2'                  'lib32-sdl2'
    'libgphoto2'
    'sane'
    'gsm'
    'cups'
    'samba'
    'dosbox'
)
options=('staticlibs')
install="${pkgname}.install"
source=('git://source.winehq.org/git/wine.git'
        '30-win32-aliases.conf'
        'wine-binfmt.conf')
sha256sums=('SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4')

if [ "$CARCH" = 'i686' ] 
then
    # strip lib32 etc. on i686
    _depends=(${_depends[@]/*32-*/})
    makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
    optdepends=(${optdepends[@]/*32-*/})
    provides=("wine=${pkgver}")
    conflicts=('wine')
else
    makedepends=(${makedepends[@]} ${_depends[@]})
    provides=("wine=${pkgver}" "bin32-wine=${pkgver}" "wine-wow64=${pkgver}")
    conflicts=('wine' 'bin32-wine' 'wine-wow64')
    replaces=('bin32-wine')
fi

prepare() {
    # delete old build dirs (from previous builds) and make new ones
    rm    -rf "$pkgname"-{32,64}-build
    mkdir -p  "$pkgname"-32-build
    [ "$CARCH" = 'x86_64' ] && mkdir "$pkgname"-64-build
    
    cd wine
    
    # fix path of opencl headers
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
}

pkgver() {
    cd wine
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
    # workaround for FS#55128
    # https://bugs.archlinux.org/task/55128
    # https://bugs.winehq.org/show_bug.cgi?id=43530
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    
    # build wine 64-bit
    # (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
    if [ "$CARCH" = 'x86_64' ] 
    then
        printf '%s\n' '  -> Building Wine-64...'
        cd    "$pkgname"-64-build
        ../wine/configure \
                    --prefix='/usr' \
                    --libdir='/usr/lib' \
                    --with-x \
                    --with-gstreamer \
                    --enable-win64
        make
        local _wine32opts=(
                    '--libdir=/usr/lib32'
                    "--with-wine64=${srcdir}/${pkgname}-64-build"
        )
        export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    fi
    
    # build wine 32-bit
    printf '%s\n' '  -> Building Wine-32...'
    cd "${srcdir}/${pkgname}"-32-build
    ../wine/configure \
                --prefix='/usr' \
                --with-x \
                --with-gstreamer \
                ${_wine32opts[@]}
    make
}

package() {
    depends=(${_depends[@]})
    
    # package wine 32-bit
    # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
    printf '%s\n' '  -> Packaging Wine-32...'
    
    cd "$pkgname"-32-build
    
    if [ "$CARCH" = 'i686' ] 
    then
        make prefix="$pkgdir/usr" install
    else
        make prefix="$pkgdir/usr" \
             libdir="$pkgdir/usr/lib32" \
             dlldir="$pkgdir/usr/lib32/wine" install
    
        # package wine 64-bit
        printf '%s\n' '  -> Packaging Wine-64...'
        cd "${srcdir}/${pkgname}"-64-build
        make prefix="$pkgdir/usr" \
             libdir="$pkgdir/usr/lib" \
             dlldir="$pkgdir/usr/lib/wine" install
    fi
    
    # font aliasing settings for Win32 applications
    install -d "$pkgdir"/etc/fonts/conf.{avail,d}
    install -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf       "${pkgdir}/etc/fonts/conf.d/30-win32-aliases.conf"
    
    # wine binfmt
    install -D -m644 "${srcdir}/wine-binfmt.conf"   "${pkgdir}/usr/lib/binfmt.d/wine.conf"
}
