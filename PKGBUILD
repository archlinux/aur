# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=swapspace
pkgver=1.15~really1.14
pkgrel=1
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="https://github.com/Tookmund/Swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=("$url/archive/v1.14.tar.gz"
        fix-prefix.patch
        swapspace.service)
sha512sums=('ad75897cc4a5e47729a53fc92de93f12a4c3e11dd0dc93e7f1f133db64a04a72dcc186417848ab577ef008fead0e4b0623ba3075b503fc42c2ed80605069e451'
            '3bfca1f4e0d0ff1f31fc83b0f0320a06408fac47543d6d03ddc997fb262cd98d5ab712e6e7ee335ff64894dc71f4283888f5dea9397f96de781f26bd232be46e'
            'c7f9e590dcf836353ee452cf4ff6c66bb5e6eb1f03df089ffd367c8bca989f76a796fb3f6dc9fc8d1fe1c482ff3fa06401efa74c9256f0a9710afbb0bd80d77e')

prepare() {
  cd "$srcdir/${pkgname^}-1.14"

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
  cd "$srcdir/${pkgname^}-1.14"
  ./configure \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname^}-1.14"
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 ../swapspace.service "$pkgdir/usr/lib/systemd/system"
}
