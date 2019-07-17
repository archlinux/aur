# Maintainer: whoami <whoami@systemli.org>
# Contributor: Jefferson González <jgmdev@gmail.com>
# Contributor: Chloe Kudryavtsev <toast@toastin.space>

pkgname=vlang-git
pkgver=r603.3f50671
pkgrel=1
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
makedepends=('git')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v' 'vlang')
source=('git+https://github.com/vlang/v.git'
        'git+https://github.com/vlang/vc.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd v
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp vc/v.c v/
}

build() {
    cd v
    make v thirdparty
    ./v -prod -o v compiler
}

package() {
    cd v
    install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 v "$pkgdir/usr/lib/vlang"
    cp -a examples "$pkgdir/usr/share/vlang/"
    cp -a thirdparty "$pkgdir/usr/lib/vlang/"
    cp -a vlib "$pkgdir/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}
