# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=0.9.4
pkgrel=6
pkgdesc='KernelSU userspace cli'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'unzip')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/$_srcname/archive/v$pkgver.tar.gz"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android12-5.10_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.10_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.15_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-5.15_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-6.1_kernelsu.ko"
        # For libmagiskboot.so
        "https://github.com/topjohnwu/Magisk/releases/download/v27.0/Magisk-v27.0.apk"
)
sha512sums=('94e68c35118b75b4a5a77940c2a83b1534aed59ee7216fb08dafc3f677a6b47768b44a91749ef470bf59413832acdf230178bc95261c7386d47c784a276d6617'
            '7ca05cef8619fa4804d708e631a749873fc7fbdf91d6b1b314433d70d0087aac8945a9b0b936afe2750ac622b103380f366ccfcc5ecd82e2190c0c701b3a872c'
            'a006dfa7541d04bd0d81803f80cca1cde1e61787c1322e175c46ede3250ca2c2febbd9070f5f476748372f80c676f9dd09e09d8840ee44d58763009ac722b215'
            '8d5c11ec3956dba550168fb66a4d5a8809d8f867e8e3e3174e6f72e1e4669d605d7b96a76b7d71696063c13ea58798dbb632b9225ade4196f446cdc0092adbb2'
            'b2d28ece0c9d0b2772b92aa663926ee1201939c6cd219de00f9edadc5068151425c230a5d04f5f644b5a432259ecb4dffe7b08e018c6e7f3da96091a272703b3'
            'ebf2005ec50c6eadceb3c17b28b6d717b31f8382350fa4e98e71b88b6925db41d62e2298d1a5eed098637536707188f9c0a394e252828a00ec668298ea6945e1'
            'cf6095f2d93e078f42d26265699deed377af12f304dd83179140d32a69a034639d4e07b83b8bb999d503f6d8dc6ced46b6b88741ed39771eed6a12411648e4bc')

prepare() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    declare -A ARCH_MAP
    ARCH_MAP=( [i686]="x86" [x86_64]="x86_64" [armv7h]="armeabi-v7a" [aarch64]="arm64-v8a" )

    yes|unzip "$srcdir/Magisk-v27.0.apk" "lib/${ARCH_MAP[$CARCH]}/libmagiskboot.so" -d "$srcdir/Magisk-v27.0"
    install -v -Dm755 "$srcdir/Magisk-v27.0/lib/${ARCH_MAP[$CARCH]}/libmagiskboot.so" "bin/aarch64/magiskboot"

    for ko in $srcdir/*.ko; do 
        install -v -Dm644 "$ko" -t "bin/aarch64"
    done
}

build() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname"     -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE"                                    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
