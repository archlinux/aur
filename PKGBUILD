# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=loadlibrary-git
pkgver=r15.ca6dce8
pkgrel=1
pkgdesc="Porting Windows Dynamic Link Libraries to Linux "
url="https://github.com/taviso/loadlibrary"
arch=('x86_64')
license=('GPL2')
depends=("lib32-glibc")
source=("loadlibrary::git+https://github.com/taviso/loadlibrary.git"
        "mpam-fe.exe::http://go.microsoft.com/fwlink/?LinkID=121721&arch=x86")
md5sums=('SKIP'
         'b385d0d1f931f269988fef14dc9fa27a')

pkgver(){
    cd loadlibrary
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd loadlibrary
    make
}
 
package() {
    mkdir -p "$pkgdir/usr/lib/loadlibrary/engine"
    install -m755 "$srcdir/loadlibrary/mpclient" "$pkgdir/usr/lib/loadlibrary/mpclient"
    install -m644 "$srcdir/mpengine.dll" "$pkgdir/usr/lib/loadlibrary/engine/mpengine.dll"
    install -m644 "$srcdir"/*.vdm "$pkgdir/usr/lib/loadlibrary/engine/"

    mkdir -p "$pkgdir/usr/bin"
    cat >> "$pkgdir/usr/bin/mpclient" << \EOF
#!/usr/bin/sh
cd /usr/lib/loadlibrary
./mpclient "$@"
EOF
    chmod a+x "$pkgdir/usr/bin/mpclient"

}
