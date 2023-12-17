# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

## useful links:
# https://www.winehq.org
# https://gitlab.winehq.org/wine/wine

pkgname=wine-staging-wow64
_name=wine
pkgver=9.0rc2
_pkgver=9.0-rc2
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs"
url="https://www.winehq.org"
license=(LGPL)
arch=(x86_64)

depends=(
  fontconfig      #lib32-fontconfig
  freetype2       #lib32-freetype2
  gettext         #lib32-gettext
  libxcursor      #lib32-libxcursor
  libxi           #lib32-libxi
  libxrandr       #lib32-libxrandr
  desktop-file-utils
)
makedepends=(
  alsa-lib              #lib32-alsa-lib
  giflib                #lib32-giflib
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libcups               #lib32-libcups
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  libxxf86vm            #lib32-libxxf86vm
  mesa                  #lib32-mesa
  mesa-libgl            #lib32-mesa-libgl
  opencl-icd-loader     #lib32-opencl-icd-loader
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
  vulkan-icd-loader     #lib32-vulkan-icd-loader
  autoconf
  bison
  flex
  git
  libgphoto2
  mingw-w64-gcc
  opencl-headers
  perl
  samba
  sane
  vulkan-headers
)
optdepends=(
  alsa-lib              #lib32-alsa-lib
  alsa-plugins          #lib32-alsa-plugins
  giflib                #lib32-giflib
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libldap               #lib32-libldap
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  opencl-icd-loader     #lib32-opencl-icd-loader
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
  cups
  dosbox
  libgphoto2
  samba
  sane
)

provides=(
  "wine-staging=$pkgver"
  "wine-wow64=$pkgver"
  "wine=$pkgver"
)
conflicts=("wine")

options=(staticlibs !lto)
install=wine.install

_pkgsrc="$_name"
source=(
  git+https://gitlab.winehq.org/wine/wine.git#tag=wine-$_pkgver
  git+https://gitlab.winehq.org/wine/wine-staging.git#tag=v$_pkgver
  30-win32-aliases.conf
  wine-binfmt.conf
)
b2sums=('SKIP'
        'SKIP'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588')

prepare() {
  # apply wine-staging patchset
  cd "$_pkgsrc"
  ../wine-staging/staging/patchinstall.py --all
}

build() {
  cd "$_pkgsrc"
  ./configure \
    --disable-tests \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-archs=x86_64,i386
  make
}

package() {
  cd "$_pkgsrc"
  make prefix="$pkgdir"/usr \
    libdir="$pkgdir"/usr/lib \
    dlldir="$pkgdir"/usr/lib/wine install

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.dll

  ln -sf /usr/bin/wine "$pkgdir"/usr/bin/wine64

  # Font aliasing settings for Win32 applications
  install -Dm644 "$srcdir"/30-win32-aliases.conf "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir"/usr/share/fontconfig/conf.default/30-win32-aliases.conf

  install -Dm644 "$srcdir"/wine-binfmt.conf "$pkgdir"/usr/lib/binfmt.d/wine.conf
}

# vim:set ts=8 sts=2 sw=2 et:
