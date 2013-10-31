# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.1.7
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('i686' 'x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git')
backup=('etc/conf.d/snapper')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-$pkgver.tar.bz2"
        'libbtrfs.patch')
options=(!libtool)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir"/libbtrfs.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # rename cron scripts
  sed -i -e 's@suse.de-@@g' scripts/Makefile.am
  # fix config location in cron scripts
  sed -i -e 's@/etc/sysconfig/@/etc/conf.d/@g' scripts/snapper-{daily,hourly}

  # boost fixlets - Arch doesn't use -mt suffix
  sed -i -e 's@lboost_thread-mt@lboost_thread@g' snapper/Makefile.am
  sed -i -e 's@lboost_system-mt@lboost_system@g' snapper/Makefile.am

  # fix pam plugin install location
  sed -i -e 's@shell echo /@shell echo /usr/@g' pam/Makefile.am
  # Arch all in /usr/bin
  sed -i -e 's@/usr/sbin@/usr/bin@g' data/org.opensuse.Snapper.service

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
}

sha256sums=('fcb8d98aa36021970b214a2b6ea85f86aa29e107559bf677226e2e4ade2c6ed0'
            '0d0289e7448a357c78450f6690d684fef0e889921be152038a73401d37294317')
