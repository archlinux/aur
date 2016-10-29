# Maintainer: qwence <queen.wenceslas@gmail.com>
# Contributor: Francesc Ortiz <francescortiz@gmail.com> 
pkgname=rsync-fadvise
_pkgname=rsync
pkgver=3.1.2
pkgrel=1
patchver=$pkgver
patchrel=1
pkgdesc="Patched version of rsync that prevents it from using disk cache through parameter --drop-cache"
#pkgdesc="Patched version of rsync that prevents it from using disk cache through parameter --drop-cache + slowdown patch (allow to specify a delay between links and sorts file operation based on inode)"
arch=('i686' 'x86_64')
url="http://rsync.samba.org/"
license=('GPL3')
depends=('perl' 'popt' 'acl' 'zlib')
backup=('etc/rsyncd.conf' 'etc/xinetd.d/rsync')
conflicts=('rsync')
provides=('rsync')
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5') # Wayne Davison <wayned@samba.org>
source=("http://rsync.samba.org/ftp/rsync/src/$_pkgname-$pkgver.tar.gz"
        "http://rsync.samba.org/ftp/rsync/src/$_pkgname-$pkgver.tar.gz.asc"
        "https://tobi.oetiker.ch/patches/rsync-$patchver-$patchrel-fadvise.patch"
        #"http://tobi.oetiker.ch/patches/rsync-$patchver-slowdown.patch"
        'rsyncd.conf' 'rsync.xinetd' 'rsyncd.service'
        'rsyncd.socket' 'rsyncd@.service')
md5sums=('0f758d7e000c0f7f7d3792610fad70cb'
         'SKIP'
         'b055468e7cbc5d829aa943f07916d458'
         'bce64d122a8e0f86872a4a21a03bc7f3'
         'ea3e9277dc908bc51f9eddc0f6b935c1'
         'f90ba7f3717028769d6f230a2402b5aa'
         'ae4c381e0c02d6132c7f6ded3f473041'
         '53f94e613e0bc502d38dd61bd2cd7636')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch < $srcdir/rsync-$patchver-$patchrel-fadvise.patch || return 1
    #patch < $srcdir/rsync-$patchver-slowdown.patch || return 1
    ./configure --prefix=/usr \
        --with-included-popt=no \
        --disable-debug
    make reconfigure
    make
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
    install -Dm644 ../rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
    install -Dm644 ../rsyncd.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
    install -m644 ../rsyncd.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
    install -m644 ../rsyncd@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
    install -Dm755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
