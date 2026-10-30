# Maintainer: arqueon <66568719+arqueon@users.noreply.github.com>
pkgname=libfprint-betterlife-347d-git
pkgver=1.94.10.r1.g1b644d7
pkgrel=1
pkgdesc="libfprint-2 with native Blestech Betterlife 347d:0302 (MOC) and 347d:0304 (MOH) USB fingerprint sensor support"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/betterlife-347d-libfprint"
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
  'python-gobject: for betterlife-fprintd multi-reader enrollment and PAM status CLI'
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
  'libfprint-betterlife-347d'
  'libfprint-cs9711'
)
conflicts=(
  'libfprint'
  'libfprint-cs9711-rebase-git'
)
source=(
  'libfprint-CS9711::git+https://github.com/archeYR/libfprint-CS9711.git#branch=cs9711-rebase'
  'betterlife-347d-libfprint::git+https://github.com/arqueon/betterlife-347d-libfprint.git'
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
  cd "${srcdir}/betterlife-347d-libfprint"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s' "${_base}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/libfprint-CS9711"
  git checkout -- .
  patch -Np1 -i "${srcdir}/betterlife-347d-libfprint/patches/0001-betterlife347d-cs9711.patch"
  for _f in betterlife347d_moc.c betterlife347d.c betterlife347d-proto.c betterlife347d-proto.h sm3.c sm3.h sm4.c sm4.h; do
    install -Dm644 "${srcdir}/betterlife-347d-libfprint/drivers/betterlife347d/${_f}" \
      "libfprint/drivers/betterlife347d/${_f}"
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

  local _drvdir="${srcdir}/betterlife-347d-libfprint/drivers/betterlife347d"
  # shellcheck disable=SC2046,SC2086
  cc ${CFLAGS} ${CPPFLAGS} -O2 -Wall -Wextra -I"${_drvdir}" \
    "${srcdir}/betterlife-347d-libfprint/tools/betterlife347d-probe.c" \
    "${_drvdir}/betterlife347d-proto.c" \
    "${_drvdir}/sm3.c" \
    "${_drvdir}/sm4.c" \
    -o "${srcdir}/betterlife347d-probe" \
    $(pkg-config --cflags --libs glib-2.0 libusb-1.0 openssl) ${LDFLAGS}
}

check() {
  meson test -C build --suite unit-tests --print-errorlogs
  ./build/libfprint/fprint-list-supported-devices | grep -q "347d:0302"
  ./build/libfprint/fprint-list-supported-devices | grep -q "347d:0304"
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm755 "${srcdir}/betterlife347d-probe" \
    "${pkgdir}/usr/bin/betterlife347d-probe"
  install -Dm755 "${srcdir}/betterlife-347d-libfprint/tools/fprintd-multi" \
    "${pkgdir}/usr/bin/fprintd-multi"
  ln -s fprintd-multi "${pkgdir}/usr/bin/betterlife-fprintd"
  install -Dm644 "${srcdir}/betterlife-347d-libfprint/udev/70-betterlife-347d-libfprint.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/70-betterlife-347d-libfprint.rules"
}
