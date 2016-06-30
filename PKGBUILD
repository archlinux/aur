# Maintainer: Tom Kuther <archlinux@kuther.net>

pkgname=snapper-git
_gitname=snapper
pkgver=0.3.2.git.1223.0b36c71
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
provides=('snapper')
conflicts=('snapper')
arch=('i686' 'x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost' 'pam')
makedepends=('lvm2' 'libxslt' 'docbook-xsl' 'git')
install=snapper.install
backup=('etc/conf.d/snapper')
source=('snapper::git+https://github.com/openSUSE/snapper.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(cat VERSION).git.$(git rev-list --count HEAD).$(git rev-parse --short master)
}

prepare() {
  cd "$_gitname"

  ## Build fixes
  # boost fixlets - Arch doesn't use -mt suffix
  sed -e 's@lboost_thread-mt@lboost_thread@g' \
      -e 's@lboost_system-mt@lboost_system@g' \
      -i snapper/Makefile.am

  ## Location/naming fixes
  # fix pam plugin install location
  sed -i -e 's@shell echo /@shell echo /usr/@g' pam/Makefile.am
  # all in /usr/bin
  sed -i -e 's@/usr/sbin@/usr/bin@g' data/org.opensuse.Snapper.service
  # NTP drift file location
  sed -i -e 's@/var/lib/ntp/drift/ntp.drift@/var/lib/ntp/ntp.drift@' \
    data/base.txt
  # man pages sysconfig location
  sed -i -e 's@/etc/sysconfig@/etc/conf.d@g' doc/*

  # systemd timer stuff (>= systemd-212)
  sed ':a;N;$!ba;s/\[Timer\]\nOnCalendar=hourly\n\n/\[Timer\]\nOnCalendar=hourly\nPersistent=true\n\n/g' \
    -i data/timeline.timer
  sed '/cron./d' -i scripts/Makefile.am
  sed -e 's@noinst_PROGRAMS@libexec_PROGRAMS@g' -i client/Makefile.am
}

build() {
  cd "$_gitname"

  aclocal
  libtoolize --force --automake --copy
  autoheader
  automake --add-missing --copy
  autoconf
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib/snapper \
              --with-conf=/etc/conf.d \
              --disable-zypp \
              --disable-silent-rules \
              --disable-ext4 \
              --enable-xattrs
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
  install -Dm644 data/sysconfig.snapper "${pkgdir}"/etc/conf.d/snapper

  # systemd timer units
  install -Dm644 data/cleanup.service "${pkgdir}"/usr/lib/systemd/system/snapper-cleanup.service
  install -Dm644 data/cleanup.timer "${pkgdir}"/usr/lib/systemd/system/snapper-cleanup.timer
  install -Dm644 data/timeline.service "${pkgdir}"/usr/lib/systemd/system/snapper-timeline.service
  install -Dm644 data/timeline.timer "${pkgdir}"/usr/lib/systemd/system/snapper-timeline.timer
}

# vim:set ts=2 sw=2 et:
