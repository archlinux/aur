# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=swapspace
pkgver=1.16.1
pkgrel=1
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="https://github.com/Tookmund/Swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=("$url/archive/v$pkgver.tar.gz"
        fix-prefix.patch
        swapspace.service)
sha512sums=('57ebedcc533ac30aa3cf56a62737bfd2f6b0d398083558c2664000909156c626ff7daa30c581da7e6e310b8ba586c732828c81e3c7f8088ea18bcc0d52223c5c'
            '3bfca1f4e0d0ff1f31fc83b0f0320a06408fac47543d6d03ddc997fb262cd98d5ab712e6e7ee335ff64894dc71f4283888f5dea9397f96de781f26bd232be46e'
            'c7f9e590dcf836353ee452cf4ff6c66bb5e6eb1f03df089ffd367c8bca989f76a796fb3f6dc9fc8d1fe1c482ff3fa06401efa74c9256f0a9710afbb0bd80d77e')

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
