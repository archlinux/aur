# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=touche
pkgver=2.0.0
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'gtk4' 'libadwaita' 'touchegg')
makedepends=('gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
provides=('libtouche.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cff063028d074a7186cde8cf80982736e0d6eff3103e99d10f9dae7ad1379dd2')

build() {
  export npm_config_cache="$srcdir/npm_cache"

  cd "$pkgname-$pkgver"
  npm install

  if [[ "$XDG_CURRENT_DESKTOP" == "Pantheon" ]]; then
    arch-meson . build -Dtarget-de=elementary
  else
    arch-meson . build -Dtarget-de=gnome
  fi

  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/com.github.joseexposito.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
