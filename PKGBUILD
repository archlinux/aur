# Maintainer:

: ${_debug=false} # asan/a, asan-debug/ad, true/t, false/f

_pkgname="aelkey"
pkgname="$_pkgname"
pkgver=0.0.4
pkgrel=1
pkgdesc="Lua-based input remapping framework"
url="https://github.com/xiota/aelkey"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'dbus'
  'libevdev.so'
  'libjack.so'
  'libudev.so'
  'libusb-1.0.so'
  'lua'
)
makedepends=(
  'git'
  'go-md2man'
  'linux-api-headers'
  'meson'
)
optdepends=(
  'bluez: provides BLE GATT services'
  'pipewire-jack: recommended jack server'
)

options=('!debug' '!strip' '!lto')

_pkgsrc="$_pkgname"
_pkgsrc_sol="nerixyz.sol2"
source=(
  "$_pkgsrc"::"git+$url.git#tag=$pkgver"
  "$_pkgsrc_sol"::"git+https://github.com/Nerixyz/sol2.git"
)
sha256sums=(
  'e6437920665a9542006f3909eab239efd7a06572cd8cc483f4dd99918b631e6f'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/$_pkgsrc_sol" "$_pkgsrc/subprojects/sol2"
}

build() {
  local _meson_options=()
  case "${_debug}" in
    asan | a)
      export CXXFLAGS+=" -Wall -Wextra -Wpedantic -Wmissing-declarations -Wno-unused-parameter"
      _meson_options+=(
        --buildtype=debugoptimized
        -Db_sanitize=address,undefined
        -Db_lundef=false
        -Db_asneeded=false
      )
      ;;
    asan-d* | ad)
      export CXXFLAGS+=" -Wall -Wextra -Wpedantic -Wmissing-declarations -Wno-unused-parameter"
      _meson_options+=(
        --buildtype=debug
        -Db_sanitize=address,undefined
        -Db_lundef=false
        -Db_asneeded=false
      )
      ;;
    t*)
      _meson_options+=(
        --buildtype=debugoptimized
      )
      ;;
  esac

  arch-meson "${_meson_options[@]}" build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # convenience script and asan depends
  if [[ "${_debug::1}" == "a" ]]; then
    eval "depends+=(libasan libubsan)"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aelkey" << END
#!/usr/bin/env sh
export LD_PRELOAD=/usr/lib/libasan.so
export LUA_INIT='aelkey = require("aelkey")'
exec lua "\$@"
END
  else
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aelkey" << END
#!/usr/bin/env sh
export LUA_INIT='aelkey = require("aelkey")'
exec lua "\$@"
END
  fi

  # api reference
  lua "$_pkgsrc/docs/stitch.lua" "$_pkgsrc/docs/readme.md" \
    | go-md2man \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man7/aelkey.7"

  # udev rules
  install -Dm644 "$_pkgsrc/data"/*.rules -t "$pkgdir/usr/share/$_pkgname/"

  # sysusers config
  install -Dm644 "$_pkgsrc/data"/sysusers*.conf -t "$pkgdir/usr/share/$_pkgname/"
}
