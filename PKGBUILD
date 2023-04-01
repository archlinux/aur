# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor pidgin-libnotify: 3ED <kas1987@o2.pl>

pkgname=pidgin-libnotify
pkgver=0.14
pkgrel=15
arch=('x86_64')
pkgdesc='Pidgin plugin that enables popups when someone logs in or messages you'
url='http://gaim-libnotify.sourceforge.net/'
license=('GPL')
depends=('pidgin' 'libnotify')
makedepends=('intltool')
source=("https://downloads.sourceforge.net/gaim-libnotify/$pkgname-$pkgver.tar.gz"
        'language_fixes.patch'
        'pidgin-libnotify-0.14-libnotify-0.7.patch'
        'pidgin-libnotify-showbutton.patch'
        'pidgin-libnotify-getfocus.patch'
        'pidgin-libnotify-notify-osd.patch'
        'pidgin-libnotify.metainfo.xml')
sha256sums=('74f4a9f20e0a483df39974178f1f2380786176189512bcd438e4ada280ec3abe'
            '11f24523acd0dd740e17f98b360fc2f4679536a8dd79d19e247bc0e90a65045d'
            'e9c8d71b74985e11ef2939033fc2feeac037eb6553272a11ddc8417a79baafda'
            '897a1f99255476110dd3d5e888134f255e60e9539f65e8c3c516640a0790838b'
            '1712c96e0cea68c21a909981246e06ea2d60ad41f77da1e399503443867e2186'
            'f8996bba9e3b169ac606499d6cbffd971ed5dc3c57097fbfb2582ad0cdf6fd7f'
            'a4c2a983eeffe9146a6e3d8349c12bdc3a5b7fb622980db164ea7c8426a90723')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../language_fixes.patch
  patch -Np0 -i ../pidgin-libnotify-0.14-libnotify-0.7.patch
  patch -Np0 -i ../pidgin-libnotify-showbutton.patch
  patch -Np0 -i ../pidgin-libnotify-getfocus.patch
  patch -Np1 -i ../pidgin-libnotify-notify-osd.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-deprecated
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../pidgin-libnotify.metainfo.xml "$pkgdir/usr/share/metainfo/pidgin-libnotify.metainfo.xml"
}
