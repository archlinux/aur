# Maintainer: lectrode <electrodexsnet@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Edgar Vincent <e-v@posteo.net>

_pkgname=gnome-clocks
pkgname=${_pkgname}-waked
pkgver=43.0
pkgrel=1.1
pkgdesc="Clocks applications for GNOME (version with waked support)"
url="https://wiki.gnome.org/Apps/Clocks"
arch=(x86_64 aarch64)
license=(GPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(gtk4 libgweather-4 gnome-desktop-4 geoclue geocode-glib-2 gsound
         libadwaita waked)
makedepends=(vala gobject-introspection yelp-tools git meson)
groups=(gnome)
options=(!debug)
_commit=9877dfa0ca9fcc2fcf73fd6d96b57226380baf4a  # tags/43.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-clocks.git#commit=$_commit"
        '0001-invoke-waked-when-an-alarm-changes.patch'
        '0002-Add-argument-to-start-initial-instance-in-the-backgr.patch'
        '0003-add-lock-screen-actions.patch'
        'gnome-clocks.desktop')
sha256sums=('SKIP'
            '6203b5c43ac1f23ca5c622ab75d23891de24b17e716546c5230ec89928ccf0be'
            'a728598594b1fc7b0c40ebfa4b44ddd770dc33cc6590ef8518b987ccc4b6d0ce'
            '82bcab0a26dcb8a73719a690fc65c4003a2530ec27b066ea0f9336525e0e8a49'
            '37368c4f902facb6ed735df1c4edbd55fc477198246096929689dd0092f16fe2')

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
