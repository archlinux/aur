# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=subtitleeditor
pkgver=0.54.0
pkgrel=5
pkgdesc="A GTK+3 tool to edit subtitles for GNU/Linux/*BSD"
arch=('x86_64')
url="https://kitone.github.io/subtitleeditor/"
license=('GPL3')
depends=('desktop-file-utils' 'enchant' 'gst-plugins-base' 'gstreamermm' 'gst-libav'
         'gtkmm3' 'hicolor-icon-theme' 'libsigc++' 'libxml++2.6' 'xdg-utils')
makedepends=('intltool')
changelog=$pkgname.changelog
source=(https://github.com/kitone/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('aa9c539f3a0984deef257339e2b9f5c8728b8245113695cf6d42459f011aa2ab')


prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
# enchant-2 naming change
  sed -i 's/enchant >=/enchant-2 >=/' configure
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

# https://github.com/kitone/subtitleeditor/commit/9294c84248c3628a355b3a95feeb42e28b7bfe5a
  mv "${pkgdir}"/usr/share/appdata/ "${pkgdir}"/usr/share/metainfo/
}
