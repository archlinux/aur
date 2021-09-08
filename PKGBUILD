# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=touche
pkgver=1.0.7
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'gtk3' 'touchegg')
makedepends=('gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
provides=('libtouche.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d711512971f1a832e316ecf10515ca1845ee2597be9538419f8c7e79cc87b7b2')

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
  DESTDIR="$pkgdir" meson install -C build

  ln -s "/usr/bin/com.github.joseexposito.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
