# Maintainer: Jason Edson <jaysonedson@gmail.com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.50.1
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
arch=(
  'i686'
  'x86_64'
)
depends=(
  'vte3-notification>=0.74.0'
  'gsettings-desktop-schemas'
)
makedepends=(
  'git'
  'docbook-xsl'
  'libnautilus-extension'
  'gnome-shell'
  'meson'
  'yelp-tools'
)
optdepends=(
  'gconf: for gnome-terminal-migration'
  'libnautilus-extension: for "Open Terminal Here" in GNOME Files'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')

# Fedora patches: https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/gnome-terminal'
_frepobranch='rawhide'
_fcommit='3ce2722532b31f2cf348745df07012c0f8c21d28'
_fpatchfile100='gnome-terminal-cntr-ntfy-autottl-ts.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'

source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-terminal.git#tag=${pkgver}"
  "${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
  "${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=(
  'SKIP'
  '5b8392072b90fb64dbaa9de90f9cfc8b873b328d520d90781bb4ef471a477cea'
  'a4a22834d6524fb697a8edf91c9489617d5ab2e513413fc84c6b8575320938f9'
)

prepare () {
  cd ${_pkgname}

  # Apply patches
  patch -p1 -i "../${_fpatchfile100}-${_fcommit}"
}

build() {
  arch-meson build gnome-terminal \
      -D b_lto=false \
      -D docs=true \
      -D nautilus_extension=true \
      -D search_provider=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 "${srcdir}/${_fgsoverridefile}-${_fcommit}" \
  "${pkgdir}/usr/share/glib-2.0/schemas/${_fgsoverridefile}"
}
