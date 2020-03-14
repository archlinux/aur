# Maintainer: vonpupp <>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Contributor: Albert De La Fuente Vigliotti <>

pkgname=xiphos
pkgver=4.1.0
pkgrel=7
pkgdesc='A Bible study tool for GTK3'
arch=('x86_64' 'i686')
url='http://xiphos.org'
depends=('libbiblesync.so<2.0.0'
         'dbus-glib'
         'gtkhtml4'
         'libgsf'
         'sword>=1.8.1'
         'webkit2gtk')
makedepends=('docbook-utils'
             'gnome-common'
             'gnome-doc-utils'
             'intltool'
             'python2')
license=('GPL2')
provides=('gnomesword')
conflicts=("${provides[@]}")
replaces=("${provides[@]}")
source=("xiphos-$pkgver.tar.gz::https://github.com/crosswire/xiphos/archive/$pkgver.tar.gz"
	    "http://deb.debian.org/debian/pool/main/x/xiphos/xiphos_$pkgver.1+dfsg1-1.debian.tar.xz")
sha256sums=('52e2f415339b6ccef7049f5812707c617b4dbdb6ba40bf0f5a5210e04f75f849'
            'f0cd9a894dce646dcd3de81e5020cfa2c931f3341a3eaf4f5990d79b0618fa8b')

prepare () {
  cd "$pkgname-$pkgver"
  sed -i '0,/python/s//python2/' waf
  patch -Np1 < ../debian/patches/0016*
  patch -Np1 < ../debian/patches/0017*
}

build() {
  cd "$pkgname-$pkgver"
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build
}

package() {
  cd "$pkgname-$pkgver"
  python2 ./waf --destdir="$pkgdir" --no-post-install install
}
