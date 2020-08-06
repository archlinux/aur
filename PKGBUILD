# Maintainer: Logan Magee <mageelog@gmail.com>

_pkgname=v
pkgname=vlang
pkgver=0.1.29
pkgrel=1
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
sha256sums=('5111d04663d8454c9e8bcbd7e3544dcbd6abc54eb5034e31649417af6e8418a6'
            'SKIP'
            '4281ae82a72cfb5632d41d87043076b214dcda3bb8bfc03244dd35d322435bc4')

prepare() {
    cd vc
    git checkout b01d0fcda4b55861baa4be82e307cca4834b1641

    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i ../no-compile.patch
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
