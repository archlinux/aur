# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

_pkgbase=gssdp
pkgbase="${_pkgbase}-1.0"
pkgname=(
  "${_pkgbase}-1.0"
)
pkgver=1.0.5
pkgrel=1
pkgdesc="GObject-based API for handling resource discovery and announcement over SSDP. Legacy 1.0 variant for compatibility with old software."
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
  'libsoup>=2'
  'libsoup<3'
)
makedepends=(
  'glib2-devel'
  'gobject-introspection'
  'gtk3'
  'meson'
  'vala'
)
optdepends=(
  'gtk3: For gssdp-1.0-device-sniffer'
)
source=(
  "${_pkgbase}-${pkgver}.tar.bz2::https://gitlab.gnome.org/GNOME/${_pkgbase}/-/archive/${_pkgbase}-${pkgver}/${_pkgbase}-${_pkgbase}-${pkgver}.tar.bz2"
)
sha256sums=(
  '96bfcd692ad76d2547872df7e8c29a6585d8746923b9d196cf5f5dfcbda11578'  # Upstream source.
)
validpgpkeys=(
  'AC9CD4E32D7C7F6357BA8ADD10F6E970175D29E1'  # Jens Georg <mail@jensge.org>
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

  cd "${srcdir}"

  local meson_options=(
    -Dgtk_doc=false
    -Dsniffer=true
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

package_gssdp-1.0() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  provides=(libgssdp-1.0.so)

  meson install -C build --destdir "$pkgdir"

  mv -v "${pkgdir}/usr/bin/gssdp-device-sniffer"  "${pkgdir}/usr/bin/gssdp-1.0-device-sniffer"

  cd "${srcdir}/${_pkgbase}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgbase}"       AUTHORS NEWS README
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "COPYING"
}
