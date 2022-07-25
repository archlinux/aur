# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=1.6.2
_commit=0891189b186d92c451dea684e6af6e5dedee2b4d
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://github.com/mijorus/smile"
license=('GPL3')
depends=('libwnck3' 'python-manimpango')
makedepends=('git' 'meson')
checkdepends=('appstream-glib' 'desktop-file-utils')
conflicts=("$pkgname-emoji-picker")
replaces=("$pkgname-emoji-picker")
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/emoji_list/generate_emoji_dict.py

  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/postinstall.py
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
