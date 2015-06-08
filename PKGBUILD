# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=cpm-git
pkgver=0.32.r16.gbcd387e
pkgrel=1
pkgdesc="Curses based password manager using PGP-encryption"
arch=('i686' 'x86_64')
url="http://github.com/comotion/cpm"
license=('GPL2')
depends=('gpgme' 'libxml2>=2.6.16' 'cracklib' 'libcdk>=5.0' 'dotconf')
makedepends=('git' 'libcdk>=5.0' 'txt2man')
provides=('cpm')
conflicts=('cpm-git')
install=$pkgname.install
source=("$pkgname"::'git://github.com/comotion/cpm.git')

sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  sed 's%/usr/include/cdk/cdk.h%/usr/include/cdk.h%g' -i configure
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr \
    --with-cracklib-dir=/usr/share/cracklib \
    --with-cracklib-dict=/usr/share/cracklib/pw_dict \
    --with-cdk-dir=/usr/include/cdk
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/locale/de/LC_MESSAGES"
  
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/cpm"
  cp -r $srcdir/$pkgname/share/cpm/* "$pkgdir/usr/share/cpm/"
}
