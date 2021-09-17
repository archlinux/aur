# Maintainer: Logan Magee <mageelog@gmail.com>

_pkgname=v
pkgname=vlang
# Package maintainer(s): remember to update the commit for vc in prepare()
pkgver=0.2.4
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'openssl')
makedepends=('git')
conflicts=('v' 'vlang-bin' 'vlang-git')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$_pkgname/archive/$pkgver.tar.gz"
        'git+https://github.com/vlang/vc')
sha256sums=('8cdbc32fb928051ce7959dd943af3efee26bddc4ed3700a1cb365be73a306bf9'
            'SKIP')

prepare() {
    cd vc
    git checkout fd5f57740ff6d7a8566b774318df54c2fa460f92 # 0.2.4
}

build() {
    cd $_pkgname-$pkgver
    cc -std=gnu11 -w -o v ../vc/v.c -lm $LDFLAGS
    ./v -prod self
    ./v build-tools
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

    touch "$pkgdir/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}
