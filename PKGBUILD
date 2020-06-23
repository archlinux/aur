# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=snappy-player
_pkgname=snappy
pkgver=1.0
pkgrel=7
pkgdesc="Powerful media player with a minimalistic interface"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Snappy"
license=('GPL')
depends=('gst-plugins-base' 'clutter-gst' 'clutter-gtk')
optdepends=('gst-plugins-good: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'            
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs')
source=(https://download.gnome.org/sources/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.xz
        snappy.appdata.xml
        0001-Set-windowing-backend-to-X11.patch
        clutter-gst3.patch)
sha256sums=('0d33a05c1ad3cc075b8b9bf38d45634ea5204159454597b0882dd6a8d9763f58'
            '5e92ab0d1517e76160ef828da84826a1b3c6f59139e5f2c1399f33a7a8ceeceb'
            'cfd50c1768d206feb3bb7310e53363ca02a78ce200b1e2ba7b16bccd4720b176'
            '0c9e0f5cacd03c204871e301e11e5cc904e7fbece38f0162ff63b3e2b3bbc7bf')

prepare() {
  cd $_pkgname-$pkgver
  # Fix compatibility with Clutter 1.22
  patch -Np1 -i ../0001-Set-windowing-backend-to-X11.patch

  # Port to clutter-gst 3.0
  patch -Np1 -i ../clutter-gst3.patch
  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../snappy.appdata.xml "$pkgdir/usr/share/metainfo/snappy.appdata.xml"
}
