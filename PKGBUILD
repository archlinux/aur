# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.8.14
pkgrel=3
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
source=("https://github.com/openSUSE/snapper/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "conf-d.patch"
        "cron-rename.patch"
        "drift-file-path.patch"
        "macro-iterator-fix.patch"
        "usr-paths.patch")
sha256sums=('d3abe4d542dade06b361e7c89b5de03bb5202853bc5e314ca74080caa24923f6'
            '267118a198583fc1ff10f376e108c0600844e0b1370e44ac4674b20332bff106'
            'df980fe0faa6a21f8df59b90d486e50e4fc766de808049e77a52d1a73d139b82'
            '093c7993e466a0cf9c0794a971825f5f1b40047512857bc124ed0d63dbb306d6'
            'c894c041964eeb55d461d1476486b878851556892b93a6fa1738743f46027e9d'
            'a49de7878ee5420bec934542699e9b57861666686d05406dc863f6a557f7f253')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/conf-d.patch"
  patch -p1 -i "$srcdir/cron-rename.patch"
  patch -p1 -i "$srcdir/drift-file-path.patch"
  patch -p1 -i "$srcdir/macro-iterator-fix.patch"
  patch -p1 -i "$srcdir/usr-paths.patch"
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

  rm -rf "$pkgdir/usr/lib/snapper/testsuite/"
}
