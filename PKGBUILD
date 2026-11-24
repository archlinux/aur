pkgname=loadlibrary
pkgver=0.2.0
pkgrel=1
pkgdesc="Porting Windows Dynamic Link Libraries to Linux "
url="https://github.com/taviso/loadlibrary"
arch=('x86_64')
license=('GPL2')
depends=("lib32-glibc")
makedepends=("cabextract")
noextract=("mpam-fe.exe")
source=( #"loadlibrary-$pkgver.tar.gz::https://github.com/taviso/loadlibrary/archive/refs/tags/$pkgver.tar.gz"
        "loadlibrary-$pkgver-full.tar.gz::https://github.com/taviso/loadlibrary/releases/download/0.2.0/loadlibrary-0.2.0-full.tar.gz"
        "mpam-fe.exe::http://go.microsoft.com/fwlink/?LinkID=121721&arch=x86")
md5sums=('b2ec07a8b42f3093fdfefe051bd51892'
         '8d0a079bb94cab54ac5fbb05221b7556')

prepare(){
    cd "$srcdir"
    cabextract mpam-fe.exe
}

build(){
    cd $pkgname-$pkgver
    make mpclient
}
 
package() {
    #mkdir -p "$pkgdir/usr/lib/loadlibrary-$pkgver/engine" "$pkgdir/usr/include/loadlibrary"
    install -Dm755 "$srcdir/loadlibrary-$pkgver/build/x86/mpclient" "$pkgdir/usr/lib/loadlibrary/mpclient"
    install -Dm644 "$srcdir/mpengine.dll" "$pkgdir/usr/lib/loadlibrary/engine/mpengine.dll"
    install -Dm644 "$srcdir"/*.vdm "$pkgdir/usr/lib/loadlibrary/engine/"
    install -Dm644 "$srcdir/loadlibrary-$pkgver/peloader"/*.h --target-directory "$pkgdir/usr/include/loadlibrary/"
    install -Dm644 "$srcdir/loadlibrary-$pkgver/build/x86/libpeloader.a" "$pkgdir/usr/lib/"

    mkdir -p "$pkgdir/usr/bin"
    cat >> "$pkgdir/usr/bin/mpclient" << \EOF
#!/usr/bin/sh
cd /usr/lib/loadlibrary
./mpclient "$@"
EOF
    chmod a+x "$pkgdir/usr/bin/mpclient"

}
