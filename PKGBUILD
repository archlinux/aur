# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.2.4
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

  # fix for btrfs-progs 3.16
  sed 's/BTRFS_LIB_VERSION (100)/BTRFS_LIB_VERSION (101)/g' -i snapper/Btrfs.cc

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
  install -Dm755 client/.libs/systemd-helper "$pkgdir"/usr/lib/snapper/systemd-helper

  rm -f "$pkgdir"/etc/snapper/zypp-plugin.conf
  rm -f "$pkgdir"/usr/share/man/man*/snapper-zypp-plugin.*.gz

  for unit in {cleanup,timeline}.{timer,service}; do
    install -Dm644 "$srcdir"/$unit "$pkgdir"/usr/lib/systemd/system/snapper-$unit
  done
}

sha256sums=('8fc70b8e7a39dc3249ce9141e2c5f0623bb80f8e4150a543d8ed04d2ad27f399'
            '7c0a695b4d70b3d6aa25789b478ceca86ac3dab6f678045df4907b2c020341f9'
            'd2f2571e92ffe612529d69a96bd725b4bd040fc36043d98dc1e09b6efcb65894'
            'b62f61261e45587a38bcbe6468b8932259740984151db1636d299ddafbe3f7a9'
            'fb01465a6ba7c202c5b1aecb92b99bfcbcd7cdceb0448d84224a108481805bd5')
