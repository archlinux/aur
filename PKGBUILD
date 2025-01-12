# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

_pkgbase="gupnp"
pkgbase="${_pkgbase}-1.2"
pkgname=(
  "${_pkgbase}-1.2"
)
pkgver=1.4.3 # YES!, even though version is '1.4.x', it is still 'gupnp-1.2'.
pkgrel=1
epoch=0
pkgdesc="GObject-based UPNP framework. Legacy 1.2 variant for compatibility with old software."
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
  'glib2'
  'glibc'
  'libgssdp-1.2.so' # Provided by 'gssdp-1.2'
  libg{lib,object,io,module}-2.0.so
  'libsoup>=2'
  'libsoup<3'
  'libxml2'
  'libutil-linux' # Provided by 'util-linux-libs'.
  'libuuid.so'    # Provided by 'util-linux-libs'.
)
makedepends=(
  'glib2-devel'
  'gobject-introspection'
  'gssdp-1.2>=1.3.0'
  'util-linux-libs'
  'meson'
  'vala'
)
provides=()
conflicts=()
source=(
  "${_pkgbase}-${pkgver}.tar.bz2::https://gitlab.gnome.org/GNOME/${_pkgbase}/-/archive/${_pkgbase}-${pkgver}/${_pkgbase}-${_pkgbase}-${pkgver}.tar.bz2"
  "fix_meson_1.2_provides.patch"
)
sha256sums=(
  'a4cedaa39e865f849816d7e641523f746db9835c8dc63fffda1d7664caa79c20'  # Upstream source
  'cd56920ab63594933ac3ea9f8bb84f5c21e4417a7f4827eebeb4a19537c0dad9'  # fix_meson_1.2_provides.patch
)
validpgpkeys=(
  'AC9CD4E32D7C7F6357BA8ADD10F6E970175D29E1' # Jens Georg <mail@jensge.org>
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

  for _patch in "${srcdir}"/fix_meson_1.2_provides.patch; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

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

package_gupnp-1.2() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  optdepends=(
    'python:         For gupnp-binding-tool-1.2'
    'gupnp-1.2-docs: Documentation.'
  )
  provides=(libgupnp-1.2.so)

  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}"

  cd "${srcdir}/${_pkgbase}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgbase}"       AUTHORS NEWS README.md gupnp-logo.svg
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}

# vim:set sw=2 sts=-1 et:
