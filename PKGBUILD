# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Robert Falkenberg <robert.falkenberg (at) tu-dortmund.de>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Robert Falkenberg <robert.falkenberg (at) tu-dortmund.de>
# Contributor: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer (at) gmail.com>
# Contributor: Jens Rudolf <jens.rudolf (at) gmx.net>

_pkgname=librm
pkgname="${_pkgname}"-git
pkgver=2.3.4+2.r154.20250629.9dabfe1
pkgrel=3
pkgdesc="Offers FRITZ!Box related core functionality for Roger Router (GUI), Roger CLI (CLI) and Roger Rabbit (ncurses) interfaces."
arch=(
  'aarch64'
  'x86_64'
  'i686'
  'pentium4'
  'armv5h'
  'armv6h'
  'armv7h'
)
url="https://gitlab.com/tabos/librm"
license=('LGPL-2.1-only')
depends=(
  'gdk-pixbuf2'
  'gcc-libs'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'json-glib'
  'libcapi'
  'libgssdp-1.2.so'
  'libgupnp-1.2.so'
  'libsecret'
  'libsndfile'
  'libsoup3'
  'libtiff'
  'libxml2'
  'spandsp'
  'speex'
)
makedepends=(
  'git'
  'gdk-pixbuf2'
  'gettext'
  'gtk-doc'   # To build GTK documentation.
  'gssdp-1.2'
  'gupnp-1.2'
  'meson>=0.59.0'
  'ninja'
  'speex'
)
optdepends=(
  "dconf: For provided glib schemas."
)
provides=(
  "${_pkgname}=${pkgver}"
  "librm.so"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "librm.so"
  "${_pkgname}-doc"
)
source=(
  "${_pkgname}::git+https://gitlab.com/tabos/librm.git"
)
sha256sums=(
  'SKIP'
)
options+=('!emptydirs')
# options+=('!lto' 'debug')

_CFLAGSADDITIONS="-w -Wno-error=incompatible-pointer-types"

prepare() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  arch-meson "${_pkgname}" build --reconfigure \
    -Denable-documentation=true \
    -Denable-secret=true

  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  ninja -v -j1 -C "build"
}

check() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  ninja -v -C "build" test
}

package() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -v -C "build" install

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -svr "${pkgdir}/usr/share/gtk-doc/html/rm"  "${pkgdir}/usr/share/doc/${_pkgname}/html"

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md TODO
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
