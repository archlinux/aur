# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision-git
_app_id=dev.geopjr.Collision
pkgver=3.4.0.r0.g290e9ee
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://collision.geopjr.dev"
license=('BSD')
depends=('libadwaita' 'libyaml')
makedepends=('git' 'crystal' 'gobject-introspection' 'shards' 'spglib')
checkdepends=('appstream-glib')
optdepends=('python-nautilus: Add a shortcut to the Nautilus right-click menu')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/GeopJr/Collision.git"
  0288-Use-pacman-hooks.patch)
b2sums=('SKIP'
        '77c51994e7d5035eda087d0e1ec03a54cd32c559438a08112af1a4f318f4fbf8a86e4c21af42e26d6b1d5a96525f4d0f55a15db1b492b84d4bb53ee7da013e9c')

pkgver() {
  cd "Collision"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "Collision"
  patch -p1 -i ../0288-Use-pacman-hooks.patch
}

build() {
  cd "Collision"
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
  cd "Collision"

  # make test
  crystal spec -Dpreview_mt --order random

  appstream-util validate-relax --nonet "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "Collision"
  export PREFIX="$pkgdir/usr"
  export PO_LOCATION='po'
  export LOCALE_LOCATION='/share/locale'
  make DESTDIR="$pkgdir" install

  install -Dm644 "data/${_app_id}.gresource.xml" -t "$pkgdir/usr/share/${_app_id}/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "nautilus-extension/${pkgname%-git}-extension.py" -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
