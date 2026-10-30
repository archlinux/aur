# Maintainer: arqueon <66568719+arqueon@users.noreply.github.com>
pkgname=libfprint-adst-2009-git
pkgver=1.94.10.r1.g29cec34
pkgrel=1
pkgdesc="libfprint-2 with native ADST / BYD BF5325 (2009:7638) Match-On-Chip USB fingerprint sensor support"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/adst-2009-libfprint"
license=('LGPL-2.1-or-later')
groups=('fprint')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libgudev'
  'libgusb'
  'libusb'
  'opencv'
  'openssl'
  'pixman'
)
optdepends=(
  'fprintd: D-Bus daemon and PAM module for fingerprint authentication'
  'python-gobject: for adst-fprintd multi-reader enrollment and PAM status CLI'
)
makedepends=(
  'cmake'
  'git'
  'glib2-devel'
  'meson'
  'ninja'
  'pkgconf'
)
provides=(
  "libfprint=${pkgver}"
  'libfprint-2.so'
  'libfprint-adst-2009'
  'libfprint-cs9711'
)
conflicts=(
  'libfprint'
  'libfprint-cs9711-rebase-git'
)
source=(
  'libfprint-CS9711::git+https://github.com/archeYR/libfprint-CS9711.git#branch=cs9711-rebase'
  'adst-2009-libfprint::git+https://github.com/arqueon/adst-2009-libfprint.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/libfprint-CS9711"
  local _base _rev _hash
  _base="$(meson introspect --projectinfo meson.build 2>/dev/null | sed -n 's/.*"version": *"\([^"]*\)".*/\1/p')"
  [[ -z "${_base}" ]] && _base="1.94.10"
  cd "${srcdir}/adst-2009-libfprint"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s' "${_base}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/libfprint-CS9711"
  git checkout -- .
  patch -Np1 -i "${srcdir}/adst-2009-libfprint/patches/0001-adst2009-cs9711.patch"
  for _f in adst2009.c adst2009-proto.h; do
    install -Dm644 "${srcdir}/adst-2009-libfprint/drivers/adst2009/${_f}" \
      "libfprint/drivers/adst2009/${_f}"
  done
}

build() {
  local _gir_opt="-Dintrospection=false"
  if [[ -x /usr/bin/g-ir-scanner ]]; then
    _gir_opt="-Dintrospection=true"
  fi

  arch-meson "${srcdir}/libfprint-CS9711" build \
    "${_gir_opt}" \
    -Dudev_hwdb=enabled \
    -Dinstalled-tests=false \
    -Ddoc=false \
    -Dgtk-examples=false

  meson compile -C build

  local _drvdir="${srcdir}/adst-2009-libfprint/drivers/adst2009"
  # shellcheck disable=SC2046,SC2086
  cc ${CFLAGS} ${CPPFLAGS} -O2 -Wall -Wextra -I"${_drvdir}" \
    "${srcdir}/adst-2009-libfprint/tools/adst2009-probe.c" \
    -o "${srcdir}/adst2009-probe" \
    $(pkg-config --cflags --libs libusb-1.0) ${LDFLAGS}

  # shellcheck disable=SC2046,SC2086
  cc ${CFLAGS} ${CPPFLAGS} -O2 -Wall -Wextra -I"${_drvdir}" \
    "${srcdir}/adst-2009-libfprint/tests/adst2009-unit-test.c" \
    -o "${srcdir}/adst2009-unit-test" ${LDFLAGS}
}

check() {
  "${srcdir}/adst2009-unit-test"
  meson test -C build --suite unit-tests --print-errorlogs
  ./build/libfprint/fprint-list-supported-devices | grep -q "2009:7638"
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm755 "${srcdir}/adst2009-probe" \
    "${pkgdir}/usr/bin/adst2009-probe"
  install -Dm755 "${srcdir}/adst-2009-libfprint/tools/fprintd-multi" \
    "${pkgdir}/usr/bin/fprintd-multi"
  ln -s fprintd-multi "${pkgdir}/usr/bin/adst-fprintd"
  install -Dm644 "${srcdir}/adst-2009-libfprint/udev/70-adst-2009-libfprint.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/70-adst-2009-libfprint.rules"
}
