pkgname=loadlibrary
pkgver=0.1.0
pkgrel=1
pkgdesc="Porting Windows Dynamic Link Libraries to Linux "
url="https://github.com/taviso/loadlibrary"
arch=('x86_64')
license=('GPL2')
depends=("lib32-glibc")
makedepends=("cabextract")
noextract=("mpam-fe.exe")
source=("loadlibrary-$pkgver.tar.gz::https://github.com/taviso/loadlibrary/archive/refs/tags/$pkgver.tar.gz"
        "mpam-fe.exe::http://go.microsoft.com/fwlink/?LinkID=121721&arch=x86")
md5sums=('11e89979746b5b2374a781f2032dd204'
         'SKIP' # ever changing checksum…
         )

prepare(){
    cd "$srcdir"
    cabextract mpam-fe.exe
}

build(){
    cd $pkgname-$pkgver
    make
}
 
package() {
    #mkdir -p "$pkgdir/usr/lib/loadlibrary-$pkgver/engine" "$pkgdir/usr/include/loadlibrary"
    install -Dm755 "$srcdir/loadlibrary-$pkgver/mpclient" "$pkgdir/usr/lib/loadlibrary/mpclient"
    install -Dm644 "$srcdir/mpengine.dll" "$pkgdir/usr/lib/loadlibrary/engine/mpengine.dll"
    install -Dm644 "$srcdir"/*.vdm "$pkgdir/usr/lib/loadlibrary/engine/"
    install -Dm644 "$srcdir/loadlibrary-$pkgver/peloader"/*.h --target-directory "$pkgdir/usr/include/loadlibrary/"
    install -Dm644 "$srcdir/loadlibrary-$pkgver/peloader/libpeloader.a" "$pkgdir/usr/lib/"

    mkdir -p "$pkgdir/usr/bin"
    cat >> "$pkgdir/usr/bin/mpclient" << \EOF
#!/usr/bin/sh
cd /usr/lib/loadlibrary
./mpclient "$@"
EOF
    chmod a+x "$pkgdir/usr/bin/mpclient"

}
