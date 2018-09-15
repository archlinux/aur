# Contributor: royrocks <royrocks13@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-git
pkgver=3064.1588c20b
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A free drawing program designed for young children. Checkout from git"
url="http://www.newbreedsoftware.com/tuxpaint/"
license=('GPL')
depends=('sdl_ttf' 'sdl_mixer' 'sdl_image' 'sdl_pango' 'libpaper' \
  'librsvg' 'python2' 'fribidi' 'fontforge')
provides=('tuxpaint')
conflicts=('tuxpaint')
makedepends=('git' 'gperf' 'awk')
options=('!makeflags')
source=("git+https://git.code.sf.net/p/tuxpaint/tuxpaint")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  sed -i 's+/usr/local+/usr+g' "${pkgname%-git}"/Makefile
  sed -i 's+	kbuildsycoca4+#+' "${pkgname%-git}"/Makefile
}

build() {
  cd "${pkgname%-git}"
  
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install 
  rm -rf "$pkgdir"/usr/share/tuxpaint/CVS
  rm -rf "$pkgdir"/usr/X11R6 
  sed -i '1s/python/python2/' \
    "$pkgdir"/usr/share/tuxpaint/fonts/locale/zh_tw_docs/maketuxfont.py
} 
