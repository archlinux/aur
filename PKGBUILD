# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine 1.9.x,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable
pkgver=1.8.6
pkgrel=3

source=(https://dl.winehq.org/wine/source/1.8/wine-$pkgver.tar.bz2{,.sign}
        30-win32-aliases.conf
        0001-programs-winhlp32-Use-noyywrap-for-macro.lex.l.patch)
sha256sums=('b1797896eb3b63aab8a4753cc756d6211a0e85460146a1b52063ec79c13906d3'
            'SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            'da2f15457044a397483bbf52bf4e59f1000bf270ab823a0b8957e905a1a933f7')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)

depends=(desktop-file-utils fontconfig freetype2 gettext glu lcms2
    libpcap libsm libxcursor libxdamage libxi libxml2 libxrandr)

depends_x86_64=(lib32-fontconfig lib32-freetype2 lib32-gcc-libs
  lib32-gettext lib32-glu lib32-lcms2 lib32-libpcap lib32-libsm
  lib32-libxcursor lib32-libxdamage lib32-libxi lib32-libxml2
  lib32-libxrandr)

makedepends=(alsa-lib fontforge giflib gnutls libgl libldap libpng
  libpulse libxcomposite libxinerama libxmu libxslt libxxf86vm mesa
  mpg123 ncurses ocl-icd openal opencl-headers samba v4l-utils)

makedepends_x86_64=(gcc-multilib lib32-alsa-lib lib32-giflib
  lib32-gnutls lib32-libgl lib32-libldap lib32-libpng lib32-libpulse
  lib32-libxcomposite lib32-libxinerama lib32-libxmu lib32-libxslt
  lib32-libxxf86vm lib32-mesa lib32-mpg123 lib32-ocl-icd lib32-openal
  lib32-v4l-utils)

optdepends=(alsa-lib alsa-plugins cups dosbox giflib gnutls
  libjpeg-turbo libldap libpng libpulse libxcomposite libxinerama
  libxslt mpg123 ncurses ocl-icd openal samba v4l-utils)

optdepends_x86_64=(lib32-alsa-lib lib32-alsa-plugins lib32-giflib
  lib32-gnutls lib32-libjpeg-turbo lib32-libldap lib32-libpng
  lib32-libpulse lib32-libxcomposite lib32-libxinerama lib32-libxslt
  lib32-mpg123 lib32-ncurses lib32-ocl-icd lib32-openal
  lib32-v4l-utils)

provides=("wine=$pkgver")
conflicts=("wine")

prepare() {
  # Allow ccache to work
  mv wine-$pkgver wine

  for patch in *.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -d wine -p1 -i "$patch"
    fi
  done

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-32-build
}

build() {
  cd "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir wine-64-build
    cd "$srcdir/wine-64-build"
    ../wine/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
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
    --without-gstreamer \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/wine-32-build"

  if [[ $CARCH == i686 ]]; then
    make STRIP=true prefix="$pkgdir/usr" install
  else
    make STRIP=true prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/wine-64-build"
    make STRIP=true prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}
