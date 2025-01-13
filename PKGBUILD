# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

_pkgbase="gupnp"
pkgbase="${_pkgbase}-1.0"
pkgname=(
  "${_pkgbase}-1.0"
)
pkgver=1.0.7
pkgrel=1
epoch=0
pkgdesc="GObject-based UPNP framework. Legacy 1.0 variant for compatibility with old software."
url="https://wiki.gnome.org/Projects/GUPnP"
arch=(
  'aarch64'
  'x86_64'
  'i686'
  'pentium4'
  'armv5h'
  'armv6h'
  'armv7h'
)
license=(LGPL-2.1-or-later)
depends=(
  'glib2>=2.44'
  'glibc'
  'libgssdp-1.0.so' # Provided by 'gssdp-1.0'
  libg{lib,object,io,module}-2.0.so
  'libsoup>=2.48.0'
  'libsoup<3'
  'libxml2'
  'libutil-linux' # Provided by 'util-linux-libs'.
  'libuuid.so'    # Provided by 'util-linux-libs'.
)
makedepends=(
  'glib2-devel'
  'gobject-introspection'
  'gssdp-1.0>=1.0.4'
  'util-linux-libs'
  'meson'
  'vala'
)
provides=()
conflicts=()
source=(
  "${_pkgbase}-${pkgver}.tar.bz2::https://gitlab.gnome.org/GNOME/${_pkgbase}/-/archive/${_pkgbase}-${pkgver}/${_pkgbase}-${_pkgbase}-${pkgver}.tar.bz2"
)
sha256sums=(
  'ffb54f7914a2f7514762693f4ef6604395d759db93bf1f45059184efd60eb345'  # Upstream source
)

_CFLAGSADDITIONS="-w -Wno-error=deprecated-declarations"

prepare() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"
  if [ -e "${_pkgbase}" ]; then
    rm -Rf "${_pkgbase}"
  fi
  ln -s "${_pkgbase}-${_pkgbase}-${pkgver}" "${_pkgbase}" # Provide a generic directory name that we use later.

  cd "${srcdir}/${_pkgbase}"

  cd "${srcdir}"

  local meson_options=(
    -Dcontext_manager=system
    -Dgtk_doc=false
    -Dintrospection=true
    -Dvapi=true
    -Dexamples=false
  )

  # meson subprojects download --sourcedir="${_pkgname}"

  # meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype plain --auto-features enabled --wrap-mode nodownload -D b_pie=true -D python.bytecompile=1 "${_pkgbase}" build --reconfigure "${meson_options[@]}"
  arch-meson "${_pkgbase}" build --reconfigure "${meson_options[@]}"

}

build() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  meson compile -C build
}

check() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  meson test -C build --print-errorlogs
}

package_gupnp-1.0() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  optdepends=(
    'python:         For gupnp-binding-tool-1.0'
    'gupnp-1.0-docs: Documentation.'
  )
  provides=(libgupnp-1.0.so)

  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}"

  cd "${srcdir}/${_pkgbase}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgbase}"       AUTHORS NEWS README
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}

# vim:set sw=2 sts=-1 et:
