# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Saeed Rasooli <saeed.gnu@gmail.com>

_py="python"
_pkg="gobject"
_pkgbase="py${_pkg}"
pkgbase="${_pkgbase}-git"
_pkgname="${_py}-${_pkg}"
pkgname=(
  "${_pkgname}-git"
  "${_pkgbase}-devel-git"
)
pkgver=3.40.0+10+gb15e81fc
pkgrel=1
pkgdesc="Python Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
_repo="https://gitlab.gnome.org/GNOME"
arch=(
  aarch64
  armv6h
  armv7h
  arm
  i386
  i686
  mips
  pentium4
  powerpc
  powerpc64
  riscv64
  x86_64
)
license=(
  LGPL
)
depends=(
  "${_pkg}-introspection-runtime")
makedepends=(
  "${_py}-cairo"
  "${_py}-setuptools"
  "${_pkg}-introspection"
  "git"
  "gnome-common")
optdepends=(
  'cairo: Cairo bindings')
source=(
  "git+${_repo}/${_pkgbase}.git")
sha256sums=(
  'SKIP')

pkgver() {
  cd "${_pkgbase}"
  git \
    describe \
    --tags | \
    sed \
      's/-/+/g'
}

prepare() {
  mkdir \
    -p \
    devel
}

_meson_options=(
  -D tests=false
  -D pycairo=disabled
  -D python="${_py}3")

_cflags=(                                                                                                   "-I$( \
    dirname \
      "$(gcc \
           -v 2>&1 |
           grep \
             "InstalledDir" | \
             awk '{print $2}')")/include"
  "${CFLAGS}"
)

_build() (
  local \
    _pyver="${1}"
  CFLAGS="${_cflags[*]}" \
    arch-meson \
      "${_pkgbase}" \
      build \
      "${_meson_options[@]}"
  CFLAGS="${_cflags[*]}" \
  meson \
    compile \
    -C build
)

build() {
  _build \
    3
}

package_python-gobject-git() {
  depends=(
   "${_pkgbase}-devel=${pkgver}"
   "${_py}")
  provides=(
    "${_pkgname}=${pkgver}")
  conflicts=(
    "${_pkgname}")
  meson \
    install \
      -C build \
      --destdir "${pkgdir}"
  "${_py}${_pyver}" \
    -m compileall \
    -d /usr/lib \
    "${pkgdir}/usr/lib"
  "${_py}${_pyver}" \
    -O \
    -m compileall \
    -d /usr/lib \
    "${pkgdir}/usr/lib"
  mv \
    "${pkgdir}/usr/include/${_pkgbase}-3.0/${_pkgbase}.h" \
    "${srcdir}/devel"
  mv \
   "${pkgdir}/usr/lib/pkgconfig/${_pkgbase}-3.0.pc" \
   "${srcdir}/devel"
}

package_pygobject-devel-git() {
  pkgdesc="Common development files for pygobject"
  provides=(
    "${_pkgbase}-devel=${pkgver}"
    "${_pkgname}-devel-git=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-devel"
    "${_pkgname}-devel-git"
  )

  mkdir \
    -p \
    "${pkgdir}/usr/include/${_pkgbase}-3.0/"
  cp \
    "${srcdir}/devel/${_pkgbase}.h" \
    "${pkgdir}/usr/include/${_pkgbase}-3.0/${_pkgbase}.h"

  mkdir \
    -p \
    "${pkgdir}/usr/lib/pkgconfig/"
  cp \
    "${srcdir}/devel/${_pkgbase}-3.0.pc" \
    "${pkgdir}/usr/lib/pkgconfig/${_pkgbase}-3.0.pc"
}

# vim:set sw=2 sts=-1 et:
