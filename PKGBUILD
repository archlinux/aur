# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: HumanBeing27 <electronneutrino27@proton.me>

pkgname=wine-wayland
__pkgnameadd__=${pkgname:4}
pkgver=8.8
pkgrel=2

_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/8.x/${pkgname%${__pkgnameadd__}}-$_pkgbasever.tar.xz
        https://raw.githubusercontent.com/archlinux/svntogit-community/packages/wine/trunk/wine-binfmt.conf
        https://raw.githubusercontent.com/archlinux/svntogit-community/packages/wine/trunk/30-win32-aliases.conf)
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
pkgdesc="A compatibility layer for running Windows programs(Wayland Support)"
url="https://www.winehq.org"
arch=(x86_64)
options=(staticlibs !lto)
conflicts=('wine' 'wine-staging')
license=(LGPL)
depends=(
  fontconfig      lib32-fontconfig
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
  desktop-file-utils
)
makedepends=(autoconf bison perl flex mingw-w64-gcc
  giflib                lib32-giflib
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxxf86vm            lib32-libxxf86vm
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  libcups               lib32-libcups
  libgphoto2
  sane
  vulkan-headers
  samba
  opencl-headers
)
optdepends=(
  giflib                lib32-giflib
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

prepare() {
  # Allow ccache to work
  mv ${pkgname%${__pkgnameadd__}}-$_pkgbasever ${pkgname%${__pkgnameadd__}}

  # Doesn't compile without remove these flags as of 4.10
  export CFLAGS="${CFLAGS/-fno-plt/} -ffat-lto-objects"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  # Get rid of old build dirs
  rm -rf ${pkgname%${__pkgnameadd__}}-{32,64}-build
  mkdir ${pkgname%${__pkgnameadd__}}-32-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  mkdir ${pkgname%${__pkgnameadd__}}-64-build
  cd "$srcdir/${pkgname%${__pkgnameadd__}}-64-build"
  ../${pkgname%${__pkgnameadd__}}/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-wayland \
    --with-gstreamer \
    --enable-win64
  # Gstreamer was disabled for FS#33655

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/${pkgname%${__pkgnameadd__}}-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  cd "$srcdir/${pkgname%${__pkgnameadd__}}-32-build"
  ../${pkgname%${__pkgnameadd__}}/configure \
    --prefix=/usr \
    --with-wayland \
    --with-gstreamer \
    "${_wine32opts[@]}"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/${pkgname%${__pkgnameadd__}}-32-build"

  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib32" \
    dlldir="$pkgdir/usr/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/${pkgname%${__pkgnameadd__}}-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib32/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.dll
}

# vim:set ts=8 sts=2 sw=2 et:
