# Maintainer: arqueon <66568719+arqueon@users.noreply.github.com>
pkgname=libfprint-zk9500-git
pkgver=1.94.100.r3.gfbf28c1
pkgrel=1
pkgdesc="libfprint-2 with native ZKTeco ZK9500 (1b55:0124) optical fingerprint reader support"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/zk9500-libfprint"
license=('LGPL-2.1-or-later')
groups=('fprint')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libgudev'
  'libgusb'
  'libusb'
  'openssl'
  'pixman'
)
optdepends=(
  'fprintd: D-Bus daemon and PAM module for fingerprint authentication'
  'python-gobject: for zk9500-fprintd multi-reader enrollment and PAM status CLI'
)
makedepends=(
  'git'
  'glib2-devel'
  'meson'
  'ninja'
  'pkgconf'
)
provides=(
  "libfprint=${pkgver}"
  'libfprint-2.so'
  'libfprint-zk9500'
)
conflicts=(
  'libfprint'
)
source=(
  'libfprint::git+https://gitlab.freedesktop.org/libfprint/libfprint.git'
  'zk9500-libfprint::git+https://github.com/arqueon/zk9500-libfprint.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/libfprint"
  local _base _rev _hash
  _base="$(meson introspect --projectinfo meson.build 2>/dev/null | sed -n 's/.*"version": *"\([^"]*\)".*/\1/p')"
  [[ -z "${_base}" ]] && _base="1.94.100"
  cd "${srcdir}/zk9500-libfprint"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s' "${_base}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/libfprint"
  git checkout -- .
  patch -Np1 -i "${srcdir}/zk9500-libfprint/patches/0001-upstream-libfprint-zk9500.patch"
  install -Dm644 "${srcdir}/zk9500-libfprint/drivers/zk9500.c" "libfprint/drivers/zk9500.c"
}

build() {
  local _gir_opt="-Dintrospection=false"
  if [[ -x /usr/bin/g-ir-scanner ]]; then
    _gir_opt="-Dintrospection=true"
  fi

  arch-meson "${srcdir}/libfprint" build \
    "${_gir_opt}" \
    -Dudev_hwdb=enabled \
    -Dinstalled-tests=false \
    -Ddoc=false \
    -Dgtk-examples=false

  meson compile -C build

  # shellcheck disable=SC2046,SC2086
  cc ${CFLAGS} ${CPPFLAGS} -O2 -Wall -Wextra \
    "${srcdir}/zk9500-libfprint/tools/zk9500-probe.c" -o "${srcdir}/zk9500-probe" \
    $(pkg-config --cflags --libs libusb-1.0) ${LDFLAGS}
}

check() {
  meson test -C build --suite unit-tests --print-errorlogs
  ./build/libfprint/fprint-list-supported-devices | grep -q "1b55:0124"
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm755 "${srcdir}/zk9500-probe" \
    "${pkgdir}/usr/bin/zk9500-probe"
  install -Dm755 "${srcdir}/zk9500-libfprint/tools/zk9500-fprintd" \
    "${pkgdir}/usr/bin/zk9500-fprintd"
  install -Dm644 "${srcdir}/zk9500-libfprint/udev/70-zk9500-libfprint.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/70-zk9500-libfprint.rules"
}
