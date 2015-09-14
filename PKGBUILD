# Maintainer: Pierre Franco <pierre dot franco at ensimag dot grenoble dash inp dot fr>
# Based on wine-staging-d3dadapter PKGBUILD

#Additional patches:
# -Mip-Map fix (see https://bugs.winehq.org/show_bug.cgi?id=34480 )
# -Keybind patch reversion
# -Heap allocation perfomance improvement patch


pkgname=wine-gaming-nine
pkgver=1.7.51
pkgrel=2

_basename=wine

source=(https://github.com/wine-mirror/wine/archive/wine-$pkgver.tar.gz
        https://github.com/wine-compholio/wine-staging/archive/v$pkgver.tar.gz
        keybindings.patch
        raw.patch
        mipmap.patch
        nine-1.7.51.patch
        heap_perf.patch
        30-win32-aliases.conf)

sha1sums=('f75d41bcc6511c7641d6633ffeb23a23aeb720ef'
          '9bead94e8a5c7e876f06e32f5119cd451ea3a5ad'
          'f3febb8836f38320742a546c667106608d4c4395'
          '57aa524e4e760c907c2acef287f5569e78ea85b0'
          'c3096fccbac23e520d03f592db7f23350cbbc0bc'
          'ca80253e74ee6d5cb5d1b54b6445f228d376aab4'
          '0f4ac455436d5714a2cf0b537ed25f4fa5c1a7fd'
          '023a5c901c6a091c56e76b6a62d141d87cce9fdb')

pkgdesc="Based off wine-staging-d3dadapter with a few more hacks"
url="http://www.winehq.com"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)
install=wine.install

_depends=(
    fontconfig      lib32-fontconfig
    libxcursor      lib32-libxcursor
    libxrandr       lib32-libxrandr
    libxdamage      lib32-libxdamage
    libxi           lib32-libxi
    gettext         lib32-gettext
    freetype2       lib32-freetype2
    glu             lib32-glu
    libsm           lib32-libsm
    gcc-libs        lib32-gcc-libs
    libpcap         lib32-libpcap
    desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex prelink
    'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
    giflib          lib32-giflib
    libpng          lib32-libpng
    gnutls          lib32-gnutls
    libxinerama     lib32-libxinerama
    libxcomposite   lib32-libxcomposite
    libxmu          lib32-libxmu
    libxxf86vm      lib32-libxxf86vm
    libxml2         lib32-libxml2
    libldap         lib32-libldap
    lcms2           lib32-lcms2
    mpg123          lib32-mpg123
    openal          lib32-openal
    v4l-utils       lib32-v4l-utils
    alsa-lib        lib32-alsa-lib
    libxcomposite   lib32-libxcomposite
    mesa            lib32-mesa
    #mesa-libgl      lib32-mesa-libgl
    libcl           lib32-libcl
    libxslt         lib32-libxslt
    samba
    opencl-headers
)

optdepends=(
    giflib          lib32-giflib
    libpng          lib32-libpng
    libldap         lib32-libldap
    gnutls          lib32-gnutls
    lcms2           lib32-lcms2
    libxml2         lib32-libxml2
    mpg123          lib32-mpg123
    openal          lib32-openal
    v4l-utils       lib32-v4l-utils
    libpulse        lib32-libpulse
    alsa-plugins    lib32-alsa-plugins
    alsa-lib        lib32-alsa-lib
    libjpeg-turbo   lib32-libjpeg-turbo
    libxcomposite   lib32-libxcomposite
    libxinerama     lib32-libxinerama
    ncurses         lib32-ncurses
    libcl           lib32-libcl
    libxslt         lib32-libxslt
    cups
    samba           dosbox
)

if [[ $CARCH == i686 ]]; then
    # Strip lib32 etc. on i686
    _depends=(${_depends[@]/*32-*/})
    makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
    makedepends=(${makedepends[@]/*-multilib*/})
    optdepends=(${optdepends[@]/*32-*/})
    provides=("wine=$pkgver")
    conflicts=('wine')
    replaces=('wine')
else
    makedepends=(${makedepends[@]} ${_depends[@]})
    provides=("bin32-wine=$pkgver" "wine-wow64=$pkgver" "wine=$pkgver")
    conflicts=('bin32-wine' 'wine-wow64' 'wine')
    replaces=('bin32-wine' "wine")
fi

prepare()
{
    #Patch source tree
    cd "$srcdir/wine-staging-$pkgver/patches"

    ./patchinstall.sh DESTDIR="$srcdir/wine-wine-$pkgver" --all

    cd "$srcdir/wine-wine-$pkgver"
    patch -p1 < ../nine-1.7.51.patch
    patch -p1 -R < ../keybindings.patch
    patch -p1 < ../mipmap.patch
    patch -p1 < ../heap_perf.patch

    #OpenCL fix
    cp configure configure_old
    cp configure.ac configure.ac_old
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' configure_old > configure
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' configure.ac_old > configure.ac

  cd "$srcdir"
}

build()
{
    cd "$srcdir"

    # remove once https://bugs.winehq.org/show_bug.cgi?id=38653 is resolved
    export CFLAGS="${CFLAGS/-O2/} -O0"
    export CXXFLAGS="${CXXFLAGS/-O2/} -O0"

    # Get rid of old build dirs
    rm -rf $_basename-{32,64}-build
    mkdir $_basename-32-build

    # These additional CPPFLAGS solve FS#27662 and FS#34195
    export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

    if [[ $CARCH == x86_64 ]]; then
        msg2 "Building Wine-64..."

        mkdir $_basename-64-build
        cd "$srcdir/$_basename-64-build"
        ../wine-wine-$pkgver/configure \
            --prefix=/usr \
            --libdir=/usr/lib \
            --with-x \
            --without-gstreamer \
            --enable-win64 \
            --disable-tests
            # Gstreamer was disabled for FS#33655

        make

        _wine32opts=(
        --libdir=/usr/lib32
        --with-wine64="$srcdir/$_basename-64-build"
        )

        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    fi

    msg2 "Building Wine-32..."
    cd "$srcdir/$_basename-32-build"
    ../wine-wine-$pkgver/configure \
        --prefix=/usr \
        --with-x \
        --without-gstreamer \
        --disable-tests \
    "${_wine32opts[@]}"

    # These additional flags solve FS#23277
    make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package()
{
    depends=(${_depends[@]})

    msg2 "Packaging Wine-32..."
    cd "$srcdir/$_basename-32-build"

    if [[ $CARCH == i686 ]]; then
        make prefix="$pkgdir/usr" install
    else
        make prefix="$pkgdir/usr" \
        libdir="$pkgdir/usr/lib32" \
        dlldir="$pkgdir/usr/lib32/wine" install

        msg2 "Packaging Wine-64..."
        cd "$srcdir/$_basename-64-build"
        make prefix="$pkgdir/usr" \
        libdir="$pkgdir/usr/lib" \
        dlldir="$pkgdir/usr/lib/wine" install
    fi

    # Font aliasing settings for Win32 applications
    install -d "$pkgdir"/etc/fonts/conf.{avail,d}
    install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}
