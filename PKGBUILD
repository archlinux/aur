# Maintainer:

: ${_debug=false} # asan/a, asan-debug/ad, true/t, false/f

_pkgname="aelkey"
pkgname="$_pkgname-git"
pkgver=0.0.1.r63.g77ba386
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

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug' '!strip' '!lto')

_pkgsrc="$_pkgname"
_pkgsrc_sol="nerixyz.sol2"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_sol"::"git+https://github.com/Nerixyz/sol2.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/$_pkgsrc_sol" "$_pkgsrc/subprojects/sol2"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _meson_options=()
  case "${_debug::1}" in
    asan | a)
      _meson_options+=(
        --buildtype=debugoptimized
        -Db_sanitize=address,undefined
        -Db_lundef=false
        -Db_asneeded=false
      )
      ;;
    asan-debug | asan-d | ad)
      _meson_options+=(
        --buildtype=debug
        -Db_sanitize=address,undefined
        -Db_lundef=false
        -Db_asneeded=false
      )
      ;;
    t | true)
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

  # convenience script
  if [[ "${_debug::1}" == "a" ]]; then
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
