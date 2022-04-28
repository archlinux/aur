# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=smile-emoji-picker
_pkgname=smile
pkgver=1.5.6
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
b2sums=('dc9fbc830327dd3774e07e6c99e2b7210443bb8282197d0718facc9ebcf0b92ff672615f820136e8c9faa5efae01d0b9939f99402989cd8b0b77e2ea53256eed')

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
