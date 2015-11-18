# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=swapspace
pkgver=1.12
pkgrel=2
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="https://github.com/Tookmund/Swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=("$url/archive/v$pkgver.tar.gz"
        0001-Use-DESTDIR-when-creating-the-localstatedir.patch
        fix-prefix.patch
        swapspace.service)
sha256sums=('a9b594c4ef8d8e4750087eb8e7e8b757cb1962ec3ad7ca155676de7143f7ffd1'
            '20c25de6f08b1f4ea892177bc87ba3343f58db1897bdcbd5dfcd470f919dd57a'
            '7710b5aecb78cdfe852ec4313ab4a45ba7e45c1e9724b1226cb16e8405fc7af4'
            'b829b4f4976c715238702da9b5fcebe3cf4f167c761d9a93347610c1d251ba70')

prepare() {
  cd "$srcdir/${pkgname^}-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf
}

build() {
  cd "$srcdir/${pkgname^}-$pkgver"
  ./configure \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname^}-$pkgver"
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 ../swapspace.service "$pkgdir/usr/lib/systemd/system"
}
