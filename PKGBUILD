# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.0.8
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://smile.mijorus.it"
license=('GPL3')
depends=('dbus-python' 'libadwaita' 'python-manimpango')
makedepends=('meson')
checkdepends=('appstream-glib')
conflicts=("$pkgname-emoji-picker")
replaces=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('44b0b82085b691227618a0bb318f0293e414faefa4e39ef1dd95ee8c9526a2f4')

prepare() {
  cd "$pkgname-$pkgver"

  # https://github.com/mijorus/smile/issues/3#issuecomment-1089216803
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    precompile/emoji_list/generate_emoji_dict.py
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/postinstall.py

  # This is not a Flatpak
  sed -i 's|flatpak run {self.application_id}|/usr/bin/smile|g' src/Settings.py
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
