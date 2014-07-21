# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.2.3
pkgrel=2
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('i686' 'x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-$pkgver.tar.bz2"
        cleanup.timer
        cleanup.service
        timeline.timer
        timeline.service)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # boost fixlets - Arch doesn't use -mt suffix
  sed -e 's@lboost_thread-mt@lboost_thread@g' \
      -e 's@lboost_system-mt@lboost_system@g' \
      -i snapper/Makefile.am

  # cron names
  sed -e 's@suse.de-snapper@snapper@g' -i scripts/Makefile.am

  # fix sysconf dir
  sed -e 's@/etc/sysconfig@/etc/conf.d@g' -i scripts/*snapper*

  # fix pam plugin install location
  sed -i -e 's@shell echo /@shell echo /usr/@g' pam/Makefile.am

  # all in /usr/bin
  sed -i -e 's@/usr/sbin@/usr/bin@g' data/org.opensuse.Snapper.service

    # NTP drift file location
  sed -i -e 's@/var/lib/ntp/drift/ntp.drift@/var/lib/ntp/ntp.drift@' data/base.txt

  # man pages sysconfig location
  sed -i -e 's@/etc/sysconfig@/etc/conf.d@g' doc/*
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  aclocal
  libtoolize --force --automake --copy
  autoheader
  automake --add-missing --copy
  autoconf
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --with-conf=/etc/conf.d \
              --disable-zypp \
              --disable-silent-rules
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 data/sysconfig.snapper "$pkgdir"/etc/conf.d/snapper

  rm -f "$pkgdir"/etc/snapper/zypp-plugin.conf
  rm -f "$pkgdir"/usr/share/man/man*/snapper-zypp-plugin.*.gz

  for unit in {cleanup,timeline}.{timer,service}; do
    install -Dm644 "$srcdir"/$unit "$pkgdir"/usr/lib/systemd/system/snapper-$unit
  done
}

sha256sums=('6c78fc57ac018f7536a03971927f2b17f1f048f87e26689609028f51500c9c6a'
            '7c0a695b4d70b3d6aa25789b478ceca86ac3dab6f678045df4907b2c020341f9'
            'd2f2571e92ffe612529d69a96bd725b4bd040fc36043d98dc1e09b6efcb65894'
            'ae609064e586b7b553f3ee5d9bd692fa125cdb60bc71e04a42c567cdfb76fa68'
            'fb01465a6ba7c202c5b1aecb92b99bfcbcd7cdceb0448d84224a108481805bd5')
