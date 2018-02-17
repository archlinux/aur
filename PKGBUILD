# Based on wine PKGBUILD

pkgname=wine-nine
winever=3.0
ninever=2
pkgver=$winever.$ninever
pkgrel=1
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

  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --enable-win64 \
    --disable-tests
  # Gstreamer was disabled for FS#33655

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/$pkgname-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --with-x \
    --disable-tests \
    "${_wine32opts[@]}"

  make
}

package()
{
    tmppkg="$srcdir/tmppkg"
    rm -rf "$tmppkg"
    cd "$srcdir/$pkgname-32-build"
    make prefix="$tmppkg/usr" \
                libdir="$tmppkg/usr/lib32" \
                dlldir="$tmppkg/usr/lib32/wine" install
    cd "$srcdir/$pkgname-64-build"
    make prefix="$tmppkg/usr" \
                libdir="$tmppkg/usr/lib" \
                dlldir="$tmppkg/usr/lib/wine" install

    #64 bits
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib/wine/fakedlls"

    install -m644 "$tmppkg/usr/lib/wine/fakedlls/d3d9-nine.dll" "$pkgdir/usr/lib/wine/fakedlls/"
    install -m644 "$tmppkg/usr/lib/wine/fakedlls/ninewinecfg.exe" "$pkgdir/usr/lib/wine/fakedlls/"
    install -m644 "$tmppkg/usr/lib/wine/d3d9-nine.dll.so" "$pkgdir/usr/lib/wine/"
    install -m644 "$tmppkg/usr/lib/wine/libd3d9-nine.def"  "$pkgdir/usr/lib/wine/"
    install -m644 "$tmppkg/usr/lib/wine/ninewinecfg.exe.so"  "$pkgdir/usr/lib/wine/"
    install -m755 "$tmppkg/usr/bin/ninewinecfg"  "$pkgdir/usr/bin"

    #32 bits
    install -d "$pkgdir/usr/lib32/wine/fakedlls"
    install -m644 "$tmppkg/usr/lib32/wine/fakedlls/d3d9-nine.dll" "$pkgdir/usr/lib32/wine/fakedlls/"
    install -m644 "$tmppkg/usr/lib32/wine/fakedlls/ninewinecfg.exe" "$pkgdir/usr/lib32/wine/fakedlls/"
    install -m644 "$tmppkg/usr/lib32/wine/d3d9-nine.dll.so" "$pkgdir/usr/lib32/wine/"
    install -m644 "$tmppkg/usr/lib32/wine/libd3d9-nine.def"  "$pkgdir/usr/lib32/wine/"
    install -m644 "$tmppkg/usr/lib32/wine/ninewinecfg.exe.so"  "$pkgdir/usr/lib32/wine/"
}
