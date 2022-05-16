# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=1.5.7
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://github.com/mijorus/smile"
license=('GPL3')
depends=('libwnck3' 'python-manimpango')
makedepends=('meson')
checkdepends=('appstream-glib' 'desktop-file-utils')
conflicts=("$pkgname-emoji-picker")
replaces=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('516daac821e88926e7e0b37d3f08df3490adb11683f807cc61504ef52997fcbf')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/emoji_list/generate_emoji_dict.py

  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/postinstall.py
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
