# Maintainer: whoami <whoami@systemli.org>
# Contributor: Jefferson <jgmdev@gmail.com>

pkgname=vlang-git
pkgver=r76.b6948ad
pkgrel=4
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
makedepends=('git')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v' 'vlang')
source=('git+https://github.com/vlang/v.git'
        'https://vlang.io/v.c')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd v
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mv v.c v/compiler/
    cd v && current_dir=$(pwd)
    cd compiler
    sed -i \
        "s|os__home_dir(), tos2(\"/code/v/\")|tos2(\"${current_dir}\"), tos2(\"/\")|g" \
        v.c
    sed -i \
        "s|mut lang_dir = os.home_dir() + '/code/v/'|mut lang_dir = '/usr/lib/vlang'|g" \
        main.v
}

build() {
    cd v/compiler
    #make # segfault -std=c11
    cc -std=gnu11 -w -o vc v.c
    ./vc -o v .
}

package() {
    cd v
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 compiler/v "$pkgdir/usr/bin/v"
    install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang"
    cp -a examples "$pkgdir/usr/share/vlang/"
    cp -a * "$pkgdir/usr/lib/vlang/"
    rm -r "$pkgdir/usr/lib/vlang/"{LICENSE,README.md,compiler,examples}
}

