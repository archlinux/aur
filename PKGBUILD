_pkgname=backupninja
pkgname=$_pkgname-borg-git
pkgver=1.0.2
pkgrel=1
pkgdesc="A centralized way to configure and schedule many different backup utilities"
arch=('any')
url="https://0xacab.org/riseuplabs/backupninja"
license=('GPL')
depends=('bash')
makedepends=('git')
optdepends=('dialog: to use ninjahelper'
            'rdiff-backup: rdiff backups'
            'gzip: compress backups'
            'hwinfo: getting hardware information'
            'mariadb-clients: mysql backups'
            'rsync: secure and reliable remote syncronisation tool'
            'borg: borg backups'
            'duplicity: duplicity backups')
conflicts=('backupninja-git')
source=('git+https://github.com/benzhaomin/backupninja.git#branch=borg_support')
md5sums=('SKIP')
backup=('etc/backupninja.conf')

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var
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
