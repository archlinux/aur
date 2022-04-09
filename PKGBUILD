# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=smile-emoji-picker
_pkgname=smile
pkgver=1.5.2
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://github.com/mijorus/smile"
license=('GPL3')
depends=('libwnck3' 'python-manimpango')
makedepends=('meson')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('noto-fonts-emoji')
source=($url/archive/$pkgver.tar.gz)
b2sums=('1ebb5c277ffe9c8a0c8db68b5f7f381cf52f06d745e2a71953ca73bcacedbb9036e826fcbc66bb9d0da0eb58202f09f980ee946a92d8b327fd998dde295243f4')

# Special thanks to Mark Wagie https://github.com/yochananmarqos/pkgbuilds/blob/master/smile/PKGBUILD
prepare() {
  cd "$_pkgname-$pkgver"
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/emoji_list/generate_emoji_dict.py

  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/postinstall.py
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
