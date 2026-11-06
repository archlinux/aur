# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Alex Richards <aur@alxr.uk>
# Contributor: Davide Depau <davide@depau.eu>

_pkgname=libfprint
pkgname=$_pkgname-vfs009x-git
pkgver=1.94.100.r3.ge738dc5
pkgrel=1
pkgdesc="Library for fingerprint readers (includes libre vfs0090 and vfs0097 driver)"
url="https://gitlab.archlinux.org/gugah/libfprint"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  libgcc
  glib2
  glibc
  libgudev
  libgusb
  openssl
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
)
checkdepends=(
  cairo
  umockdev
)
optdepends=(
  'fprintd: D-Bus service to access fingerprint readers'
  'validity-sensors-tools-git: Linux tool to flash and pair Validity fingerprint sensors 009x'
  'gtk3: (make) Build GTK-based demos'
)
provides=(
  $_pkgname=$pkgver
  libfprint-2.so
)
groups=(fprint)
conflicts=("$_pkgname")
source=(
  "git+$url.git#branch=vfs009x"
  "0001-VFS0097-Update-vfs0090.h.patch"
  "0002-60-libfprint-2-tod-vfs0090.rules"
)
sha256sums=(
  'SKIP'
  'f654336348497743802bef027aa346db5456c0f3407054d821829cc482c6b50f'
  'd9553a8a1e4b64617214820b758a807cda593704504bcfeb04dcddeefdf46ee4'
)

# Build options
_build_doc=${BUILD_DOC:-false}
_build_examples=${BUILD_EXAMPLES:-false}
_build_tests=${BUILD_TESTS:-false}

prepare() {
  cd $_pkgname

  # Initialize the vfs0090 submodule
  git submodule update --init --recursive

  local _patch97=0
  printf "Determining VFS device type...\n"

  if [[ "${VFS0097:-}" == "1" ]]; then
    _patch97=1
    printf "Applying patch for 138a:0097 (VFS0097=1 environment variable)\n"
  elif [[ "${VFS0097:-}" == "0" ]]; then
    _patch97=0
    printf "Building for 138a:0090 (VFS0097=0 environment variable)\n"
  elif command -v lsusb >/dev/null 2>&1 && lsusb | grep -q "138a:0097"; then
    _patch97=1
    printf "VFS0097 fingerprint reader detected - applying patch for 138a:0097\n"
    printf "To build for 138a:0090 instead, set VFS0097=0\n"
  else
    _patch97=0
    printf "Building for 138a:0090 (default)\n"
    printf "To enable patches for 138a:0097, set VFS0097=1\n"
  fi

  if [[ "$_patch97" == "1" ]]; then
    printf "Applying VFS0097 patch...\n"
    cd libfprint/drivers/vfs0090
    if ! patch -Np1 < "$srcdir/0001-VFS0097-Update-vfs0090.h.patch"; then
      printf "Failed to apply VFS0097 patch\n" >&2
      return 1
    fi
  fi
}

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' --exclude='*_*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D drivers=all

    -D installed-tests=$_build_tests
    -D doc=$_build_doc
    -D gtk-examples=$_build_examples
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --exclude egis_etu905
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$srcdir/0002-60-libfprint-2-tod-vfs0090.rules" \
    "$pkgdir/usr/lib/udev/rules.d/60-libfprint-2-tod-vfs0090.rules"
  # Install documentation if built
  if [[ "$_build_doc" == "true" ]]; then
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  fi
}

# vim:set sw=2 sts=-1 et:
