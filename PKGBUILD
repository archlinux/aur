# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: slact (https://aur.archlinux.org/account/slact)
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant (https://aur.archlinux.org/account/m13253)

_pkgname=upower
pkgname="${_pkgname}-nosystemd-git"
pkgver=1.90.10+14.r1838.20250812.84aab7a
pkgrel=1
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics. Built without systemd dependencies. Latest Git checkout."
arch=(
  'i686'
  'x86_64'
)
url="http://upower.freedesktop.org"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'gcc-libs'
  'glibc'
  'libgudev'
  'libimobiledevice'
  'libplist'
  'libusb'
  'polkit'
)
makedepends=(
  'pacman' # for 'vercmp' in "$install"
  'docbook-xsl'
  'git'
  'glib2-devel' # For 'gdbus-codegen'
  'gobject-introspection'
  'intltool' 
  'meson'
  'python'
)
optdepends=(
  'gobject-introspection-runtime: For /usr/lib/upower/integration-test.py.'
  'python>=3: For /usr/lib/upower/{integration-test.py,output_checker.py}.'
  'python-dbus: For /usr/lib/upower/integration-test.py.'
  'python-dbusmock: For /usr/lib/upower/integration-test.py.'
  'python-gobject: For  For /usr/lib/upower/integration-test.py.'
  'python-packaging: For /usr/lib/upower/integration-test.py.'
  'umockdev: For /usr/lib/upower/integration-test.py.'
)
# ## 2023-10-14: Checks disabled since it fails on my machine because battery temperature cannot be read out.
# checkdepends=(
#   'python-dbus'
#   'python-dbusmock'
#   'python-gobject'
#   'python-packaging'
#   'umockdev'
# )
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-nocritical=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-nocritical-nosystemd-git<1.90.4+10.r1708"
)
replaces=(
  "${_pkgname}-nocritical-nosystemd-git<=1.90.4+10.r1708.20240523.669a1c2"
)
backup=(
  'etc/UPower/UPower.conf'
)
install="upower-nocritical.install"
source=(
  "${_pkgname}::git+https://gitlab.freedesktop.org/upower/upower.git"
  "$install"
)
sha256sums=(
  "SKIP"                                                              # Upstream source
  "a1e260af0dd05ab9c933a8f0f8f8abf83e4faea5caba6b3750554d36422bb0b8"  # $install
)
options+=('emptydirs')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  arch-meson \
    -D man=true \
    -D gtk-doc=false \
    -D introspection=enabled \
    -D systemdsystemunitdir=no \
    -D idevice=enabled \
    upower build

  meson compile -C build
}

# ## 2023-10-14: Checks disabled since it fails on my machine because battery temperature cannot be read out.
# check() {
#   cd "${srcdir}"
# 
#   meson test -C build --print-errorlogs
# }

package() {
  depends+=(libg{lib,object,io}-2.0.so)
  provides+=(libupower-glib.so)

  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}"

  cd "${srcdir}/${_pkgname}"
  for _docfile in "${srcdir}/git.log" AUTHORS code-of-conduct.md COMMITMENT HACKING.md NEWS README.md RELEASE; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
