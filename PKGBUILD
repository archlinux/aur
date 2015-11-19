# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=scissy
pkgver=0.12.2
pkgrel=2
pkgdesc="Lightweight and standalone git repository server"
arch=('i686' 'x86_64')
url="https://githube.com/abique/scissy"
license=('MIT')
depends=(git sqlite3 libgit2 gnutls protobuf xz cracklib re2 mime-types)
source=(
  http://195.154.86.34:4242/scissy/$pkgname-$pkgver.tar.xz
  scissy.install
  scissy.service
  scissy.tmpfiles
)
md5sums=('49c46b1fc023061dc8a58b133d7ceffb'
         '7ccc61e12e090d4ada7240fada9aeea2'
         '98690f1002f7d80af6cb9b939209a4dd'
         '6c652e0203eb62fd67ed28bfa7fc9d0c')
install=scissy.install
backup=('etc/scissy/config.json')

build() {
  cd $startdir/src/$pkgname-$pkgver
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build

  make DESTDIR=$pkgdir install
  install -D -m644 ${srcdir}/scissy.service ${pkgdir}/usr/lib/systemd/system/scissy.service
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/scissy/LICENSE
  install -d 755 $pkgdir/var/lib/scissy
  install -d 750 $pkgdir/etc/scissy
  install -Dm644 "${srcdir}"/scissy.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/scissy.conf
}

# vim:set ts=2 sw=2 et:
