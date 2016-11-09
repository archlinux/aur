# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=biboumi
pkgver=4.0
pkgrel=1
pkgdesc="XMPP gateway to IRC"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://biboumi.louiz.org/"
license=('ZLIB')
depends=('expat' 'libidn' 'c-ares' 'botan' 'litesql-git')
makedepends=('cmake' 'pandoc')
backup=("etc/$pkgname/$pkgname.cfg")
install="$pkgname.install"
source=("https://git.louiz.org/biboumi/snapshot/$pkgname-$pkgver.tar.xz"
        'sysuser.conf')
md5sums=('064958f1a8663ad72010e7209dbd5fd1'
         '07c92af3248861ce94d361e98cfb7f5c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSERVICE_USER=biboumi \
    -DSERVICE_GROUP=jabber
  make biboumi
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 doc/biboumi.1.rst "$pkgdir/usr/share/doc/$pkgname/$pkgname.rst"

  cd "$srcdir"
  install -Dm644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
