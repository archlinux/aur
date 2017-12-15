# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=pi-hole-ftl
_pkgname=FTL
pkgver=2.12
pkgrel=4
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="The Pi-hole FTL engine"
url="https://github.com/pi-hole/FTL"
license=('EUPL-1.1')
depends=()
makedepends=('sqlite')
install=$pkgname.install
backup=('etc/pihole/pihole-FTL.conf')
source=("https://github.com/pi-hole/FTL/archive/v$pkgver.tar.gz"
	"$pkgname.tmpfile"
	"$pkgname.service"
	"$pkgname.conf"
	"$pkgname.sysuser"
  db_adjustment.patch::https://github.com/pi-hole/FTL/compare/95bdd62777347f2117070ce8060b2ca1cc3072c0...8ab56e58f29fc3e5263ab51b80534154832ffbd6.patch
  )
md5sums=('97b328deae11133d489db76006ecd0a6'
         'a10e77e81c900819dfe78e1484e1e226'
         '0f65203b2585fb83e02826091d220386'
         '2d6ae93eea48a09ce5bc5bf62e081dd4'
         '68e78907dc2a0c89421d02377e76d353'
         'dabe06956efdacf23a45884d00a48f54')

prepare() {
  _ssc="/tmp/sedcontrol"

  cd "$srcdir"/"$_pkgname"-"$pkgver"

  # all commits around PR#172 PR#167
  # see https://github.com/pi-hole/FTL/pull/172#issuecomment-351853956
  
  patch -Np1 -i "$srcdir"/db_adjustment.patch
  cd "$srcdir"

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
  sed -i "s|/var/log/pihole-FTL.log|/run/log/pihole-ftl/pihole-FTL.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/structs.c
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up logs paths 1" && return 1 ; fi
  sed -i "s|/var/run/pihole-FTL|/run/pihole-ftl/pihole-FTL|w $_ssc" "$srcdir"/$_pkgname-$pkgver/structs.c
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up logs paths 2" && return 1 ; fi
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/structs.c
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
  install -Dm644 "$pkgname.sysuser" "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf

  install -dm755 "$pkgdir"/etc/pihole
  install -Dm644 "$pkgname.conf" "$pkgdir"/etc/pihole/pihole-FTL.conf

  install -Dm644 "$pkgname.service" "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$pkgname.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$pkgname.service"
}
