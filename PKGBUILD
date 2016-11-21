pkgname=crate
pkgver=0.56.4
pkgrel=1
pkgdesc="shared nothing, fully searchable, document oriented cluster datastore."
arch=('any')
url='http://crate.io'
license=('custom:APACHE')
depends=('java-runtime')
install='crate.install'
source=(https://cdn.crate.io/downloads/releases/$pkgname-$pkgver.tar.gz
        crate.service
        crate)

backup=('etc/crate/crate.yml'
        'etc/crate/logging.yml')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # create dirs
    install -dm755 "$pkgdir/etc/$pkgname/"
    install -dm755 "$pkgdir/var/log/$pkgname/"
    install -dm755 "$pkgdir/usr/share/$pkgname/"
    cp -R bin lib plugins "$pkgdir/usr/share/$pkgname/"

    rm $pkgdir/usr/share/$pkgname/plugins/sigar/lib/*
    cp plugins/sigar/lib/*.jar $pkgdir/usr/share/$pkgname/plugins/sigar/lib/

    if [ $CARCH = 'x86_64' ]; then
        install -Dm644 plugins/sigar/lib/libsigar-amd64-linux.so "$pkgdir/usr/share/crate/plugins/sigar/lib/libsigar-amd64-linux.so"
    else
        install -Dm644 plugins/sigar/lib/libsigar-x86-linux.so "$pkgdir/usr/share/crate/plugins/sigar/lib/libsigar-x86-linux.so"
    fi

    cp config/* $pkgdir/etc/$pkgname

    # documentation
    install -dm755 $pkgdir/usr/share/doc/$pkgname/
    cp LICENSE.txt $pkgdir/usr/share/doc/$pkgname/LICENSE
    cp NOTICE $pkgdir/usr/share/doc/$pkgname/NOTICE
    cp CHANGES.txt $pkgdir/usr/share/doc/$pkgname/CHANGES

    install -Dm644 "$srcdir/crate" "$pkgdir/etc/conf.d/crate"
    install -Dm644 "$srcdir/crate.service" "$pkgdir/usr/lib/systemd/system/crate.service"
    # sphinx generated text docs
    if [ -d docs ]; then
        cp -r docs/ $pkgdir/usr/share/doc/$pkgname/
    fi
}
md5sums=('f0cd3a137047754c87b449b1ec08b02c'
         '2085d9af9e9ef3e27e8067a793eb9e39'
         '763950135dadfc3f72d8c9abec71aa5a')
