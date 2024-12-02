# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=perfect-dark-git
pkgver=r7572.67675d898
pkgrel=1
pkgdesc='PC port of Perfect Dark'
url='https://github.com/fgsfdsfgs/perfect_dark'
arch=("x86_64")
license=("MIT")
# depends=('cmake' 'gcc' 'glu' 'lib32-sdl2' 'lib32-zlib')
depends=('glu' 'sdl2' 'zlib')
makedepends=('cmake' 'gcc' 'git' 'python')
source=(
    "git+${url}.git"
    "local://pd.ntsc-final.z64"
)
md5sums=(
    'SKIP'
    # This is the MD5 for the recommended ROM, but others are supported, see the upstream Github
    'e03b088b6ac9e0080440efed07c1e40f'
)

pkgver() {
    cd $srcdir/perfect_dark
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/perfect_dark
    git submodule update --init --recursive
    cmake -G"Unix Makefiles" -Bbuild .
}

build() {
    cd $srcdir/perfect_dark
    cmake --build build -j4
}

package() {
    mkdir -p $pkgdir/opt/$pkgname/data
    install -Dm755 $srcdir/perfect_dark/build/pd.x86_64 $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/pd.ntsc-final.z64 $pkgdir/opt/$pkgname/data

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./pd.x86_64" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/perfect-dark
}
