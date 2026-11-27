# Maintainer: FTE3600 Linux contributors

pkgname=libfprint-fte3600-git
# makepkg replaces this bootstrap value with pkgver() from the committed HEAD.
pkgver=1.94.100.r95
pkgrel=1
pkgdesc='libfprint with FTE3600 SPI fingerprint support, DKMS glue, and toolkit'
arch=(x86_64)
url='https://github.com/wings1848/libfprint-fte3600'
license=(LGPL-2.1-or-later GPL-2.0-only MIT)
groups=(fprint)
depends=(libgcc glib2 glibc libgudev libgusb openssl pixman dkms python python-gobject)
optdepends=(
  'fprintd: enrollment and authentication service'
  'linux-headers: build the module for the standard Arch kernel'
  'linux-lts-headers: build the module for the LTS kernel'
  'gtk4: desktop GUI (fte3600-toolkit-gui)'
  'libadwaita: desktop GUI (fte3600-toolkit-gui)'
  'libnotify: desktop notifications during enrollment/verification'
  'libpulse: audio cues via paplay'
)
makedepends=(cairo git glib2-devel gobject-introspection meson ninja python python-build python-installer python-setuptools)
checkdepends=(umockdev dbus desktop-file-utils)
provides=("libfprint=$pkgver" 'libfprint-2.so=2-64')
conflicts=(libfprint libfprint-fte3600-personal-git)
install=fte3600.install
# Meson enables LTO for production and disables it for linker-wrapped tests.
# Do not inject a second -flto through makepkg's global compiler flags.
options=(!lto)

source=("libfprint::git+https://github.com/wings1848/libfprint-fte3600.git#branch=main")
sha256sums=(SKIP)

# Upstream libfprint development snapshot from which the FTE3600 work starts.
_fte_upstream_base=c4654fdc85c25afdd9115bec2f95a44145ae3b94

pkgver() {
  cd libfprint

  local upstream_version revision short_commit
  upstream_version=$(awk -F"'" \
    '/^[[:space:]]*version:/ { print $2; exit }' meson.build)
  revision=$(git rev-list --count "${_fte_upstream_base}..HEAD")
  short_commit=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "$upstream_version" "$revision" "$short_commit"
}

build() {
  local meson_args=(
    --prefix=/usr
    --libdir=lib
    --buildtype=release
    -Db_lto=true
    -Dwerror=true
    -Ddrivers=all
    -Dgtk-examples=false
    -Ddoc=false
    -Dinstalled-tests=false
  )

  rm -rf "$srcdir/build" "$srcdir/toolkit-dist"
  meson setup "$srcdir/build" "$srcdir/libfprint" "${meson_args[@]}"
  meson compile -C "$srcdir/build"

  python -m build --wheel --no-isolation --outdir "$srcdir/toolkit-dist" "$srcdir/libfprint/toolkit"
}

check() {
  meson test -C "$srcdir/build" --print-errorlogs --no-rebuild \
    fpi-device fp-device fp-context-udev fte3600-auth \
    fte3600-install-firmware fte3600-setup fte3600-pair \
    fte3600-linux-board fte3600-linux-runtime fte3600-device-session \
    fte3600-fw9369-release fte3600-fw9369-runtime fte3600-probe fte3600-open-bench

  python -W error::ResourceWarning -W error::RuntimeWarning -m unittest discover \
    -s "$srcdir/libfprint/toolkit/tests" -p 'test_core_unit.py' -v
  dbus-run-session -- python -W error::ResourceWarning -W error::RuntimeWarning -m unittest discover \
    -s "$srcdir/libfprint/toolkit/tests" -p 'test_dbus_e2e.py' -v
  desktop-file-validate "$srcdir/libfprint/toolkit/data/org.freedesktop.libfprint.Fte3600Toolkit.desktop"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/build"
  python -m installer --destdir="$pkgdir" "$srcdir/toolkit-dist/"*.whl
  install -Dm644 "$srcdir/libfprint/toolkit/data/org.freedesktop.libfprint.Fte3600Toolkit.desktop" \
    "$pkgdir/usr/share/applications/org.freedesktop.libfprint.Fte3600Toolkit.desktop"

  install -Dm644 "$srcdir/libfprint/kernel/fte3600/dkms.conf" "$pkgdir/usr/src/fte3600-0.2/dkms.conf"
  for file in fte3600.c fte3600-policy.h fte3600-policy-test.c Makefile; do
    install -Dm644 "$srcdir/libfprint/kernel/fte3600/$file" "$pkgdir/usr/src/fte3600-0.2/$file"
  done
  for file in "$srcdir/libfprint/kernel/fte3600/"*.h; do
    install -Dm644 "$file" "$pkgdir/usr/src/fte3600-0.2/${file##*/}"
  done
  install -Dm755 "$srcdir/libfprint/scripts/fte3600-device-allow.sh" "$pkgdir/usr/bin/fte3600-device-allow"
  install -Dm755 "$srcdir/libfprint/scripts/fte3600-pair.py" "$pkgdir/usr/libexec/fte3600-pair"
  install -Dm644 "$srcdir/libfprint/config/modprobe.d/fte3600-acpi-spidev.conf" "$pkgdir/usr/lib/modprobe.d/fte3600-acpi-spidev.conf"
  install -Dm644 "$srcdir/libfprint/config/udev/70-fte3600-acpi-spidev.rules" "$pkgdir/usr/lib/udev/rules.d/70-fte3600-acpi-spidev.rules"

  install -Dm755 "$srcdir/build/tools/fte3600-tool" "$pkgdir/usr/bin/fte3600-tool"
  install -Dm755 "$srcdir/libfprint/scripts/install-firmware.sh" "$pkgdir/usr/bin/fte3600-install-firmware"
  install -Dm644 "$srcdir/libfprint/docs/fte3600/tools.md" "$pkgdir/usr/share/doc/$pkgname/tools.md"
}
