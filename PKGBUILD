# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=wine-staging-git
pkgver=5.4.r8.g53b02cd0+wine.5.4.r128.gc43998cb51
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (staging branch, git version)'
arch=('i686' 'x86_64')
url='https://www.wine-staging.com/'
license=('LGPL')
_depends=(
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
    'ncurses'               'lib32-ncurses'
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
options=('staticlibs')
install="${pkgname}.install"
source=('git://source.winehq.org/git/wine.git'
        'git+https://github.com/wine-staging/wine-staging.git'
        '30-win32-aliases.conf'
        'wine-binfmt.conf')
sha256sums=('SKIP'
            'SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4')

if [ "$CARCH" = 'i686' ] 
then
    # strip lib32 etc. on i686
    _depends=("${_depends[@]/*32-*/}")
    makedepends=("${makedepends[@]/*32-*/}" "${_depends[@]}")
    optdepends=("${optdepends[@]/*32-*/}")
    provides=(
        "wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
    )
    conflicts=('wine')
else
    makedepends=("${makedepends[@]}" "${_depends[@]}")
    provides=(
        "wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-wow64=$(  printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
    )
    conflicts=('wine' 'wine-wow64')
fi

prepare() {
    # delete old build dirs (from previous builds) and make new ones
    rm    -rf "$pkgname"-{32,64}-build
    mkdir -p  "$pkgname"-32-build
    [ "$CARCH" = 'x86_64' ] && mkdir "$pkgname"-64-build
    
    cd wine
    
    # restore the wine tree to its git origin state, without wine-staging patches
    # (necessary for reapllying wine-staging patches in succedent builds,
    # otherwise the patches will fail to be reapplied)
    printf '%s\n' '  -> Cleaning wine source code tree...'
    git reset --hard HEAD  # restore tracked files
    git clean -xdf         # delete untracked files
    
    # change back to the wine upstream commit that this version of wine-staging is based in
    printf '%s\n' '  -> Changing wine HEAD to the wine-staging base commit...'
    git checkout "$(../wine-staging/patches/patchinstall.sh --upstream-commit)"
    
    # fix path of opencl headers
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
    
    # apply all wine-staging patches
    printf '%s\n' '  -> Applying wine-staging patches...'
    cd "${srcdir}/wine-staging/patches"
    ./patchinstall.sh DESTDIR="${srcdir}/wine" --all
}

pkgver() {
    local _staging_tag
    local _staging_version
    local _wine_version
    
    cd wine-staging
    _staging_tag="$(git tag --sort='version:refname' | tail -n1 | sed 's/-/./g;s/^v//;s/\.rc/rc/')"
    _staging_version="$(git describe --long --tags \
                          | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/' \
                          | sed "s/^latest.release/${_staging_tag}/")"
    cd "${srcdir}/wine"
    _wine_version="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/')"
    
    printf '%s+%s' "$_staging_version" "$_wine_version"
}

build() {
    # workaround for FS#55128
    # https://bugs.archlinux.org/task/55128
    # https://bugs.winehq.org/show_bug.cgi?id=43530
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    
    # build wine-staging 64-bit
    # (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
    if [ "$CARCH" = 'x86_64' ] 
    then
        printf '%s\n' '  -> Building Wine-64...'
        cd  "$pkgname"-64-build
        ../wine/configure \
                    --prefix='/usr' \
                    --libdir='/usr/lib' \
                    --with-x \
                    --with-gstreamer \
                    --enable-win64 \
                    --with-xattr
        make
        local _wine32opts=(
                    '--libdir=/usr/lib32'
                    "--with-wine64=${srcdir}/${pkgname}-64-build"
        )
        export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    fi
    
    # build wine-staging 32-bit
    printf '%s\n' '  -> Building Wine-32...'
    cd "${srcdir}/${pkgname}"-32-build
    ../wine/configure \
                --prefix='/usr' \
                --with-x \
                --with-gstreamer \
                --with-xattr \
                "${_wine32opts[@]}"
    make
}

package() {
    depends=("${_depends[@]}")
    
    # package wine-staging 32-bit
    # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
    printf '%s\n' '  -> Packaging Wine-32...'
    cd "$pkgname"-32-build
    
    if [ "$CARCH" = 'i686' ] 
    then
        make prefix="${pkgdir}/usr" install
    else
        make prefix="${pkgdir}/usr" \
             libdir="${pkgdir}/usr/lib32" \
             dlldir="${pkgdir}/usr/lib32/wine" install
        
        # package wine-staging 64-bit
        printf '%s\n' '  -> Packaging Wine-64...'
        cd "${srcdir}/${pkgname}"-64-build
        make prefix="${pkgdir}/usr" \
             libdir="${pkgdir}/usr/lib" \
             dlldir="${pkgdir}/usr/lib/wine" install
    fi
    
    # font aliasing settings for Win32 applications
    install -d "$pkgdir"/etc/fonts/conf.{avail,d}
    install -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf       "${pkgdir}/etc/fonts/conf.d/30-win32-aliases.conf"
    
    # wine binfmt
    install -D -m644 "${srcdir}/wine-binfmt.conf"   "${pkgdir}/usr/lib/binfmt.d/wine.conf"
}
