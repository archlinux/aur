# Maintainer: Jason Lenz <Jason at Lenzplace dot org>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: Rafał Michalski <plum.michalski at gmail dot com>
pkgname="burp-backup"
_pkgname="burp"
pkgver=2.4.0
pkgrel=1
pkgdesc="A backup and restore program that uses librsync to reduce backup size."
arch=('i686' 'x86_64' 'armv7h')
license=("AGPL3")
depends=('acl' 'librsync' 'openssl')
makedepends=('uthash')
conflicts=('burp-backup-dev' 'burp-backup-git')
install="${_pkgname}.install"
url='https://burp.grke.org/'

source=(
  "https://github.com/grke/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
  "burp.install"
  "readme-archlinux.txt"
  "https://github.com/grke/burp/commit/1d6c931af7c11f164cf7ad3479781e8f03413496.patch"
)

sha256sums=(
  1f88d325f59c6191908d13ac764db5ee56b478fbea30244ae839383b9f9d2832 # burp-2.4.0.tar.bz2
  813b5c349f9d0ea1db2fb166531472b098a773aa3d2766d151f175ad17c40351 # burp.install
  e3e633f09d03efa3f2c1e769a2e31f514466ebd97cf6bb5f1ef0761e17abec67 # readme-archlinux.txt
  SKIP
)

backup=(
  "etc/burp/burp.conf"
  "etc/burp/burp-server.conf"
  "etc/burp/CA.cnf"
  "etc/logrotate.d/burp"
)

prepare() {
  patch -d "$srcdir/$_pkgname-$pkgver" -p1 < 1d6c931af7c11f164cf7ad3479781e8f03413496.patch
  cd "$srcdir/$_pkgname-$pkgver"
}

build() {
  cd "$_pkgname-$pkgver"
  autoreconf -vif
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --runstatedir=/run \
              --localstatedir=/var \
              --sysconfdir=/etc/burp
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-all

  # Copy useful user setup files
  mkdir -p "$pkgdir/usr/share/burp/"
  cp -r configs "$pkgdir/usr/share/burp/"
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  cp "systemd/burp-server.service" "$pkgdir/usr/lib/systemd/system/"
  cp "systemd/burp-server-unprivileged.service" "$pkgdir/usr/lib/systemd/system/"
  cp "systemd/burp-client.service" "$pkgdir/usr/lib/systemd/system/"
  cp "systemd/burp-client.timer" "$pkgdir/usr/lib/systemd/system/"

  # Copy archlinux specific documentation 
  mkdir -p "$pkgdir/usr/share/doc/burp/"
  cp "$srcdir/readme-archlinux.txt" "$pkgdir/usr/share/doc/burp/readme-archlinux.txt"

  # Fix permissions
  mkdir -p "$pkgdir/var/spool/burp"
  chmod 0755 "$pkgdir/var/spool"
  chmod 0700 "$pkgdir/var/spool/burp"
  chmod -R go-rwx "$pkgdir/etc/burp"

  # Move "testclient" example to subfolder so it doesn't automatically get added to backup
  mv "$pkgdir/etc/burp/clientconfdir/testclient" "$pkgdir/etc/burp/clientconfdir/incexc"
}

# Helpful packaging references:
# General packaging -> https://wiki.archlinux.org/index.php/Creating_packages
# Generating patches -> https://wiki.archlinux.org/index.php/Patching_in_ABS
# Backing up package config files -> https://wiki.archlinux.org/index.php/Pacnew_and_Pacsave_files

# vim:set ts=2 sw=2 et:
