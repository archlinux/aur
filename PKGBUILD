# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine >= 2.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable
pkgver=2.0.2
pkgrel=2

source=(https://dl.winehq.org/wine/source/2.0/wine-$pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        0001-tools-sfnt2fon-Just-skip-all-glyphs-below-0x20.patch
        0002-fonts-Increase-the-Em-size-to-fix-a-build-failure-wi.patch
        fonts.tar.xz)
sha512sums=('3f37080a951819304cd3475f6012f1d6b5a94879b137cdf816cac4c8fde68ddc777905e92277ec5dce96437d8c32c43d55d3750b582781a9f9774b118f1a5b90'
            'SKIP'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            '3e2fc4baeb4a334cf65f55c60bb7e86113fb33a8fb01a18bddf495dc606d38cac76f2fb372dd3fd0bb91b2fa0add301f717f6612b7cbeedc0fd01899b4e77693'
            '04b1f0cf4c2b2e4e523e3c467c668e3685cfdd52852af9d78a3a2eb71675ef236c13b526ebd741bc792fe785d993ec7ba7e0ad6845cce42f2ff0d0b98fc6b817'
            '691b273a511f4663da8bd29a2865d74341d72c9b0ff75c8e1bb5bd458a05757c151b26e0648a1681f3ec62579873efdad0ff6973a6542b709055c5cc47eca664')
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
      patch -d wine -p1 -i "../$patch"
    fi
  done

  # patch doesn't do git binary diffs
  bsdtar -C wine/fonts -xf fonts.tar.xz

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-{32,64}-build
}

build() {
  cd "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

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
