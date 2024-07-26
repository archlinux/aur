# Maintainer: Jason Edson <jaysonedson@gmail.com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.52.2
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
arch=('x86_64')
depends=(
  'dconf'
  'glib2'
  'gsettings-desktop-schemas'
  'gtk3'
  'hicolor-icon-theme'
  'libhandy'
  'libx11'
  'pango'
  'vte3-notification>=0.76.0'
)
makedepends=(
  'docbook-xsl'
  'git'
  'gnome-shell'
  'libnautilus-extension'
  'meson'
  'python-packaging'
  'yelp-tools'
)
optdepends=(
  'libnautilus-extension: Nautilus integration'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')

# Fedora patches: https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/gnome-terminal'
_frepobranch='rawhide'
_fcommit='67ad1345bf024da103e4ed23ff302d7f0c180259'
_fpatchfile100='gnome-terminal-cntr-ntfy-autottl-ts.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'

source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-terminal.git#tag=${pkgver}"
  "${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
  "${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=(
  'SKIP'
  'c694443d2701b0fd81f01bd8f23981b8ac8e60602fe3699dfd799a6434d54dc5'
  'a4a22834d6524fb697a8edf91c9489617d5ab2e513413fc84c6b8575320938f9'
)

prepare () {
  cd ${_pkgname}

  # Apply patches
  patch -p1 -i "../${_fpatchfile100}-${_fcommit}"
}

build() {
  local meson_options=(
    -D b_lto=false
    -D docs=true
    -D nautilus_extension=true
    -D search_provider=true
  )

  arch-meson build gnome-terminal "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 "${srcdir}/${_fgsoverridefile}-${_fcommit}" \
  "${pkgdir}/usr/share/glib-2.0/schemas/${_fgsoverridefile}"
}
