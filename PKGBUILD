# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: slact (https://aur.archlinux.org/account/slact)
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant (https://aur.archlinux.org/account/m13253)

_pkgname=upower
pkgname="${_pkgname}-nocritical-nosystemd-git"
pkgver=1.90.2+6.r1677.20230706.029651a
pkgrel=1
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics (With a patch to disable low battery action). Built without systemd dependencies. Latest Git checkout."
arch=(
  'i686'
  'x86_64'
)
url="http://upower.freedesktop.org"
license=(
  'GPL2'
)
depends=(
  'gcc-libs'
  'glibc'
  'libgudev'
  'libimobiledevice'
  'libusb'
)
makedepends=(
  'docbook-xsl'
  'git'
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
  'umockdev: For  For /usr/lib/upower/integration-test.py.'
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
)
backup=(
  'etc/UPower/UPower.conf'
)
source=(
  "${_pkgname}::git+https://gitlab.freedesktop.org/upower/upower.git"
  "0001-Add-a-critical-action-Ignore.patch"
)
sha256sums=(
  "SKIP"
  "bf82acf436db8ab06aa90ff2f8841cb977439937b955a92644da785dc612dde3"
)
options+=('emptydirs')

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}/0001-Add-a-critical-action-Ignore.patch"; do
    msg2 "Applying patch '$(basename "${_patch}")'"
    patch -N -p1 --follow-symlinks -i "${_patch}"
  done

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
  for _docfile in "${srcdir}/git.log" AUTHORS code-of-conduct.md COMMITMENT HACKING NEWS README RELEASE; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
