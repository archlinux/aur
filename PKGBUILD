# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=loadlibrary-git
pkgver=r49.643a6a0
pkgrel=2
pkgdesc="Porting Windows Dynamic Link Libraries to Linux "
url="https://github.com/taviso/loadlibrary"
arch=('x86_64')
license=('GPL2')
depends=("lib32-glibc")
makedepends=("cabextract" "lib32-gcc-libs")
noextract=("mpam-fe.exe")
source=("loadlibrary::git+https://github.com/taviso/loadlibrary.git"
        "mpam-fe.exe::http://go.microsoft.com/fwlink/?LinkID=121721&arch=x86")
md5sums=('SKIP'
         'SKIP' # ever changing checksum
         )

pkgver(){
    cd loadlibrary
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "$srcdir"
    cabextract mpam-fe.exe
}

build(){
    cd loadlibrary
    make
}
 
package() {
    mkdir -p "$pkgdir/usr/lib/loadlibrary/engine" "$pkgdir/usr/include"
    install -m755 "$srcdir/loadlibrary/mpclient" "$pkgdir/usr/lib/loadlibrary/mpclient"
    install -m644 "$srcdir/mpengine.dll" "$pkgdir/usr/lib/loadlibrary/engine/mpengine.dll"
    install -m644 "$srcdir"/*.vdm "$pkgdir/usr/lib/loadlibrary/engine/"
    install -m644 "$srcdir/loadlibrary/peloader"/*.h "$pkgdir/usr/include/"
    install -m644 "$srcdir/loadlibrary/peloader/libpeloader.a" "$pkgdir/usr/lib/"

    mkdir -p "$pkgdir/usr/bin"
    cat >> "$pkgdir/usr/bin/mpclient" << \EOF
#!/usr/bin/sh
cd /usr/lib/loadlibrary
./mpclient "$@"
EOF
    chmod a+x "$pkgdir/usr/bin/mpclient"

}
