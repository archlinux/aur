# Maintainer:

: ${_debug=false} # asan/a, asan-debug/ad, debug/d, true/t, false/f

_pkgname="aelkey"
pkgname="$_pkgname-git"
pkgver=0.0.5.r0.g3489148
pkgrel=1
pkgdesc="Lua-based input remapping framework"
url="https://github.com/xiota/aelkey"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'libevdev.so'
  'libjack.so'
  'libudev.so'
  'libusb-1.0.so'
  'lua'
  'libsdbus-c++.so'
)
makedepends=(
  'cmake'
  'git'
  'go-md2man'
  'linux-api-headers'
  'meson'
)
optdepends=(
  'bluez: provides BLE GATT services'
  'pipewire-jack: recommended jack server'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug' '!strip' '!lto')

_pkgsrc="$_pkgname"
_pkgsrc_sol="nerixyz.sol2"
_pkgsrc_spsc="readerwriterqueue"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_sol"::"git+https://github.com/Nerixyz/sol2.git"
  "$_pkgsrc_spsc"::"git+https://github.com/cameron314/readerwriterqueue.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/$_pkgsrc_sol" "$_pkgsrc/subprojects/sol2"

  ln -sf "$srcdir/$_pkgsrc_spsc" "$_pkgsrc/subprojects/readerwriterqueue"
  cp -f "$_pkgsrc/subprojects/packagefiles/readerwriterqueue/meson.build" "$_pkgsrc_spsc/"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _mode
  case "${_debug}" in
    a | asan) _mode="asan" ;;
    ad | asan-d*) _mode="asan_debug" ;;
    d* | t*) _mode="debug" ;;
    *) _mode="default" ;;
  esac

  local _meson_options=()
  if [[ "$_mode" == *asan* ]]; then
    _meson_options+=(
      -Db_sanitize=address,undefined
      -Db_lundef=false
      -Db_asneeded=false
    )
  fi

  if [[ "$_mode" == *debug* ]]; then
    _meson_options+=(--buildtype=debug)
  else
    _meson_options+=(--buildtype=debugoptimized)
  fi

  arch-meson "${_meson_options[@]}" build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # asan depends
  local ld_preload=""
  if [[ "${_debug::1}" == "a" ]]; then
    eval "depends+=(libasan libubsan)"
    ld_preload="export LD_PRELOAD=/usr/lib/libasan.so"
  fi

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/aelkey" << END
#!/usr/bin/env sh
${ld_preload}
export LUA_INIT='aelkey = require("aelkey")'
exec lua "\$@"
END
}
