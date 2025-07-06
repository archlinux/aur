# Maintainer: karras <karras@0x539.ch>
#
# -- Previous Maintainers --
# Maintainer: Adrián Laviós <adrian@lavios.eu>
#
# -- Contributors from AURv3: runit-musl --
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: TJ Vanderpoel <tj@rubyists.com>
# Contributor: Kevin Berry <kb@rubyists.com>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
#
# -- Contributors from AURv3: runit --
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=runit-systemd
pkgver=2.2.0
pkgrel=2
pkgdesc="A service supervision scheme, intended to be used alongside systemd"
arch=('i686' 'x86_64')
url="http://smarden.org/runit/"
license=('BSD')
depends=('sh' 'util-linux')
makedepends=('coreutils' 'sed')
provides=('runit')
conflicts=('runit')
install="runit-systemd.install"
source=("http://smarden.org/runit/runit-${pkgver}.tar.gz" _sv runit.service)
sha256sums=('95ef4d2868b978c7179fe47901e5c578e11cf273d292bd6208bd3a7ccb029290'
            '869583488ddcf46e6c996a50fa66abc860853bf8f56dbb2c44cec07aa022a8d4'
            'aef4112bb48aedfbf60ed4e3bf89e5af7a7d5b673820f179b0801683118329b3')

prepare() {
  cd "$srcdir/admin/runit-$pkgver/src"

  # Set default service path to /var/service
  sed -i -e 's:^char \*varservice ="/service/";$:char \*varservice ="/var/service/";:' sv.c

  # Do not build statically
  sed -i -e 's/ -static//g' Makefile

  # Add custom CFLAGS and LDFLAGS instead of predefined ones by the source
  # Use GNU89 dialect to avoid compilation issues
  echo "${CC:-gcc} -std=gnu89 $CFLAGS" > conf-cc
  echo "${CC:-gcc -s} $LDFLAGS" > conf-ld
}

build() {
  cd "$srcdir/admin/runit-$pkgver/src"
  make
}

check() {
  cd "$srcdir/admin/runit-$pkgver/src"
  make check
}

package() {
  cd "$srcdir/admin/runit-$pkgver"
  install -dm755 "$pkgdir/var/service"
  install -Dm755 src/{chpst,runit,runit-init,runsv,runsvchdir,runsvdir,sv,svlogd,utmpset} -t "$pkgdir/usr/bin"
  install -Dm644 man/* -t "$pkgdir/usr/share/man/man8"
  install -Dm644 doc/*.html -t "$pkgdir/usr/share/doc/runit"
  install -Dm644 "package/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  install -Dm644 "$srcdir/_sv" "$pkgdir/usr/share/zsh/site-functions/_sv"
  install -Dm644 "$srcdir/runit.service" "$pkgdir/usr/lib/systemd/system/runit.service"
}
