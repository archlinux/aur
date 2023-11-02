# Maintainer: lectrode (electrodexsnet@gmail.com)
# Contributor: Edgar Vincent <e-v@posteo.net>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgname=gnome-clocks
pkgname=${_pkgname}-waked
pkgver=45.0
pkgrel=1
pkgdesc="Clocks applications for GNOME (version with waked support)"
url="https://wiki.gnome.org/Apps/Clocks"
arch=(x86_64 aarch64)
license=(GPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
  geoclue
  geocode-glib-2
  gnome-desktop-4
  gtk4
  libadwaita
  libgweather-4
  xdg-desktop-portal
  waked
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
groups=(gnome)
_commit=b1c6ff122488fea47833108f7f661481b9b9574a  # tags/45.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-clocks.git#commit=$_commit"
        '0001-invoke-waked-when-an-alarm-changes.patch'
        '0002-Add-argument-to-start-initial-instance-in-the-backgr.patch'
        '0003-add-lock-screen-actions.patch'
        'gnome-clocks.desktop')
b2sums=('SKIP'
            'f63bd443f2a95b0acfc40989cdaf5b02a857fda14949731e5cdda341e8a26dcd2740bc885bf93087f25224820f1abfdc581919f16f4c47c5591e3348d6917a47'
            '940e1bc2d1756bf8c9f7ad26c5b58a6aeb9eb2110f2ab483e6789c32336d54af2679271f5823b5ad8aabf4643cdbb97624440696606f606a64b69379eee31708'
            'fcb286f9e4ed9381aa0c6ae46c4f4b27126d1e1236e59dec4f8fd564a5fe9f9c7041764e2ce3dc38af7393a0235aa41753167ad99434ba2ddbaf4e47fe12f8d5'
            '1c3891a84f28bf8e8cbf7d0ad8f5d17a6993f91c686986193d5cf71c46368d7d6645de718f09cd4c6b69e4ed118333d02e22b4fb507c21ca55a54135a5c594fc')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "gnome-clocks.desktop" "${pkgdir}/etc/xdg/autostart/gnome-clocks.desktop"
}

# vim:set sw=2 sts=-1 et:
