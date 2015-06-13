# Maintainer:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-rt
pkgver=1.7.45
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(http://prdownloads.sourceforge.net/wine/wine-$_pkgbasever.tar.bz2{,.sign}
        30-win32-aliases.conf
        wine-rt-101107.patch)

sha256sums=('a30cef1ee4ceaee4b6c9c2ad96df3b8a8847278246e7727624db314c68adaa23'
            'SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            'cd8c48c9e5111b6acb47120da0272bc7afe3acc1f021443c81bb75d5d40ba4cc')

validpgpkeys=('5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7')

pkgdesc="Realtime Wine - maps windows priority levels to linux scheduling policies"
url="http://www.winehq.com"
arch=(i686 x86_64)
options=(staticlibs)
options=(staticlibs !buildflags) # remove !buildflags once https://bugs.winehq.org/show_bug.cgi?id=38653 is resolved
license=(LGPL)
install=wine-rt.install

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
  mesa-libgl      lib32-mesa-libgl
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
  provides=("wine=$pkgver")
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  makedepends=(${makedepends[@]} ${_depends[@]})
  provides=("wine=$pkgver" "bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('wine' 'bin32-wine' 'wine-wow64')
  replaces=('wine' 'bin32-wine')
fi

prepare() {
  if [ -f "$srcdir//wine-$pkgver/README.WINE-RT" ]
  then
    rm  "$srcdir//wine-$pkgver/README.WINE-RT"
  fi

  cd "$srcdir/wine-$_pkgbasever"
  
  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*

  msg2 "Apply wine-rt-101107.patch"
  patch -s -Np1 -i $srcdir/wine-rt-101107.patch

  msg2 "Patches applied cleanly, continue building wine"
}

build() {
  cd "$srcdir"

  # Allow ccache to work
  mv wine-$_pkgbasever wine

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-32-build

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  # Fix build with GCC5
  export CFLAGS="${CFLAGS/-O2/} -O0"
  export CXXFLAGS="${CXXFLAGS/-O2/} -O0"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir wine-64-build
    cd "$srcdir/wine-64-build"
    ../wine/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
      --disable-tests \
      --without-gstreamer \
      --enable-win64
    # Gstreamer was disabled for FS#33655

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/wine-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/wine-32-build"
  ../wine/configure \
    --prefix=/usr \
    --with-x \
    --disable-tests \
    --without-gstreamer \
    "${_wine32opts[@]}"

  # Not needed...

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package() {
  depends=(${_depends[@]})

  msg2 "Packaging Wine-32..."
  cd "$srcdir/wine-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/wine-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"

  mkdir -p "$pkgdir/usr/share/doc/wine-rt"
  cp "$srcdir/wine/README.WINE-RT" "$pkgdir/usr/share/doc/wine-rt"
}
