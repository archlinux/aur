# Maintainer: Joshua Ashton < joshua at nonagon dot games >

# wine-staging-git:
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

# Mainly a copy of wine-staging-git's (Daniel Bermond, dbermond) PKGBUILD so the credit goes to the contributors for that.
# Thanks guys.

pkgname=wine-whatever
pkgver=2.21.r7.gc51ffd63+wine.2.21.r0.g53290d2ec4
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (staging branch, git version, with community patches)'
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
    'desktop-file-utils'
)
makedepends=('git' 'autoconf' 'ncurses' 'bison' 'perl' 'flex'
    'gcc'          	    'gcc-multilib'
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
    'samba'
    'opencl-headers'
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
    'cups'
    'samba'
    'dosbox'
)
options=('staticlibs')
source=('wine-git'::'git://source.winehq.org/git/wine.git'
        "$pkgname"::'git+https://github.com/Joshua-Ashton/wine-whatever.git')
sha256sums=('SKIP'
            'SKIP')

if [ "$CARCH" = 'i686' ] 
then
    # strip lib32 etc. on i686
    _depends=("${_depends[@]/*32-*/}")
    makedepends=("${makedepends[@]/*32-*/}" "${_depends[@]}")
    makedepends=("${makedepends[@]/*-multilib*/}")
    optdepends=("${optdepends[@]/*32-*/}")
    provides=(
        "wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
    )
    conflicts=('wine' 'wine-git' 'wine-staging')
else
    makedepends=("${makedepends[@]}" "${_depends[@]}")
    provides=(
        "wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-wow64=$(  printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
    )
    conflicts=('wine' 'wine-wow64' 'wine-git' 'wine-staging')
fi

prepare() {
    cd 'wine-git'
    
    # restore the wine tree to its git origin state, without wine-staging patches
    # (necessary for reapllying wine-staging patches in succedent builds,
    # otherwise the patches will fail to be reapplied)
    msg2 'Cleaning wine source code tree...'
    git reset --hard HEAD      # restore tracked files
    git clean -xdf             # delete untracked files
    
    # change back to the wine upstream commit that this version of wine-staging is based in
    msg2 'Changing wine HEAD to the wine-staging base commit...'
    git checkout "$(../"$pkgname"/patches/patchinstall.sh --upstream-commit)"
    
    # fix path of opencl headers
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
}

pkgver() {
    cd "$pkgname"
    local _staging_tag="$(git tag --sort='version:refname' | tail -n1 | sed 's/-/./g;s/^v//')"
    local _staging_version="$(git describe --long --tags \
                                | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' \
                                | sed "s/^latest.release/${_staging_tag}/")"
    cd "${srcdir}/wine-git"
    local _wine_version="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
    
    printf '%s+%s' "$_staging_version" "$_wine_version"
}

build() {
    # delete old build dirs (from previous builds) and make new ones
    rm    -rf "$pkgname"-{32,64}-build
    mkdir -p  "$pkgname"-32-build
    
    # apply all wine-staging patches
    msg2 'Applying wine-staging patches...'
    ./"${pkgname}"/patches/patchinstall.sh DESTDIR="${srcdir}/wine-git" --all
    
    # workaround for FS#55128
    # https://bugs.archlinux.org/task/55128
    # https://bugs.winehq.org/show_bug.cgi?id=43530
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    
    # build wine-staging 64-bit
    # (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
    if [ "$CARCH" = "x86_64" ] 
    then
        msg2 'Building Wine-64...'
        mkdir -p "$pkgname"-64-build
        cd  "$pkgname"-64-build
        ../wine-git/configure \
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
    msg2 'Building Wine-32...'
    cd "${srcdir}/${pkgname}"-32-build
    ../wine-git/configure \
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
    msg2 'Packaging Wine-32...'
    cd "$pkgname"-32-build
    
    if [ "$CARCH" = 'i686' ] 
    then
        make prefix="${pkgdir}/usr" install
    else
        make prefix="${pkgdir}/usr" \
             libdir="${pkgdir}/usr/lib32" \
             dlldir="${pkgdir}/usr/lib32/wine" install
        
        # package wine-staging 64-bit
        msg2 'Packaging Wine-64...'
        cd "${srcdir}/${pkgname}"-64-build
        make prefix="${pkgdir}/usr" \
             libdir="${pkgdir}/usr/lib" \
             dlldir="${pkgdir}/usr/lib/wine" install
    fi
    
    # font aliasing settings for Win32 applications
    install -d "$pkgdir"/etc/fonts/conf.{avail,d}
    install -m644 "${srcdir}/${pkgname}/misc/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.avail"
    ln -s "${pkgdir}/etc/fonts/conf.avail/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.d/30-win32-aliases.conf"
}
