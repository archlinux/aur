# Maintainer: lectrode <electrodexsnet at gmail dot com>
# Contributor: Edgar Vincent <e-v@posteo.net>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgname=gnome-clocks
pkgname=${_pkgname}-waked
pkgver=48.0
pkgrel=1
pkgdesc="Clocks applications for GNOME (version with waked support)"
url="https://apps.gnome.org/Clocks"
arch=(x86_64 aarch64)
license=(GPL-2.0-or-later)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=(
  dconf
  geoclue
  geocode-glib-2
  glib2
  glibc
  gnome-desktop-4
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  libadwaita
  libgweather-4
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
source=("git+https://gitlab.gnome.org/GNOME/gnome-clocks.git?tag=${pkgver/[a-z]/.&}"
        'https://github.com/lectrode/gnome-clocks-waked/raw/main/alarm-clock-elapsed.oga'
        'https://github.com/lectrode/gnome-clocks-waked/raw/main/complete.oga'
        '0001-waked-support.patch'
        '0002-Add-argument-to-start-initial-instance-in-the-backgr.patch'
        'gnome-clocks.desktop')
b2sums=('SKIP'
            '29a248193023ab57bc011dd78eae7aa6b2c4cc4845e4bc92d4a2ba098958cc5d9f1a6454d0c081c4cfe0653b10a22ae52072f4fc0073fd607ab893a19ff4a1c1'
            'cd53b6d52a3ae4a147d5964015e07ca4d5c2e061aa70f3f2c5ba5af0ea664ff8be505926f366e4e8edbbc14a076f956b76cea57e68e45d2013d28c7de78354e6'
            'db272efc9d9cb9d0bef1ee98078b68ec0dcdaf28ea2b4fee1e1ac217af71c481974716e1ef53568155194498dfee05dbeb10533ea2d8baa674a9dadd084dc9db'
            '940e1bc2d1756bf8c9f7ad26c5b58a6aeb9eb2110f2ab483e6789c32336d54af2679271f5823b5ad8aabf4643cdbb97624440696606f606a64b69379eee31708'
            '1c3891a84f28bf8e8cbf7d0ad8f5d17a6993f91c686986193d5cf71c46368d7d6645de718f09cd4c6b69e4ed118333d02e22b4fb507c21ca55a54135a5c594fc')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {

  #custom patches from https://gitlab.alpinelinux.org/alpine/aports/-/tree/master/community/gnome-clocks

  echo Replacing alarm-clock-elapsed.oga...
  cp -f alarm-clock-elapsed.oga "${srcdir}/gnome-clocks/data/sounds/"
  echo Replacing complete.oga...
  cp -f complete.oga "${srcdir}/gnome-clocks/data/sounds/"

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
