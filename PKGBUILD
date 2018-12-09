# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=pi-hole-ftl
_pkgname=FTL
_servicename=pihole-FTL
pkgver=4.1
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="The Pi-hole FTL engine"
url="https://github.com/pi-hole/FTL"
license=('EUPL-1.1')
depends=('nettle' 'gmp')
makedepends=('sqlite')
conflicts=('dnsmasq')
provides=('dnsmasq')
install=$pkgname.install
backup=('etc/pihole/pihole-FTL.conf' 'etc/pihole/pihole-FTL.db')
source=("https://github.com/pi-hole/FTL/archive/v$pkgver.tar.gz"
	"$pkgname.tmpfile"
	"$pkgname.service"
	"$pkgname.db"
	"$pkgname.conf")
md5sums=('b7525dc131756f1022e2121fcf48b3ca'
         '5faa64558cc0a5888923fcf77c299fa7'
         'f3e42ec6f04180c6d6972998bf172a41'
         '0495c002b7d5dce303d451e4cd2fede5'
         '40b1c4174198eacd7d12eb9b356aced0')

prepare() {
  _ssc="/tmp/sedcontrol"

  cd "$srcdir"/"$_pkgname"-"$pkgver"

  # makefile disable static linking
  sed -n "/LIBS=-pthread -Wl,/w $_ssc" "$srcdir"/$_pkgname-$pkgver/Makefile
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: makefile disable static linking 1" && return 1 ; fi
  sed -i '/LIBS=-pthread -Wl,/d' "$srcdir"/$_pkgname-$pkgver/Makefile
  sed -i "s|#LIBS=-pthread -lnettle|LIBS=-pthread -lnettle|w $_ssc" "$srcdir"/$_pkgname-$pkgver/Makefile
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: makefile disable static linking 2" && return 1 ; fi

  # git descriptions setup
  sed -i "s|^GIT_BRANCH := .*$|GIT_BRANCH := master|w $_ssc" "$srcdir"/$_pkgname-$pkgver/Makefile
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: git descriptions setup 1" && return 1 ; fi
  sed -i "s|^GIT_VERSION := .*$|GIT_VERSION := v$pkgver|w $_ssc" "$srcdir"/$_pkgname-$pkgver/Makefile
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: git descriptions setup 2" && return 1 ; fi
  sed -i "s|^GIT_DATE := .*$|GIT_DATE := $(date -I)|w $_ssc" "$srcdir"/$_pkgname-$pkgver/Makefile
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: git descriptions setup 3" && return 1 ; fi
  sed -i "s|^GIT_TAG := .*$|GIT_TAG := v$pkgver|w $_ssc" "$srcdir"/$_pkgname-$pkgver/Makefile
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: git descriptions setup 4" && return 1 ; fi

  # setting up logs paths
  sed -i "s|/var/log/pihole-FTL.log|/run/log/pihole-ftl/pihole-FTL.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/config.c
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up logs paths 1" && return 1 ; fi
  sed -i "s|/var/run/pihole-FTL|/run/pihole-ftl/pihole-FTL|w $_ssc" "$srcdir"/$_pkgname-$pkgver/config.c
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up logs paths 2" && return 1 ; fi
  sed -i "s|/var/run/pihole/|/run/pihole-ftl/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/config.c
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up logs paths 3" && return 1 ; fi
}

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname"-$pkgver/pihole-FTL "${pkgdir}"/usr/bin/pihole-FTL
  
  install -Dm644 "$pkgname.tmpfile" "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf

  install -dm755 "$pkgdir"/etc/pihole
  install -Dm644 "$pkgname.conf" "$pkgdir"/etc/pihole/pihole-FTL.conf
  install -Dm644 "$pkgname.db" "$pkgdir"/etc/pihole/pihole-FTL.db

  install -Dm644 "$pkgname.service" "$pkgdir"/usr/lib/systemd/system/$_servicename.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_servicename.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_servicename.service"
}
