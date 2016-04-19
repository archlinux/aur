# Maintainer: Pierre Franco <pierre dot franco at ensimag dot grenoble dash inp dot fr>
# Based on wine-staging PKGBUILD

#Additional patches:
# -Mip-Map fix (see https://bugs.winehq.org/show_bug.cgi?id=34480 )
# -Keybind patch reversion
# -Heap allocation perfomance improvement patch
# -Wbemprox videocontroller query fix v2 (see https://bugs.winehq.org/show_bug.cgi?id=38879 )
# -Steam patch, Crossover Hack version (see https://bugs.winehq.org/show_bug.cgi?id=39403 )

pkgname=wine-gaming-nine
pkgver=1.9.8
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}
_winesrcdir="pontostroy-wine-$_pkgbasever"

source=("https://github.com/mradermaxlol/pontostroy-wine/archive/v$_pkgbasever.tar.gz"
		30-win32-aliases.conf
        )
sha1sums=('4cba3dfba02ebced92ddba82a15b8105e0ae86a8'
		  '023a5c901c6a091c56e76b6a62d141d87cce9fdb'
          )

pkgdesc="Based off wine-staging (pontostroy version), including the gallium-nine patches and some more hacks"
url="http://www.wine-staging.com"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)
install=wine.install

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
  libcl           lib32-libcl
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
    cd pontostroy-wine-$_pkgbasever

    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*

    autoreconf -f

    cd $srcdir

    # Get rid of old build dirs
    rm -rf $pkgname-{32,64}-build
    mkdir $pkgname-32-build
}

build()
{
    cd "$srcdir"

    if [[ $CARCH == x86_64 ]]; then
        msg2 "Building Wine-64..."

        mkdir $pkgname-64-build
        cd "$srcdir/$pkgname-64-build"
        ../$_winesrcdir/configure \
            --prefix=/usr \
            --libdir=/usr/lib \
            --with-x \
            --enable-win64 \
            --with-xattr \
            --with-d3dadapter \
            --disable-tests

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
