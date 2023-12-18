# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

## useful links:
# https://www.winehq.org
# https://gitlab.winehq.org/wine/wine

## options
: ${_build_staging:=true}
: ${_build_wow64:=true}

[[ "${_build_staging::1}" == "t" ]] && _pkgtype+="-staging"
[[ "${_build_wow64::1}" == "t" ]] && _pkgtype+="-wow64"

## basic info
_pkgname=wine
pkgname="${_pkgname}${_pkgtype:-}"
pkgver=9.0rc2
pkgrel=2
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
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libcups               #lib32-libcups
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  libxxf86vm            #lib32-libxxf86vm
  mesa                  #lib32-mesa
  mesa-libgl            #lib32-mesa-libgl
  opencl-icd-loader     #lib32-opencl-icd-loader
  pcsclite              #lib32-pcsclite
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
  vulkan-icd-loader     #lib32-vulkan-icd-loader
  autoconf
  bison
  flex
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
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  opencl-icd-loader     #lib32-opencl-icd-loader
  pcsclite              #lib32-pcsclite
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
  cups
  dosbox
  libgphoto2
  samba
  sane
)

provides=("wine=$pkgver")
conflicts=("wine")

options=(staticlibs !lto)
install=wine.install

_pkgver="${pkgver/rc/-rc}"
_pkgsrc="$_pkgname-$_pkgver"
source=(
  "https://dl.winehq.org/wine/source/${pkgver::1}.0/$_pkgsrc.tar.xz"
  "30-win32-aliases.conf"
  "wine-binfmt.conf"
)
sha256sums=(
  'd9d7cc0bb4cabc28ae80e054e8743bceaa50dcfc6ac2fd9bf419deadfa43066f'
  '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
  '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4'
)

if [[ "${_build_staging::1}" == "t" ]] ; then
  makedepends+=('git')

  provides+=(
    "wine-staging=$pkgver"
    "wine-wow64=$pkgver"
  )

  source+=("git+https://gitlab.winehq.org/wine/wine-staging.git#tag=v$_pkgver")
  sha256sums+=('SKIP')

  prepare() {
    # apply wine-staging patchset
    cd "$_pkgsrc"
    ../wine-staging/staging/patchinstall.py --all
  }
fi

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
  install -Dm644 "$srcdir"/30-win32-aliases.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir"/usr/share/fontconfig/conf.default/30-win32-aliases.conf

  install -Dm644 "$srcdir"/wine-binfmt.conf "$pkgdir"/usr/lib/binfmt.d/wine.conf
}

# vim:set ts=8 sts=2 sw=2 et:
