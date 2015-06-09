# $Id$
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=openresolv-openrc
_pkgname=openresolv
pkgver=3.6.1
pkgrel=6
pkgdesc="resolv.conf management framework (resolvconf)"
arch=(any)
url="http://roy.marples.name/projects/openresolv"
license=('custom:BSD')
backup=(etc/resolvconf.conf)
depends=(bash openrc-core)
provides=(openresolv)
conflicts=(openresolv)
source=("http://roy.marples.name/downloads/openresolv/${_pkgname}-${pkgver}.tar.bz2"
	fs33801.patch
	openrc-path.patch)
sha1sums=('03bbbe32e3763ed3a17f83c500469ddc5969bbe7'
          '7d68b36dfd6c8f01f9bf21a726e82d4cffb48bca'
          '69177771673976506c24b4dfb88fa15fadd36077')
prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../fs33801.patch
  # For openrc path
  patch -Np1 -i ../openrc-path.patch
  sed -n '2,25{s:^# \?::;p}' resolvconf.in >LICENSE 
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/resolvconf --sbindir=/usr/bin
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
