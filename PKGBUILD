# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname=eog
pkgbase="${_pkgname}-git"
pkgname=(
  "${pkgbase}"
  "${_pkgname}-docs-git"
)
pkgver=44.2+4+g0cbb68f5
pkgrel=1
pkgdesc="Eye of Gnome: An image viewing and cataloging program"
url="https://wiki.gnome.org/Apps/EyeOfGnome"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
license=(GPL)
depends=(
  exempi
  gnome-desktop
  lcms2
  libexif
  libhandy
  libpeas
  librsvg
  webp-pixbuf-loader
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  systemd
  yelp-tools
)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D libportal=false
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_eog-git() {
  optdepends=(
    'eog-plugins: Additional features')
  provides=("${_pkgname}=${pkgver}")
  conflicts=("${_pkgname}")
  groups=(
    gnome
    gnome-git)
  options=(!emptydirs)
  meson install -C build --destdir "${pkgdir}"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/gtk-doc
}

package_eog-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
