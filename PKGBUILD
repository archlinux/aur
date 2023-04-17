# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.5.0
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://collision.geopjr.dev"
license=('BSD')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'shards' 'spglib')
checkdepends=('appstream-glib')
optdepends=('python-nautilus: Add a shortcut to the Nautilus right-click menu')
conflicts=("$pkgname-hashes" 'hashbrown')
replaces=("$pkgname-hashes" 'hashbrown')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GeopJr/Collision/archive/v$pkgver.tar.gz"
        '0288-Use-pacman-hooks.patch')
sha256sums=('d7c0696d8eefcdb5acdaede5a9ab7c9962214299b5704059cee41d2157b4a88f'
            '914b06a460de8a3c872bbfb4b26340c4bfe517c5cd7e1798959eb21d2202a892')

prepare() {
  cd "Collision-$pkgver"
  patch -Np1 -i ../0288-Use-pacman-hooks.patch
}

build() {
  cd "Collision-$pkgver"
  export APP_ID=dev.geopjr.Collision
  export SHARDS_CACHE_PATH="$srcdir/shards-cache"
  export PREFIX='/usr'
  export PO_LOCATION='po'
  export LOCALE_LOCATION='/share/locale'

  # make desktop
  msgfmt --desktop --template data/${APP_ID}.desktop.in -d ${PO_LOCATION} -o data/${APP_ID}.desktop

  # make bindings
  shards install
  ./bin/gi-crystal

  # make build
  shards build -Dpreview_mt --release --no-debug

  # make gresource
  glib-compile-resources --sourcedir data --target data/${APP_ID}.gresource data/${APP_ID}.gresource.xml

  # make metainfo
  msgfmt --xml --template data/${APP_ID}.metainfo.xml.in -d ${PO_LOCATION} -o data/${APP_ID}.metainfo.xml
}

check() {
  cd "Collision-$pkgver"

  # make test
  crystal spec -Dpreview_mt --order random

  appstream-util validate-relax --nonet "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "Collision-$pkgver"
  export PREFIX="$pkgdir/usr"
  export PO_LOCATION='po'
  export LOCALE_LOCATION='/share/locale'
  make DESTDIR="$pkgdir" install

  install -Dm644 "data/${_app_id}.gresource.xml" -t "$pkgdir/usr/share/${_app_id}/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "nautilus-extension/$pkgname-extension.py" -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
