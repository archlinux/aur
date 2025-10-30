# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Philipp Wolfer <ph.wolfer (at) gmail.com>

_gitname=rogerrouter
_pkgname=roger-router
pkgname="${_pkgname}-git"
pkgver=2.4.90+5.r1430.20250629.8c754a6
pkgrel=2
pkgdesc="A utility to control and monitor AVM Fritz!Box Routers. E.g. Journal, fax software and call monitor."
arch=(
  'aarch64'
  'x86_64'
  'i686'
  'pentium4'
  'armv5h'
  'armv6h'
  'armv7h'
)
url="https://tabos.org/projects/rogerrouter/"
license=('GPL-2.0-only')
depends=(
  "gcc-libs"
  "ghostscript"
  "glib2"
  "glibc"
  "gtk3"
  "libcairo.so"
  "librm.so"
  "libgdk_pixbuf-2.0.so"
  "libhandy-1.so"
  "libpango-1.0.so"
  "libpangocairo-1.0.so"
  "libsoup-3.0.so"
  "libtiff.so"
)
makedepends=(
  "appstream-glib"  # For 'appstream-util'
  "cairo"
  "cups"            # To have 'lp' group to create spool directory owned by that group in the '$install' script.
  "desktop-file-utils"
  "gdk-pixbuf2"
  "gettext"
  "git"
  "glib2-devel"
  "gobject-introspection"
  "intltool"
  "librm"
  "libhandy"
  "libsoup3"
  "libtiff"
  "meson"
  "ninja"
  "pango"
  "pkgconf"
)
optdepends=(
  'cups:               FAX printer'
  'dconf:              for glib schemas'
  'hicolor-icon-theme: hicolor theme hierarchy'
)
conflicts=(
  "${_gitname}"
  "${_pkgname}"
  #"roger"
)
provides=(
  "${_gitname}=${pkgver}"
  "${_pkgname}=${pkgver}"
  #"roger=${pkgver}"
)
replaces=(
  "${_gitname}"
)
install="roger-router.install"
source=(
  "${_gitname}::git+https://gitlab.com/tabos/rogerrouter.git"
  "disable-evolution-plugin.patch"
  "address-book.svg"
  "${install}"
)
sha256sums=(
  'SKIP'  # Upstream source
  '723b426e766612f7c3888d98bfe306b9643d97c3f5097398c7dc3feed2ec8b9a'  # disable-evolution-plugin.patch
  '575b01dc0e68fd2f0b3d3c10afdec6fd4d61b570ec3d093e722c9fec35e6f82d'  # address-book.svg
  '7a32640a30cd73eb4e50af04b30fdcce93bd0b263577ad941037253608e86cfc'  # $install
)
options+=('emptydirs')
#options+=('!lto' 'debug')

_CFLAGSADDITIONS="-w -Wno-error=incompatible-pointer-types"

prepare() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}/${_gitname}"

  for _patch in "${srcdir}"/disable-evolution-plugin.patch; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -N -p1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log

  cd "${srcdir}"
  arch-meson "${_gitname}" build --reconfigure
}

pkgver() {
  cd "${srcdir}/${_gitname}"

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
  install -Dvm644 -t "${pkgdir}/usr/share/icons/hicolor/symbolic" "address-book.svg"

  cd "${srcdir}/${_gitname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
