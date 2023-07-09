# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-power-profile-switcher-git
_uuid=power-profile-switcher@eliapasquali.github.io
pkgver=5.r0.ge5d1de7
pkgrel=1
pkgdesc="GNOME extension to automatically switch between power profiles based on power supply."
arch=('any')
url="https://github.com/eliapasquali/power-profile-switcher"
license=('GPL3')
depends=('gnome-shell' 'power-profiles-daemon')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eliapasquali/power-profile-switcher.git'
        'https://github.com/eliapasquali/power-profile-switcher/pull/20.patch')
sha256sums=('SKIP'
            'f34044694617b9ff2be4c31b1bda2163ad14b6d930bd818ade1e362e61ba48ee')

pkgver() {
  cd "$srcdir/power-profile-switcher"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/power-profile-switcher"
  patch -Np1 -i ../20.patch
}

build() {
  cd "$srcdir/power-profile-switcher"
  gnome-extensions pack --force \
    --extra-source=ui
}

package() {
  cd "$srcdir/power-profile-switcher"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.power-profile-switcher.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
