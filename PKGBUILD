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
pkgver=2.1.2
pkgrel=2
pkgdesc="A service supervision scheme. This package is intended to be used alongside systemd."
url="http://smarden.org/runit/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('bash' 'util-linux')
makedepends=('coreutils' 'sed')
provides=('runit')
conflicts=('runit')
install="runit-systemd.install"
source=( http://smarden.org/runit/runit-$pkgver.tar.gz _sv runit.service )
sha256sums=('6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66ab49490992c0c47ba18'
            'c8f08a977595d16b8afd12e49048c061c483e4408bfa6f66e72af4a72d279e3d'
            'aef4112bb48aedfbf60ed4e3bf89e5af7a7d5b673820f179b0801683118329b3')

prepare() {
  cd "$srcdir/admin/runit-$pkgver/src"
  
  # set default service path to /var/service
  sed -i -e 's:^char \*varservice ="/service/";$:char \*varservice ="/var/service/";:' sv.c
  
  # do not build statically
  sed -i -e 's/ -static//g' Makefile
  
  # add custom CFLAGS and LDFLAGS instead of predefined ones by the source
  echo "${CC:-gcc} $CFLAGS" > conf-cc
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

# vim:set ts=2 sw=2 et:
