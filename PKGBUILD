# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=scissy
pkgver=0.13.11
pkgrel=1
pkgdesc="Lightweight and standalone git repository server"
arch=('i686' 'x86_64')
url="https://github.com/abique/scissy"
license=('MIT')
depends=(git sqlite3 libgit2 gnutls protobuf xz cracklib re2 mime-types)
source=(
  scissy::git://github.com/abique/scissy#tag=$pkgver
  scissy.install
  scissy.service
  scissy.tmpfiles
)
md5sums=('SKIP'
         '0bbb3e6a2601df538c204d7439a5ced6'
         '98690f1002f7d80af6cb9b939209a4dd'
         '6c652e0203eb62fd67ed28bfa7fc9d0c')
install=scissy.install
backup=('etc/scissy/config.json')

build() {
  cd $startdir/src/$pkgname
  git submodule init
  git submodule update
  rm -rf build
  mkdir build
  cd build
  cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/$pkgname/build

  make DESTDIR=$pkgdir install
  install -D -m644 ${srcdir}/scissy.service ${pkgdir}/usr/lib/systemd/system/scissy.service
  install -D -m644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/scissy/LICENSE
  install -d 755 $pkgdir/var/lib/scissy
  install -d 750 $pkgdir/etc/scissy
  install -Dm644 "${srcdir}"/scissy.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/scissy.conf
}

# vim:set ts=2 sw=2 et:
