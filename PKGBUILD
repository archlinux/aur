# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.2.5
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('i686' 'x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-$pkgver.tar.bz2")

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
  install -Dm644 data/sysconfig.snapper \
    "$pkgdir"/etc/conf.d/snapper
  install -Dm755 client/.libs/systemd-helper \
    "$pkgdir"/usr/lib/snapper/systemd-helper

  rm -f "$pkgdir"/etc/snapper/zypp-plugin.conf
  rm -f "$pkgdir"/usr/share/man/man*/snapper-zypp-plugin.*.gz

  cd data
  for unit in {cleanup,timeline}.{timer,service}; do
    install -Dm644 $unit \
      "$pkgdir"/usr/lib/systemd/system/snapper-$unit
  done
}

sha256sums=('48bf3c3d409ab58ee06db77390a64889c44593ed824463fbfe707aa31d6831ea')
