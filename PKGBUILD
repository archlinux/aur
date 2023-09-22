# Maintainer: Lennart Eichhorn <lennart@madmanfred.com>

pkgname="upload"
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple tool for uploading files to the internet"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Zebreus/upload"
license=('GPL3')
depends=('openssl' 'gcc-libs')
makedepends=('git' 'ruby-ronn')
source=("git+https://github.com/Zebreus/upload.git#tag=v$pkgver")
md5sums=('SKIP')

prepare(){
    cd "$srcdir/upload"
    
    # download submodules
    git submodule init
    git submodule update
}

package(){
    cd "$srcdir/upload"
    
    # compile sources
    make dynamic INSTALL_PLUGIN_DIR=/usr/lib/upload
    
    # generate manpage
    ronn upload.ronn --roff
    
    # move executable into correct directory
    mkdir -p "$pkgdir/usr/bin"
    install -m 0755 -t "$pkgdir/usr/bin" "build-dynamic/upload"
    
    # move plugins into correct directory
    mkdir -p "$pkgdir/usr/lib/upload/"
    install -m 0755 -t "$pkgdir/usr/lib/upload/" "build/liboshi.so"
    install -m 0755 -t "$pkgdir/usr/lib/upload/" "build/libtransfersh.so"
    install -m 0755 -t "$pkgdir/usr/lib/upload/" "build/libnullpointer.so"
    
    # install manpage
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -m 0644 -t "$pkgdir/usr/share/man/man1" "upload.1"
}
