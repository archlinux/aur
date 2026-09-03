# Maintainer: novakpetya

pkgname=bluez-switch2
_bluezver=5.87
_switch2ver=0.1.0
pkgver="${_bluezver}.switch2.${_switch2ver}"
pkgrel=1
pkgdesc="Bluetooth LE transport support for Nintendo Switch 2 Joy-Con controllers on Linux"
arch=('x86_64')
url="https://github.com/novakpetya/bluez-switch2"
license=('GPL-2.0-only')

install=bluez-switch2.install

depends=(
  'alsa-lib'
  'dbus'
  'glib2'
  'glibc'
  'systemd-libs'
)

makedepends=(
  'alsa-lib'
  'cups'
  'dbus'
  'ell'
  'git'
  'json-c'
  'libical'
  'python-docutils'
  'python-pygments'
  'readline'
  'systemd'
)

provides=(
  "bluez=${_bluezver}"
)

conflicts=(
  'bluez'
)

backup=(
  'etc/bluetooth/main.conf'
  'etc/bluetooth/input.conf'
  'etc/bluetooth/network.conf'
)

options=('!debug')

source=(
  "bluez::git+https://github.com/bluez/bluez.git#tag=${_bluezver}"
  "bluez-switch2::git+https://github.com/novakpetya/bluez-switch2.git#tag=v${_switch2ver}"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/bluez"

  install -Dm644 \
    "$srcdir/bluez-switch2/switch2.c" \
    plugins/switch2.c

  if ! grep -q '^builtin_modules += switch2$' Makefile.plugins; then
    printf '\n# Nintendo Joy-Con 2 BLE transport\nbuiltin_modules += switch2\nbuiltin_sources += plugins/switch2.c\n' \
      >> Makefile.plugins
  fi

  ./bootstrap
}

build() {
  cd "$srcdir/bluez"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-dbusconfdir=/usr/share \
    --with-dbussystembusdir=/usr/share/dbus-1/system-services \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-library \
    --enable-tools \
    --enable-deprecated

  make
}

check() {
  cd "$srcdir/bluez"

  grep -q 'switch2' src/builtin.h || {
    echo "error: switch2 is missing from BlueZ builtin plugin table"
    return 1
  }

  strings src/bluetoothd | grep -q 'switch2:' || {
    echo "error: switch2 is missing from bluetoothd"
    return 1
  }
}

package() {
  cd "$srcdir/bluez"

  rm -rf "$srcdir/stage"
  make DESTDIR="$srcdir/stage" install

  # Match Arch's normal `bluez` daemon package file split.

  install -Dm755 \
    "$srcdir/stage/usr/lib/bluetooth/bluetoothd" \
    "$pkgdir/usr/lib/bluetooth/bluetoothd"

  install -Dm644 \
    "$srcdir/stage/etc/bluetooth/main.conf" \
    "$pkgdir/etc/bluetooth/main.conf"
  install -Dm644 \
    "$srcdir/stage/etc/bluetooth/input.conf" \
    "$pkgdir/etc/bluetooth/input.conf"
  install -Dm644 \
    "$srcdir/stage/etc/bluetooth/network.conf" \
    "$pkgdir/etc/bluetooth/network.conf"

  install -Dm644 \
    "$srcdir/stage/usr/lib/systemd/system/bluetooth.service" \
    "$pkgdir/usr/lib/systemd/system/bluetooth.service"
  install -Dm644 \
    "$srcdir/stage/usr/share/dbus-1/system-services/org.bluez.service" \
    "$pkgdir/usr/share/dbus-1/system-services/org.bluez.service"
  install -Dm644 \
    "$srcdir/stage/usr/share/dbus-1/system.d/bluetooth.conf" \
    "$pkgdir/usr/share/dbus-1/system.d/bluetooth.conf"

  install -Dm644 \
    "$srcdir/stage/usr/share/man/man8/bluetoothd.8" \
    "$pkgdir/usr/share/man/man8/bluetoothd.8"

  install -dm755 "$pkgdir/usr/lib/modprobe.d"
  printf '%s\n' 'options btusb reset=1' \
    > "$pkgdir/usr/lib/modprobe.d/bluetooth-usb.conf"

  install -dm755 "$pkgdir/usr/lib/modules-load.d"
  printf '%s\n' 'crypto_user' \
    > "$pkgdir/usr/lib/modules-load.d/bluez.conf"

  install -dm755 "$pkgdir/usr/share/doc/bluez/dbus-apis"

  local doc
  for doc in \
    errors.txt \
    intel-variants.txt \
    mesh-api.txt \
    pics-opp.txt \
    pixit-opp.txt \
    pts-opp.txt \
    settings-storage.txt \
    supported-features.txt \
    test-coverage.txt
  do
    if [[ -f "doc/$doc" ]]; then
      install -m644 "doc/$doc" \
        "$pkgdir/usr/share/doc/bluez/dbus-apis/$doc"
    fi
  done
}
