# Maintainer:

## useful links:
# https://gitlab.winehq.org/wine/wine
# https://gitlab.winehq.org/wine/wine-staging

# options
: ${_pkgtype:=wow64-git}

# basic info
_pkgname=wine-staging
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=8.21.r412.gd748440e
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs"
url="https://gitlab.winehq.org/wine/wine"
arch=(x86_64)
license=(LGPL)

depends=(
  desktop-file-utils

  alsa-lib              #lib32-alsa-lib
  fontconfig            #lib32-fontconfig
  freetype2             #lib32-freetype2
  gettext               #lib32-gettext
  giflib                #lib32-giflib
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxcursor            #lib32-libxcursor
  libxi                 #lib32-libxi
  libxinerama           #lib32-libxinerama
  libxrandr             #lib32-libxrandr
  opencl-icd-loader     #lib32-opencl-icd-loader
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
)
makedepends=(
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

  libcups               #lib32-libcups
  libxxf86vm            #lib32-libxxf86vm
  mesa                  #lib32-mesa
  mesa-libgl            #lib32-mesa-libgl
  vulkan-icd-loader     #lib32-vulkan-icd-loader
)
optdepends=(
  cups
  dosbox
  libgphoto2
  samba
  sane

  alsa-plugins          #lib32-alsa-plugins
  libldap               #lib32-libldap
)

options=(staticlibs !lto)

provides=("wine=${pkgver%%.r*}")
conflicts=("wine")

_pkgsrc="wine"
source=(
  git+https://gitlab.winehq.org/wine/wine.git
  git+https://gitlab.winehq.org/wine/wine-staging.git
  30-win32-aliases.conf
  wine-binfmt.conf
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  local _version=$(
    git tag --list 'wine-[0-9]*.[0-9]*' \
      | sed -E 's/^[^0-9]+//;s/^.*[A-Za-z]{2}.*$//' \
      | sort -V | tail -1
  )
  local _revision=$(git rev-list --count --cherry-pick wine-$_version...HEAD)
  local _hash=$(git rev-parse --short=8 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd "$_pkgsrc"

  # apply wine-staging patchset
  "$srcdir/wine-staging/staging/patchinstall.py" --all
}

build() {
  # Doesn't compile without modifying flags as of 4.10
  #export CFLAGS="${CFLAGS/-fno-plt/} -ffat-lto-objects"
  #export LDFLAGS="${LDFLAGS/,-z,now/}"

  local _configure_options=(
    --disable-tests
    --prefix=/usr
    --libdir=/usr/lib
    --enable-archs=x86_64,i386
  )

  cd "$_pkgsrc"
  ./configure "${_configure_options[@]}"
  make
}

package() {
  cd "$_pkgsrc"

  make install \
    prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir/usr/lib/wine/i386-windows"/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir/usr/lib/wine/x86_64-windows"/*.dll

  ln -sf wine "$pkgdir/usr/bin/wine64"

  # Font aliasing settings for Win32 applications
  install -Dm644 "$srcdir/30-win32-aliases.conf" -t "$pkgdir/usr/share/fontconfig/conf.avail/"

  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"

  # binfmt config
  install -Dm644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"
}
