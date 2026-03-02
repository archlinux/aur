# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Zen Wen <zen.8841@gmail.com>

pkgname=subtitleeditor
pkgver=0.56.2
pkgrel=1
pkgdesc="A GTK+3 tool to create or edit subtitles for GNU/Linux/*BSD"
arch=('x86_64')
url="https://subtitleeditor.github.io/subtitleeditor/"
license=('GPL3')
depends=('desktop-file-utils' 'enchant' 'gst-plugins-base' 'gstreamermm' 'gst-libav'
  'gtkmm3' 'hicolor-icon-theme' 'libsigc++' 'libxml++2.6' 'xdg-utils')
makedepends=('intltool')
changelog=$pkgname.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/subtitleeditor/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('333598a35facfc2c1d6b9c53f9e722c21044c7025bfc02d596ac40a853f976b3')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./autogen.sh
  # enchant-2 naming change
  sed -i 's/enchant >=/enchant-2 >=/' configure
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  # https://github.com/kitone/subtitleeditor/commit/9294c84248c3628a355b3a95feeb42e28b7bfe5a
  # mv "${pkgdir}"/usr/share/appdata/ "${pkgdir}"/usr/share/metainfo/
}
