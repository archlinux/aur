# Maintainer: Miranda Collins (serqetry) <miranda@xyla.net>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver-hacks
_srcname=xscreensaver
pkgver=6.15
pkgrel=1
pkgdesc="Standalone graphical hacks and screensavers from xscreensaver"
arch=('x86_64')
url="https://www.jwz.org/xscreensaver/"
license=('BSD-2-Clause')
conflicts=('xscreensaver')

depends=('libxxf86vm' 'mesa' 'libxmu' 'gdk-pixbuf2' 'gdk-pixbuf-xlib' 'libx11' 'libxext' 'libxt')
makedepends=('bc')

source=("https://www.jwz.org/xscreensaver/$_srcname-$pkgver.tar.gz"
        "LICENSE")
        
sha256sums=('d2e687e56263fbfd8fca1fb9cc7c9331fd4f096ab57d3f7482565fe012c362d3'
            '0d2a17d9645402edf51182609a06f9be3232bba0802397387e64c125ebb8bde0')

build() {
  cd "$_srcname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-app-defaults=/usr/lib/X11/app-defaults \
    --without-pam \
    --without-motif \
    --without-gtk \
    --with-gl \
    --without-gle \
    --with-pixbuf \
    --with-jpeg \
    --disable-locking \
    --with-hackdir=/usr/lib/xscreensaver \
    --with-configdir=/usr/share/xscreensaver/config || true

  make -C utils
  make -C hacks
  make -C hacks/glx
}

package() {
  cd "$_srcname-$pkgver"
  
  make -C hacks DESTDIR="$pkgdir" install
  make -C hacks/glx DESTDIR="$pkgdir" install
  
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
