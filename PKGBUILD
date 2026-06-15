# Maintainer: Sravan Pannala <sradjoker@endeavouros.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=snapper-git
_gitname=snapper
pkgver=0.13.1.git.3111.f25abd5d
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
provides=('snapper')
conflicts=('snapper')
arch=('x86_64' 'aarch64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl' 'json-c')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
source=("snapper::git+https://github.com/openSUSE/snapper.git"
	      "conf-d.patch"
        "cron-rename.patch"
        "drift-file-path.patch"
        "usr-paths.patch")
sha256sums=('SKIP'
            '527fc127eb0569eea9dcb888833e0b1f54302bfcb3a88f0101ae32837771bc61'
            'bba58d4a0812b330c7d9867b2e79cc8e084ad1d2c972ce1959ef675267439d7f'
            '093c7993e466a0cf9c0794a971825f5f1b40047512857bc124ed0d63dbb306d6'
            'f1feeba7dab5464e01a7372f6dcf5095922f901ebf7d5f9debd71438bcff52da')

pkgver() {
  cd "$_gitname"
  echo $(cat VERSION).git.$(git rev-list --count HEAD).$(git rev-parse --short master)
}

prepare() {
  cd "$_gitname"
  patch -p1 -i "$srcdir/conf-d.patch"
  patch -p1 -i "$srcdir/cron-rename.patch"
  patch -p1 -i "$srcdir/drift-file-path.patch"
  patch -p1 -i "$srcdir/usr-paths.patch"
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
              --with-conf=/etc/conf.d \
              --with-pam-security=/usr/lib/security \
              --disable-zypp \
              --disable-silent-rules
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
  install -Dm644 data/sysconfig.snapper \
    "$pkgdir"/etc/conf.d/snapper

  rm -rf "$pkgdir/usr/lib/snapper/testsuite/"
}
