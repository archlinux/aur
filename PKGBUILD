pkgname=crate
pkgver=0.49.5
pkgrel=1
pkgdesc="shared nothing, fully searchable, document oriented cluster datastore."
arch=('any')
url='http://crate.io'
license=('custom:APACHE')
depends=('java-runtime')
install='crate.install'
source=(https://cdn.crate.io/downloads/releases/$pkgname-$pkgver.tar.gz
        crate.service)

backup=('etc/crate/crate.yml'
        'etc/crate/logging.yml')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # create dirs
    install -dm755 "$pkgdir/usr/share/$pkgname/"
    install -dm755 "$pkgdir/etc/$pkgname/"
    install -dm755 "$pkgdir/var/lib/$pkgname/"
    install -dm755 "$pkgdir/var/log/$pkgname/"

    if [ $CARCH = 'x86_64' ]; then
        install -Dm644 lib/sigar/libsigar-amd64-linux.so "$pkgdir/usr/share/crate/lib/sigar/libsigar-amd64-linux.so"
    else
        install -Dm644 lib/sigar/libsigar-x86-linux.so "$pkgdir/usr/share/crate/lib/sigar/libsigar-x86-linux.so"
    fi
    cp lib/sigar/sigar*.jar "$pkgdir/usr/share/crate/lib/sigar/"
    cp lib/*.jar "$pkgdir/usr/share/crate/lib/"

    cp config/* $pkgdir/etc/$pkgname
    cp -r {bin,plugins} $pkgdir/usr/share/crate

    # documentation
    install -dm755 $pkgdir/usr/share/doc/$pkgname/
    cp LICENSE.txt $pkgdir/usr/share/doc/$pkgname/LICENSE
    cp NOTICE $pkgdir/usr/share/doc/$pkgname/NOTICE
    cp CHANGES.txt $pkgdir/usr/share/doc/$pkgname/CHANGES

    install -Dm644 "$srcdir/crate.service" "$pkgdir/usr/lib/systemd/system/crate.service"
    # sphinx generated text docs
    if [ -d docs ]; then
        cp -r docs/ $pkgdir/usr/share/doc/$pkgname/
    fi
}
md5sums=('61163b8ffbab70aae50afe0d1889396f'
         '9f06bbc1eb35031a09f25b47e7d145eb')
