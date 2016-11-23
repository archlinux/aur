# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=sqlgrey
pkgver=1.8.0
pkgrel=4
pkgdesc="Postfix greylisting policy service with auto-white-listing with SQL database as storage backend."
arch=('any')
url="http://sqlgrey.sourceforge.net/"
license=('GPL')
depends=('perl' 'perl-net-server' 'perl-io-multiplex' 'perl-dbi' 'perl-date-calc' 'postfix>=2.1')
optdepends=('perl-dbd-pg: for using postgresql as backend database'
            'perl-dbd-mysql: for using mysql as backend database')
backup=('etc/sqlgrey/sqlgrey.conf'
        'etc/sqlgrey/clients_ip_whitelist.local'
        'etc/sqlgrey/clients_fqdn_whitelist.local')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/sqlgrey/sqlgrey-1.8%20%28stable%29/${pkgname}-${pkgver}.tar.gz"
        'fix-Makefile-path-to-perldoc.patch'
        'fix-Makefile-sbinpath.patch'
        'sqlgrey.service'
        'clients_fqdn_whitelist.local'
        'clients_ip_whitelist.local')
md5sums=('de9c6d0740fd2589d4e353e76c40e2c7'
         '0f87aa737aec1d1ac8a1bb6915f619a0'
         'ee03f586291b6f377ab28d5c1d5aca60'
         'bcf0940abe01a48fbfc9a4c5c5a7ae6f'
         '235535e43def87509936e13f5a9bab44'
         '9ad7dd44af527e10674c79e511fc1dfc')

_UID=111
_GID=111

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p0 < $srcdir/fix-Makefile-path-to-perldoc.patch
  patch -p0 < $srcdir/fix-Makefile-sbinpath.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make ROOTDIR="${pkgdir}" install
  
  # install sample config files
  install -Dm644 -o $UID -g $_GID "$srcdir"/clients_fqdn_whitelist.local "$pkgdir"/etc/sqlgrey/clients_fqdn_whitelist.local
  install -Dm644 -o $UID -g $_GID "$srcdir"/clients_ip_whitelist.local "$pkgdir"/etc/sqlgrey/clients_ip_whitelist.local

  # set permissions
  chown -R $_UID:$_GID "$pkgdir"/etc/sqlgrey

  # remove redundant init.d directory
  rmdir "$pkgdir"/etc/init.d

  # install systemd "unit file"
  install -D -m644 "$srcdir"/sqlgrey.service "$pkgdir"/usr/lib/systemd/system/sqlgrey.service
}

# vim:set ts=2 sw=2 et:
