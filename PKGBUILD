# Based on wine PKGBUILD

pkgname=wine-nine
winever=3.0
ninever=2
pkgver=$winever.$ninever
pkgrel=2
source=("https://github.com/iXit/wine/archive/wine-nine-$winever-$ninever.tar.gz")
sha1sums=('a5dd78dcc6bbb14a3b2435a5001c185280aba830')

pkgdesc="Wine nine libraries to be used with either standard Wine or Wine-Staging"
url="https://github.com/iXit/wine"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
depends=(
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
makedepends=(autoconf ncurses bison perl flex
  'gcc>=4.5.0-2'
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  samba
)
optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  cups                  wine
  samba                 dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
install=wine-nine.install

prepare() {
  # Allow ccache to work
  mv "wine-wine-nine-$winever-$ninever" "$pkgname"

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}  -fno-lto"
  export LDFLAGS="${LDFLAGS/,-z,now/} -Wl,-fno-lto"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build
}

build()
{
  cd "$srcdir"

  msg2 "Building Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --without-freetype \
    --without-fontconfig \
    --without-curses \
    --without-cms \
    --without-gstreamer \
    --without-alsa \
    --without-capi \
    --without-opencl \
    --without-openal \
    --without-netapi  \
    --without-mpg123 \
    --without-ldap \
    --without-krb5 \
    --without-jpeg \
    --without-gnutls \
    --without-coreaudio \
    --without-dbus \
    --without-cups \
    --without-gsm \
    --without-osmesa \
    --without-oss  \
    --without-pcap \
    --without-png \
    --without-pulse \
    --without-sane \
    --without-tiff \
    --without-udev \
    --without-v4l \
    --without-xinput \
    --without-xinput2 \
    --without-xml \
    --without-xslt \
    --without-zlib \
    --with-d3d9-nine \
    --enable-win64 \
    --disable-tests
    # Gstreamer was disabled for FS#33655

  make include
  make __builddeps__
  make d3d9-nine.dll.so -C dlls/d3d9-nine
  make d3d9-nine.dll.fake -C dlls/d3d9-nine
  make programs/ninewinecfg

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-wine64="$srcdir/$pkgname-64-build" \
    --with-x \
    --without-freetype \
    --without-fontconfig \
    --without-curses \
    --without-cms \
    --without-gstreamer \
    --without-alsa \
    --without-capi \
    --without-opencl \
    --without-openal \
    --without-netapi  \
    --without-mpg123 \
    --without-ldap \
    --without-krb5 \
    --without-jpeg \
    --without-gnutls \
    --without-coreaudio \
    --without-dbus \
    --without-cups \
    --without-gsm \
    --without-osmesa \
    --without-oss  \
    --without-pcap \
    --without-png \
    --without-pulse \
    --without-sane \
    --without-tiff \
    --without-udev \
    --without-v4l \
    --without-xinput \
    --without-xinput2 \
    --without-xml \
    --without-xslt \
    --without-zlib \
    --with-d3d9-nine \
    --disable-tests

  make include
  make __builddeps__
  make d3d9-nine.dll.so -C dlls/d3d9-nine
  make d3d9-nine.dll.fake -C dlls/d3d9-nine
  make programs/ninewinecfg
}

package()
{
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/wine-nine/tools/wineapploader.in" \
    "$pkgdir/usr/bin/ninewinecfg"
  sed -e 's=@bindir@=/usr/bin=g' -i "$pkgdir/usr/bin/ninewinecfg"

  #64 bits
  install -d "$pkgdir/usr/lib/wine/fakedlls"

  install -m644 "$srcdir/wine-nine-64-build/dlls/d3d9-nine/d3d9-nine.dll.fake" \
    "$pkgdir/usr/lib/wine/fakedlls/d3d9-nine.dll"
  install -m644 "$srcdir/wine-nine-64-build/dlls/d3d9-nine/d3d9-nine.dll.so" \
    "$pkgdir/usr/lib/wine/"
  install -m644 "$srcdir/wine-nine-64-build/dlls/d3d9-nine/libd3d9-nine.def" \
    "$pkgdir/usr/lib/wine/"
  install -m644 "$srcdir/wine-nine-64-build/programs/ninewinecfg/ninewinecfg.exe.fake" \
    "$pkgdir/usr/lib/wine/fakedlls/ninewinecfg.exe"
  install -m644 "$srcdir/wine-nine-64-build/programs/ninewinecfg/ninewinecfg.exe.so" \
    "$pkgdir/usr/lib/wine/"

  #32 bits
  install -d "$pkgdir/usr/lib32/wine/fakedlls"
  install -m324 "$srcdir/wine-nine-32-build/dlls/d3d9-nine/d3d9-nine.dll.fake" \
    "$pkgdir/usr/lib32/wine/fakedlls/d3d9-nine.dll"
  install -m324 "$srcdir/wine-nine-32-build/dlls/d3d9-nine/d3d9-nine.dll.so" \
    "$pkgdir/usr/lib32/wine/"
  install -m324 "$srcdir/wine-nine-32-build/dlls/d3d9-nine/libd3d9-nine.def" \
    "$pkgdir/usr/lib32/wine/"
  install -m324 "$srcdir/wine-nine-32-build/programs/ninewinecfg/ninewinecfg.exe.fake" \
    "$pkgdir/usr/lib32/wine/fakedlls/ninewinecfg.exe"
  install -m324 "$srcdir/wine-nine-32-build/programs/ninewinecfg/ninewinecfg.exe.so" \
    "$pkgdir/usr/lib32/wine/"
}
