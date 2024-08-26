# Maintainer: Jason Edson <jaysonedson _AT_ gmail.com>
# Contributor: Davi da Silva Böger <dsboger _AT_ gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers _AT_ uni-ol.de>
# Contributor: Fernando Fernandez <fernando _AT_ softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc _AT_ archlinux.org>

pkgbase=vte3-notification
pkgname=(
  'vte-notification-common'
  'vte3-notification'
  'vte4-notification'
  'vte-notification-docs'
)
pkgver=0.76.4
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget'
url='https://wiki.gnome.org/Apps/Terminal/VTE'
arch=('x86_64')
license=('LGPL')
depends=(
  'cairo'
  'fribidi'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gnutls'
  'icu'
  'lz4'
  'pango'
  'pcre2'
  'systemd'
  'systemd-libs'
)
makedepends=(
  'at-spi2-core'
  'gi-docgen'
  'git'
  'gobject-introspection'
  'gperf'
  'gtk3'
  'gtk4'
  'meson'
  'vala'
)
options=('!emptydirs' '!lto')

# Fedora patches: https://src.fedoraproject.org/rpms/vte291/tree
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='rawhide'
_fpatchfile100='0001-a11y-implement-GtkAccessibleText.patch'
_fpatchfile200='0001-add-notification-and-shell-precmd-preexec.patch'
_fcommit='2ca928e0ae789378d65ed7b6e8609345764a4ca3'

source=(
  "git+https://gitlab.gnome.org/GNOME/vte#tag=${pkgver}"
  "${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
  "${_fpatchfile200}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile200}"
)
sha256sums=(
  'SKIP'
  'e238d865e8a20a06d56b99f34a398ab3279d7228395a109e2a66bae32fddf760'
  '49374e5513735c4d31997709b6f9b9a444b0da5c04bc9c62d87919ab839aa1c3'
)

prepare() {
  cd vte

  # Apply patches
  patch -p1 -i "${srcdir}/${_fpatchfile100}-${_fcommit}"
  patch -p1 -i "${srcdir}/${_fpatchfile200}-${_fcommit}"
}

build() {
  local meson_options=(
    -D b_lto=false
    -D docs=true
  )

  arch-meson vte build "${meson_options[@]}"
  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="${srcdir}/${p}/${f#${pkgdir}/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_vte-notification-common() {
  pkgdesc='Common files used by vte and vte3/vte4'
  depends=('glibc' 'sh')
  provides=("vte-common=${pkgver}")
  conflicts=('vte-common')

  meson install -C build --destdir "${pkgdir}"

  cd "${pkgdir}"

  _pick vte3 usr/bin/vte-2.91
  _pick vte3 usr/include/vte-2.91
  _pick vte3 usr/lib/libvte-2.91.so*
  _pick vte3 usr/lib/pkgconfig/vte-2.91.pc
  _pick vte3 usr/lib/girepository-1.0/Vte-2.91.typelib
  _pick vte3 usr/share/gir-1.0/Vte-2.91.gir
  _pick vte3 usr/share/glade
  _pick vte3 usr/share/vala/vapi/vte-2.91.{deps,vapi}

  _pick vte4 usr/bin/vte-2.91-gtk4
  _pick vte4 usr/include/vte-2.91-gtk4
  _pick vte4 usr/lib/libvte-2.91-gtk4.so*
  _pick vte4 usr/lib/pkgconfig/vte-2.91-gtk4.pc
  _pick vte4 usr/lib/girepository-1.0/Vte-3.91.typelib
  _pick vte4 usr/share/gir-1.0/Vte-3.91.gir
  _pick vte4 usr/share/vala/vapi/vte-2.91-gtk4.{deps,vapi}

  _pick docs usr/share/doc
}

package_vte3-notification() {
  pkgdesc+=" for use with GTK3 with Fedora patches"
  depends+=(
    'at-spi2-core'
    'gtk3'
    'vte-notification-common'
  )
  provides+=(
    "vte3=${pkgver}"
    'libvte-2.91.so'
  )
  conflicts=('vte3')

  mv vte3/* "${pkgdir}"
}

package_vte4-notification() {
  pkgdesc+=" for use with GTK4 with Fedora patches"
  depends+=(
    'gtk4'
    'vte-notification-common'
  )
  provides+=(
    "vte4=${pkgver}"
    'libvte-2.91-gtk4.so'
  )
  conflicts=('vte4')

  mv vte4/* "${pkgdir}"
}

package_vte-notification-docs() {
  pkgdesc+=" documentation"
  depends=()
  provides+=("vte-docs=${pkgver}")
  conflicts=('vte-docs')

  mv docs/* "${pkgdir}"
}
