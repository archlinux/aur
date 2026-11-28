# Maintainer: sfslinux <sfslinux@gmail.com>
# Based on the Arch l3afpad package by Balló György.

pkgname=l3afpad-md-git
pkgver=1.0.2.md1.r3.g3adad67
pkgrel=1
pkgdesc="Simple GTK3 text editor (l3afpad fork) with Markdown preview and formatted editing, syntax highlighting, emoji chooser"
arch=(x86_64)
url='https://github.com/sfs-pra/l3afpad-md'
license=(GPL-2.0-or-later MIT) # MIT: bundled md4c and github-markdown-css
depends=(
  cairo
  fontconfig
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libxml2
  pango
  uchardet
)
makedepends=(
  git
  intltool
)
provides=(l3afpad l3afpad-md)
conflicts=(l3afpad l3afpad-md)
source=(
  "$pkgname::git+$url.git#branch=syntax-highlight"
  l3afpad.appdata.xml
)
b2sums=('SKIP'
        '61ab731931a00daaeb1d904df49b860ab6f412aaac30977984a12bf5ed1b54171242bec6eadca89c6647839c8de692af7384bd0bfaa7bd682035827a522e0414')

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  autoreconf -fi
  intltoolize -f
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

check() {
  cd $pkgname
  make check # the editing test is skipped without xvfb-run and xdotool
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 ../l3afpad.appdata.xml "$pkgdir/usr/share/metainfo/l3afpad.appdata.xml"
  install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md CHANGELOG.md CHANGELOG.ru.md
  install -Dm644 src/md4c/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/md4c-LICENSE.md"
  install -Dm644 src/github-markdown-css/license "$pkgdir/usr/share/licenses/$pkgname/github-markdown-css-LICENSE"
}
