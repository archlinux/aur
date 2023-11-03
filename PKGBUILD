# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=perfect-dark-git
pkgver=r7154.479c0335f
pkgrel=1
pkgdesc='PC port of Perfect Dark'
url='https://github.com/fgsfdsfgs/perfect_dark'
arch=("x86_64")
license=("MIT")
depends=('gcc' 'glu' 'lib32-sdl2' 'lib32-zlib')
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

build() {
    cd $srcdir/perfect_dark
    make -j$(nproc) -f Makefile.port TARGET_PLATFORM=i686-linux
}

package() {
    mkdir -p $pkgdir/opt/$pkgname/data
    install -Dm755 $srcdir/perfect_dark/build/ntsc-final-port/pd.exe $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/pd.ntsc-final.z64 $pkgdir/opt/$pkgname/data

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./pd.exe" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/perfect-dark
}
