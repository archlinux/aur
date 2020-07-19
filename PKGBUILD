# Maintainer: Logan Magee <mageelog@gmail.com>

_pkgname=v
pkgname=vlang
pkgver=0.1.28.1
pkgrel=1
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v' 'vlang-git')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$_pkgname/archive/$pkgver.tar.gz"
        'git+https://github.com/vlang/vc'
        'no-compile.patch')
md5sums=('76eca181facc25d807883e02e3ee1789'
         'SKIP'
         '8e663d8b721620e9fa1fe234757df3ed')

prepare() {
    cd vc
    git checkout 197b42bd0e9268ec7c3c16526edc8530ad90a075

    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i ../../no-compile.patch
}

build() {
    cd $_pkgname-$pkgver
    cc -std=gnu11 $CFLAGS -w -o v ../vc/v.c -lm $LDFLAGS
    ./v -prod self

    for tool in cmd/tools/*.v; do
        ./v $tool
    done
}

package() {
    cd $_pkgname-$pkgver
    install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 v "$pkgdir/usr/lib/vlang"
    cp -a cmd "$pkgdir/usr/lib/vlang/"
    cp -a examples "$pkgdir/usr/share/vlang/"
    cp -a thirdparty "$pkgdir/usr/lib/vlang/"
    cp -a vlib "$pkgdir/usr/lib/vlang/"
    cp v.mod "$pkgdir/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}
