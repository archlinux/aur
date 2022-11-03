# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=swapspace
pkgver=1.18
pkgrel=1
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="https://github.com/Tookmund/Swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=("$url/archive/v$pkgver.tar.gz"
        swapspace.service)
b2sums=('748621418e209f194afa2e3324142bea9f9fe963fc0df13768d2feaf4c513aa4854ab3ece06f5899205ecf5b07e3882b0357cda2d5c26c2c3a30df95e5dd736d'
        '42690e95a18851248453542ed9d5612a786efd7803a50ef4893d2034727d5e62be7e3d945a63031de5fcaf54bceab89525de464cc5c4a137f23eb713545acfc1')

prepare() {
  cd "$srcdir/${pkgname^}-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -fi
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
