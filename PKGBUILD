# Maintainer: whoami <whoami@systemli.org>

pkgname=vlang
pkgver=0.1.15
pkgrel=2
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v' 'vlang-git')
source=("v-$pkgver.tar.gz::https://github.com/$pkgname/v/archive/$pkgver.tar.gz"
        "vc-$pkgver.tar.gz::https://github.com/$pkgname/vc/archive/$pkgver.tar.gz")

prepare() {
    cp vc-$pkgver/v.c v-$pkgver/
}

build() {
    cd v-$pkgver
    cc -std=gnu11 -w -o v v.c -lm
    ./v -prod -o v compiler
    # -fPIC -pie required for examples/hot_code_reloading
    make CFLAGS+="-fPIC -pie" thirdparty
}

package() {
    cd v-$pkgver
    install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 v "$pkgdir/usr/lib/vlang"
    cp -a examples "$pkgdir/usr/share/vlang/"
    cp -a thirdparty "$pkgdir/usr/lib/vlang/"
    cp -a vlib "$pkgdir/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}

sha256sums=('832265afc05c4ad18ac26967bb873eea7afff380fb4d5e8a026214a83e2d2e95'
            'e9187de26c67f878ff9de9d1abf1b8705037db6020eb948492d549490e7bea24')
