# Maintainer: Logan Magee <mageelog@gmail.com>

_pkgname=v
pkgname=vlang
pkgver=0.1.28.1
pkgrel=5
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'libcurl.so')
makedepends=('git')
conflicts=('v' 'vlang-bin' 'vlang-git')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$_pkgname/archive/$pkgver.tar.gz"
        'git+https://github.com/vlang/vc'
        'no-compile.patch')
sha256sums=('cbaded862d56d943c119630bf13974ef4370bb7fff533d244c9f42f7f5c5f3ad'
            'SKIP'
            'dde72b11b4ba5b1365b64d99d4256970b84c4d0e80b15f55a1765ea39977ce42')

prepare() {
    cd vc
    git checkout 197b42bd0e9268ec7c3c16526edc8530ad90a075

    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i ../../no-compile.patch
}

build() {
    cd $_pkgname-$pkgver
    cc -std=gnu11 $CFLAGS -w -o v ../vc/v.c -lm $LDFLAGS
    ./v install markdown
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
