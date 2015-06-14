# Maintainer: Jason Lenz <Jason at Lenzplace dot org>
# Contributor: Rafał Michalski <plum.michalski at gmail dot com>
pkgname="burp-backup-dev"
_pkgname="burp"
pkgver=2.0.20
pkgrel=1
pkgdesc="A next generation experimental version of the burp backup and restore program."
arch=('i686' 'x86_64')
license=("AGPL3")
depends=('librsync' 'acl' 'openssl')
makedepends=('uthash')
conflicts=('burp-backup' 'burp-backup-git' 'burp-backup14')
install=$_pkgname.install
url='http://burp.grke.org/burp2.html'

source=(
  "http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
  "burp.install"
  "burp-server.service"
  "burp-client.service"
  "burp-client.timer"
  "01-runpath_fix.patch"
  "readme-archlinux.txt"
)

sha256sums=(
  278b3353463ba4febebffa30c62b36fcbae38009f8b991f44d3c5f4c0d5256dc # burp-${pkgver}.tar.bz2
  1d2c97471494dd5924bd0676e817ebfac54465c4ec0e23b49ad1c3c91d36460f # burp.install
  94e1b5f8cf61c44f84675f685279e0d3376abd61ac1e6e4f5da0dd6b922c481f # burp-server.service
  7908970e23cfb08554cbf53da1f8f3193a6b6ee076584f797644efab8431bfe3 # burp-client.service
  0310a26e9a0af76f847130019cb865dfa09a5e8f9899bfd6526c69e82d160bf4 # burp-client.timer
  781fcd11df9d8bf928eb08982cc5ed21c93a0661dacb4e184d01e246277ab877 # runpath_fix.patch change /var/run to /run
  e3e633f09d03efa3f2c1e769a2e31f514466ebd97cf6bb5f1ef0761e17abec67 # arch linux specific instructions
)

backup=(
  "etc/burp/burp.conf"
  "etc/burp/burp-server.conf"
  "etc/burp/CA.cnf"
  "etc/logrotate.d/burp"
)

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../01-runpath_fix.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Setup logrotate
  mkdir -p $pkgdir/etc/logrotate.d
  cp debian/logrotate $pkgdir/etc/logrotate.d/burp

  # Copy useful user setup files
  mkdir -p $pkgdir/usr/share/burp/
  cp debian/burp.cron.d $pkgdir/usr/share/burp/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  cp $srcdir/burp-server.service $pkgdir/usr/lib/systemd/system/
  cp $srcdir/burp-client.service $pkgdir/usr/lib/systemd/system/
  cp $srcdir/burp-client.timer $pkgdir/usr/lib/systemd/system/

  # Copy archlinux specific documentation 
  mkdir -p $pkgdir/usr/share/doc/burp/
  cp $srcdir/readme-archlinux.txt $pkgdir/usr/share/doc/burp/readme-archlinux.txt

  # Fix permissions
  mkdir -p $pkgdir/var/spool/burp
  chmod 0755 $pkgdir/var/spool
  chmod 0700 $pkgdir/var/spool/burp
  chmod -R go-rwx $pkgdir/etc/burp

  # Move "testclient" example to subfolder so it doesn't automatically get added to backup
  mv $pkgdir/etc/burp/clientconfdir/testclient $pkgdir/etc/burp/clientconfdir/incexc
}

# Helpful packaging references:
# General packaging -> https://wiki.archlinux.org/index.php/Creating_packages
# Generating patches -> https://wiki.archlinux.org/index.php/Patching_in_ABS
# Backing up package config files -> https://wiki.archlinux.org/index.php/Pacnew_and_Pacsave_files

# vim:set ts=2 sw=2 et:
