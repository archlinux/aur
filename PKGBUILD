# Maintainer: Nissar Chababy <funilrys at outlook dot com>
_pkgname=backupninja
pkgname=$_pkgname-git
pkgver=1.0.2.14.ge0b4375
pkgrel=2
pkgdesc="A centralized way to configure and schedule many different backup utilities"
arch=('any')
url="https://labs.riseup.net/code/projects/backupninja"
license=('GPL')
depends=('bash' 'dialog')
makedepends=('git')
optdepends=('rdiff-backup: rdiff backups'
            'gzip: compress backups'
            'hwinfo: geting hardware information'
            'mariadb-clients: mysql backups'
            'rsync: secure and reliable remote syncronisation tool'
            'duplicity: duplicity backups')
source=('backupninja::git+https://0xacab.org/riseuplabs/backupninja.git')
md5sums=('SKIP')
backup=('etc/backupninja.conf')

pkgver() {
  cd "$SRCDEST/$_pkgname"
  git describe --always | sed 's|-|.|g' | cut -d "v" -f2
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --mandir=/usr/share/man
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
    chmod a-x $pkgdir/usr/lib/$_pkgname/parseini
    chmod a-x $pkgdir/usr/lib/$_pkgname/vserver
    mkdir -p "$pkgdir/usr/share/doc/$_pkgname/examples"
    install -Dm644 $pkgdir/usr/share/$_pkgname/example.* $pkgdir/usr/share/doc/$_pkgname/examples
    rm $pkgdir/usr/share/$_pkgname/example.*
}

# vim:set ts=2 sw=2 et:
