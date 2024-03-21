# Maintainer: raldone01 <raldone01@gmail.com>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper_bcachefs
_srctag=be1a76b2e6a29d2259693f552eb78796254d49c8
pkgver=0.10.7.be1a76b2e6a29d2259693f552eb78796254d49c8
pkgrel=1
pkgdesc="A tool for managing BTRFS, BCACHEFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'bcachefs-tools' 'libxml2' 'dbus' 'boost-libs' 'acl' 'json-c')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
conflicts=('snapper')
provides=('snapper')
source=("git+https://github.com/openSUSE/snapper#commit=$_srctag"
        "conf-d.patch"
        "cron-rename.patch"
        "drift-file-path.patch"
        "usr-paths.patch")
sha256sums=('SKIP'
            '267118a198583fc1ff10f376e108c0600844e0b1370e44ac4674b20332bff106'
            '0e76f2aef9ac05d719e25c2d60e7eba4b533778a57fe98fd047f256c6845f65f'
            '093c7993e466a0cf9c0794a971825f5f1b40047512857bc124ed0d63dbb306d6'
            '710da7638a1c123a6985398a15cd7c03432fc3b2d781e2d7a20a1a52669eed95')

prepare() {
  cd "$srcdir/snapper"
  patch -p1 -i "$srcdir/conf-d.patch"
  patch -p1 -i "$srcdir/cron-rename.patch"
  patch -p1 -i "$srcdir/drift-file-path.patch"
  patch -p1 -i "$srcdir/usr-paths.patch"
}

build() {
  cd "$srcdir/snapper"

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
              --disable-silent-rules \
              --enable-bcachefs
  make
}

package() {
  cd "$srcdir/snapper"

  make DESTDIR="$pkgdir" install
  install -Dm644 data/sysconfig.snapper \
    "$pkgdir"/etc/conf.d/snapper

  rm -rf "$pkgdir/usr/lib/snapper/testsuite/"
}
