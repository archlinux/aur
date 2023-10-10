# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-power-profile-switcher-git
_uuid=power-profile-switcher@eliapasquali.github.io
pkgver=5.1.r2.g4917510
pkgrel=2
pkgdesc="GNOME extension to automatically switch between power profiles based on power supply."
arch=('any')
url="https://github.com/eliapasquali/power-profile-switcher"
license=('GPL3')
depends=('gnome-shell' 'power-profiles-daemon')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eliapasquali/power-profile-switcher.git'
        'https://github.com/eliapasquali/power-profile-switcher/pull/24.patch')
sha256sums=('SKIP'
            '51725e2d7d7184b0a77046e0bb1aa0802fd35cafd7e7fb0553c6c6d2ace57c31')

pkgver() {
  cd power-profile-switcher
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd power-profile-switcher

  # Port to ESM for 45
  patch -Np1 -i ../24.patch
}

build() {
  cd power-profile-switcher
  gnome-extensions pack --force \
    --extra-source=ui
}

package() {
  cd power-profile-switcher
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.power-profile-switcher.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
