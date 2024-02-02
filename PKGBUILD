# Maintainer: neocturne <mschiffer@universe-factory.net>
# Previous maintainer: balwierz <my user name at the most popular google email service>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: lswest <lswest34 : gmail>
# Contributor: Christoph Zeiler <rabyte : gmail>

pkgname=gwaei
pkgver=3.6.2
pkgrel=3
pkgdesc="Japanese-English dictionary program"
arch=('x86_64')
url="http://gwaei.sourceforge.net/"
license=('GPL-3.0-or-later')
depends=('cairo' 'curl' 'dconf' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'gsettings-desktop-schemas' 'hicolor-icon-theme' 'hunspell' 'pango' 'zlib')
makedepends=('yelp-tools' 'intltool')
optdepends=('rsync: provide incremental dictionary updates'
            'ttf-arphic-ukai'
            'ttf-kanjistrokeorders: show stroke order diagrams')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/${pkgver/2/x}/$pkgname-$pkgver.tar.xz"
        'switch-to-yelp.patch'
        'refcount-fix.patch')
sha256sums=('9904e1755505f9a40cd7368e96e1eeb035c6c2f7ce14029cccb765f5b85986d7'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Patch from Debian to build using Yelp instead of GnomeDoc
  patch -Np1 -i ../switch-to-yelp.patch
  # Fix a number of segfaults due to use-after-free
  patch -Np1 -i ../refcount-fix.patch
  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --without-mecab --disable-scrollkeeper --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  ln -sf $pkgname "$pkgdir/usr/bin/waei"
}
