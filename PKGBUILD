# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.7.2
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('49fc796b3259039069ead3f65c005c5b6741aacb445d9413ac7c6732ce758c17')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

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
}
