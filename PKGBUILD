# Maintainer: Pierre Franco <pierre dot franco at ensimag dot grenoble dash inp dot fr>
# Based on wine-staging PKGBUILD

#Additional patches:
# -Gallium Nine support
# -Keybind patch reversion
# -Heap allocation perfomance improvement patch
# -Wbemprox videocontroller query fix v2 (see https://bugs.winehq.org/show_bug.cgi?id=38879 )
# -Steam patch, Crossover Hack version (see https://bugs.winehq.org/show_bug.cgi?id=39403 )
# -Increase fragment samplers threshold (see https://bugs.winehq.org/show_bug.cgi?id=41213 ) OPTIONAL

pkgname=wine-gaming-nine
pkgver=2.1
pkgrel=2

_pkgbasever=${pkgver/rc/-rc}
_d3d9ver=$_pkgbasever
#_d3d9ver=2.0
_winesrcdir="wine-patched-staging-$_pkgbasever"

source=("https://github.com/wine-compholio/wine-patched/archive/staging-$_pkgbasever.tar.gz"
        "https://github.com/sarnex/wine-d3d9-patches/archive/wine-d3d9-$_d3d9ver.tar.gz"
        30-win32-aliases.conf
	heap_perf.patch
        increase_max_frag_samplers.patch
	keybindings.patch
        steam.patch
        wbemprox_query_v2.patch
        )
sha1sums=('d7df806d6598be1e818413224e1d281d008879e8'
	  '42249320d849e35dad6cc4f3e16a00322b49b2d1'
          '023a5c901c6a091c56e76b6a62d141d87cce9fdb'
          '0f4ac455436d5714a2cf0b537ed25f4fa5c1a7fd'
	  'a84456790932fb2e7bb75ddeac86fd45b7c09e79'
          'f3febb8836f38320742a546c667106608d4c4395'
          '74aae040fde9ff3c9e8da9c840557e87afdbc3a0'
          '644e141125a9f2407e64d23c85ec84a691c7caae'
          )

pkgdesc="Based off wine-staging, including the gallium-nine patches and some more hacks"
url="http://www.wine-staging.com"
arch=(i686 x86_64)
options=(staticlibs !upx)
license=(LGPL)

_depends=(
  attr            lib32-attr
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
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
  lib32-libtxc_dxtn
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=5.3.0-4'  'gcc-multilib>=5.3.0-4'
  giflib          lib32-giflib
  libpng          lib32-libpng
  gnutls          lib32-gnutls
  libxinerama     lib32-libxinerama
  libxcomposite   lib32-libxcomposite
  libxmu          lib32-libxmu
  libxxf86vm      lib32-libxxf86vm
  libldap         lib32-libldap
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  libxcomposite   lib32-libxcomposite
  mesa            lib32-mesa
  libgl           lib32-libgl
  ocl-icd         lib32-ocl-icd
  libxslt         lib32-libxslt
  libpulse        lib32-libpulse
  libva           lib32-libva
  gtk3            lib32-gtk3
  samba
  opencl-headers
  dri2proto
  dri3proto
  xf86driproto
  pkg-config
)

optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
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
  libva           lib32-libva
  gtk3            lib32-gtk3
  cups
  samba
  dosbox
)

if [[ $CARCH == i686 ]]; then
    # Strip lib32 etc. on i686
    _depends=(${_depends[@]/*32-*/})
    makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
    makedepends=(${makedepends[@]/*-multilib*/})
    optdepends=(${optdepends[@]/*32-*/})
    provides=("wine=$pkgver")
    conflicts=('wine')
else
    makedepends=(${makedepends[@]} ${_depends[@]})
    provides=("wine=$pkgver" "wine-wow64=$pkgver" "wine-staging=$pkgver")
    conflicts=('wine' 'wine-wow64' 'wine-staging')
fi

prepare()
{
    cd wine-patched-staging-$_pkgbasever

    patch -p1 < "$srcdir/wine-d3d9-patches-wine-d3d9-$_d3d9ver/staging-helper.patch" #for wine-staging
    patch -p1 < "$srcdir/wine-d3d9-patches-wine-d3d9-$_d3d9ver/wine-d3d9.patch"
    patch -p1 < ../steam.patch
    patch -p1 < ../heap_perf.patch
    
    #patch -p1 < ../increase_max_frag_samplers.patch
    
    patch -p1 < ../wbemprox_query_v2.patch

    patch -p1 -R < ../keybindings.patch

    autoreconf -f

    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*

    cd $srcdir

    # Get rid of old build dirs
    rm -rf $pkgname-{32,64}-build
    mkdir -p $pkgname-32-build
}

build()
{
    cd "$srcdir"

    if [[ $CARCH == x86_64 ]]; then
        msg2 "Building Wine-64..."

        mkdir -p $pkgname-64-build
        cd "$srcdir/$pkgname-64-build"
        ../$_winesrcdir/configure \
            --prefix=/usr \
            --libdir=/usr/lib \
            --with-x \
            --enable-win64 \
            --with-xattr \
            --with-d3dadapter \
            --disable-tests
        # Gstreamer was disabled for FS#33655

        make

        _wine32opts=(
        --libdir=/usr/lib32
        --with-wine64="$srcdir/$pkgname-64-build"
        )

        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    fi

    msg2 "Building Wine-32..."
    cd "$srcdir/$pkgname-32-build"
    ../$_winesrcdir/configure \
        --prefix=/usr \
        --with-x \
        --with-xattr \
        --disable-tests \
        --with-d3dadapter \
        "${_wine32opts[@]}"

    # These additional flags solve FS#23277
    make
}

package()
{
    depends=(${_depends[@]})

    msg2 "Packaging Wine-32..."
    cd "$srcdir/$pkgname-32-build"

    if [[ $CARCH == i686 ]]; then
        make prefix="$pkgdir/usr" install
    else
        make prefix="$pkgdir/usr" \
        libdir="$pkgdir/usr/lib32" \
        dlldir="$pkgdir/usr/lib32/wine" install

        msg2 "Packaging Wine-64..."
        cd "$srcdir/$pkgname-64-build"
        make prefix="$pkgdir/usr" \
        libdir="$pkgdir/usr/lib" \
        dlldir="$pkgdir/usr/lib/wine" install
    fi

    # Font aliasing settings for Win32 applications
    install -d "$pkgdir"/etc/fonts/conf.{avail,d}
    install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}
