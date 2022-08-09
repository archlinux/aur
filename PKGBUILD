# Maintainer: Jason Edson <jaysonedson _AT_ gmail.com>
# Contributor: Davi da Silva Böger <dsboger _AT_ gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers _AT_ uni-ol.de>
# Contributor: Fernando Fernandez <fernando _AT_ softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc _AT_ archlinux.org>

pkgbase=vte3-notification
pkgname=(
  ${pkgbase}
  vte-notification-common
)
pkgver=0.69.92
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
url='https://wiki.gnome.org/Apps/Terminal/VTE'
license=(LGPL)
arch=(
  'i686'
  'x86_64'
)
depends=(
  'gtk3'
  'pcre2'
  'gnutls'
  'fribidi'
  'systemd-libs'
)
makedepends=(
  'gobject-introspection'
  'vala'
  'git'
  'gtk-doc'
  'gperf'
  'meson'
  'gi-docgen'
)
options=('!emptydirs')

# Fedora patches: https://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='rawhide'
_fpatchfile100='vte291-cntnr-precmd-preexec-scroll.patch'
_fcommit='80f531b220afc73b1d36ff10546993d50c22895b'

source=(
  "git+https://gitlab.gnome.org/GNOME/vte#tag=${pkgver}"
  "${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
  'vte3-notification_0.69.92.patch'
)
sha256sums=(
  'SKIP'
  '52ac9f2e6116d40701d89d342336d6533cec78a512835a8c72d947b4db1c60f3'
  '19aff914480085f6fd7402d425b6c71917d05b552960855ac130d93895924b85'
)

prepare () {
  cd vte

  # Apply patches
  #patch -p1 -i "${srcdir}/${_fpatchfile100}-${_fcommit}"
  patch -p1 -i "${srcdir}/vte3-notification_0.69.92.patch"  # Fixed patch
}

build() {
  arch-meson vte build \
    -D b_lto=false \
    -D docs=true
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

package_vte3-notification(){
  depends+=(vte-notification-common)
  provides+=(
    "vte3=${pkgver}"
    'libvte-2.91.so'
  )
  conflicts=('vte3')

  meson install -C build --destdir "${pkgdir}"

  _pick vte-common "${pkgdir}"/etc/profile.d
  _pick vte-common "${pkgdir}"/usr/lib/{systemd,vte-urlencode-cwd}
}

package_vte-notification-common() {
  pkgdesc='Common files used by vte and vte3'
  depends=('sh')
  arch=('any')
  provides=("vte-common=${pkgver}")
  conflicts=('vte-common')

  mv vte-common/* "${pkgdir}"
}
