# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=biboumi
pkgver=9.0
pkgrel=1
pkgdesc="XMPP gateway to IRC"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://biboumi.louiz.org/"
license=('ZLIB')
depends=('expat' 'libidn' 'udns' 'botan' 'sqlite' 'postgresql-libs')
makedepends=('cmake' 'ninja' 'python-sphinx' 'python-sphinx_rtd_theme')
backup=("etc/$pkgname/$pkgname.cfg")
source=("https://git.louiz.org/biboumi/snapshot/$pkgname-$pkgver.tar.xz"
        'biboumi.tmpfiles'
        'biboumi.sysusers')
md5sums=('f0a201312454f529bb2a476856264e52'
         '3fd509b5cd76cd6c98ddb392957de03b'
         '07c92af3248861ce94d361e98cfb7f5c')

prepare() {
  mkdir -p build
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSERVICE_USER=biboumi \
    -DSERVICE_GROUP=jabber \
    -Wno-dev \
    -G Ninja
}

build() {
  ninja -C build
  ninja -C build doc
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install

  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/
  cp -r html "$pkgdir"/usr/share/doc/$pkgname/

  cd ../$pkgname-$pkgver
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/*.rst "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 conf/biboumi.cfg "$pkgdir"/etc/$pkgname/$pkgname.cfg

  cd ..
  install -Dm644 biboumi.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 biboumi.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
