# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="dbus-glib"
pkgname="mingw-w64-${_name}"
pkgver=0.114
pkgrel=1
pkgdesc="GLib bindings for D-Bus (deprecated) (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/dbus"
_url="https://gitlab.freedesktop.org/dbus/${_name}"
license=('AFL-2.1 OR GPL-2.0-or-later')
depends=('mingw-w64-crt' 'mingw-w64-dbus' 'mingw-w64-expat' 'mingw-w64-glib2')
makedepends=('dbus-glib' 'git' 'glib2-devel' 'gtk-doc' 'mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}::git+${_url}.git?signed#tag=${_pkgsrc}")
sha256sums=('b613546d2bfbeb21cbacc11c536e17afa01b69c2a8353ccc8eb3910dad9095ca')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  local configure_options=(
    --disable-bash-completion
    --disable-checks
    --disable-gtk-doc
    --with-dbus-binding-tool='/usr/bin/dbus-binding-tool' # https://bugs.gentoo.org/346353
  )

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh \
    --no-configure

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure "${configure_options[@]}"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
  cd "${srcdir}/${_pkgsrc}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/"{'etc','libexec','share'}
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" "{}" \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded "{}" \;
    find "${pkgdir}/usr/${_arch}" \( -name '*.a' -o -name '*.dll' \) -exec "${_arch}-strip" -g '{}' ';'
  done
}

# vim: ts=2 sw=2 et:
