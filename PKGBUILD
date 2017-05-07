# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>

pkgbase=xtreemfs
pkgname=(xtreemfs-server xtreemfs-client)
_pkgname=XtreemFS
pkgver=1.5.1
pkgrel=2
pkgdesc="A fault-tolerant distributed file system for all storage needs"
arch=(x86_64)
url="http://www.xtreemfs.org"
license=('BSD')
makedepends=('gcc' 'cmake' 'make' 'apache-ant' 'java-environment' 'fuse' 'boost-libs')
source=("http://www.xtreemfs.org/downloads/$_pkgname-$pkgver.tar.gz"
       "fix-openssl11.patch"
       "xtreemfs-server.install"
       "xtreemfs-dir.service"
       "xtreemfs-mrc.service"
       "xtreemfs-osd.service")
sha256sums=('278f8a6cb58233d42aeb80442a60475aab569c9736f35dc3325005d8f287928c'
            'cc543215add8198ffbe363bddcf05182e3e44ecbe55920bbe706b16082dd750f'
            '8dec87857645817813b103c2332ab5b420021e58eb15fc5a2e0d16a1acef230d'
            '301a09fcfbdfd70050f14f2708e796b1ecea9d008cfb2d78ec9130c02722a797'
            '3515b39f91bda2696b924c6cb49d4c402ba8e3696039bf3a492009c574b34ab0'
            'd6ff68574c613f636187815df2c6776f95ee7e5da25e35bc5908e091e68ac844')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 < "$srcdir/fix-openssl11.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    make
}

package_xtreemfs-server() {
    depends=('java-environment' 'util-linux')
    pkgdesc="A fault-tolerant distributed file system for all storage needs (server)"
    install=xtreemfs-server.install
    backup=("etc/xos/xtreemfs/dirconfig.properties" 
            "etc/xos/xtreemfs/mrcconfig.properties" 
            "etc/xos/xtreemfs/osdconfig.properties"
            "etc/xos/xtreemfs/server-repl-plugin/dir.properties"
            "etc/xos/xtreemfs/server-repl-plugin/mrc.properties")

    cd "$_pkgname-$pkgver"
    install -d -m 0750 "$pkgdir/etc/xos/xtreemfs"
    install -d -m 0750 "$pkgdir/var/lib/xtreemfs"
    install -d -m 0750 "$pkgdir/var/log/xtreemfs"
    install -d -m 0750 "$pkgdir/etc/xos/xtreemfs/truststore"

    make DESTDIR="$pkgdir/" install-server install-tools

    rm -rf "$pkgdir/etc/init.d"
    rm -f "$pkgdir/etc/xos/xtreemfs/postinstall_setup.sh"

    install -d -m 0755 "$pkgdir/usr/lib/systemd/system/"
    install -m 0644 "$srcdir/xtreemfs-dir.service" "$pkgdir/usr/lib/systemd/system/"
    install -m 0644 "$srcdir/xtreemfs-mrc.service" "$pkgdir/usr/lib/systemd/system/"
    install -m 0644 "$srcdir/xtreemfs-osd.service" "$pkgdir/usr/lib/systemd/system/"

    install -d "$pkgdir/usr/share/licenses/xtreemfs-server"
    mv "$pkgdir/usr/share/doc/xtreemfs-server/LICENSE" "$pkgdir/usr/share/licenses/xtreemfs-server/"
    rm -rf "$pkgdir/usr/share/doc"

    chmod 640 "$pkgdir/etc/xos/xtreemfs/"*.properties
}

package_xtreemfs-client() {
    depends=('attr' 'openssl' 'fuse' 'boost-libs')
    pkgdesc="A fault-tolerant distributed file system for all storage needs (client)"
    backup=("etc/xos/xtreemfs/default_dir")

    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install-client

    rm -rf "$pkgdir/sbin"

    install -d "$pkgdir/usr/share/licenses/xtreemfs-client"
    mv "$pkgdir/usr/share/doc/xtreemfs-client/LICENSE" "$pkgdir/usr/share/licenses/xtreemfs-client/"
    rm -rf "$pkgdir/usr/share/doc"
}
