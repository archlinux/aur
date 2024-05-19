# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=0.9.4
pkgrel=2
pkgdesc='KernelSU userspace cli'
arch=('any')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
makedepends=('cargo')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/$_srcname/archive/v$pkgver.tar.gz"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android12-5.10_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.10_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.15_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-5.15_kernelsu.ko"
        "https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-6.1_kernelsu.ko"
)
sha512sums=('94e68c35118b75b4a5a77940c2a83b1534aed59ee7216fb08dafc3f677a6b47768b44a91749ef470bf59413832acdf230178bc95261c7386d47c784a276d6617'
            '7ca05cef8619fa4804d708e631a749873fc7fbdf91d6b1b314433d70d0087aac8945a9b0b936afe2750ac622b103380f366ccfcc5ecd82e2190c0c701b3a872c'
            'a006dfa7541d04bd0d81803f80cca1cde1e61787c1322e175c46ede3250ca2c2febbd9070f5f476748372f80c676f9dd09e09d8840ee44d58763009ac722b215'
            '8d5c11ec3956dba550168fb66a4d5a8809d8f867e8e3e3174e6f72e1e4669d605d7b96a76b7d71696063c13ea58798dbb632b9225ade4196f446cdc0092adbb2'
            'b2d28ece0c9d0b2772b92aa663926ee1201939c6cd219de00f9edadc5068151425c230a5d04f5f644b5a432259ecb4dffe7b08e018c6e7f3da96091a272703b3'
            'ebf2005ec50c6eadceb3c17b28b6d717b31f8382350fa4e98e71b88b6925db41d62e2298d1a5eed098637536707188f9c0a394e252828a00ec668298ea6945e1')

prepare() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    mv $srcdir/*.ko bin/aarch64
}

build() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
