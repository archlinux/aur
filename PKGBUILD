# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.2.5
pkgrel=2
pkgdesc='KernelSU userspace cli'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
depends=('magiskboot-bin' 'zstd')
makedepends=('cargo')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/$_srcname/archive/v$pkgver.tar.gz"
        "android12-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android12-5.10_kernelsu.ko"
        "android13-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.10_kernelsu.ko"
        "android13-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.15_kernelsu.ko"
        "android14-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-5.15_kernelsu.ko"
        "android14-6.1_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-6.1_kernelsu.ko"
        "android15-6.6_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android15-6.6_kernelsu.ko"
        "android16-6.12_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android16-6.12_kernelsu.ko"
)
sha512sums=('c5a0104bb90c663a8039f267f0e973e1aa9320f5157a4bb559b3eee42e55603f5f90be79c12cc9dcaaa949a3aa59ea1c03a9a45dcbcce5f818d3f9e1def95f78'
            '3b6b1673eaf85cb7e995ee6ff7d06a0d5b2a9c6a0447c6a8a358994b1fa340f9d51f7e843f3d60f187c8d6cc014a6486b3ba4ad3dc920005210d65cb0af19899'
            '960017b4d6a84a8de2b16d7ae320bb06c5e9d9ab927927eed974f6c80430f54d578d8c6eb846d9255c6a3bc167701d009cce26f464ba873e803a41cbc12eb957'
            '6d5cdf2246714bbbc94537ccefdb231c8c8a5e787bb242b3948f3d73066f5c4991da9c8ea6743770124ab3cd24cfd1c6b5fa0d53d6c94daf332c236ea0d2e997'
            '075009af7a1283c24b0accbb6de3a90bdcf13b975ef09633a443395ee5b8d54581d463871046c52c1e4192bcbe1b6a2bf5d4383a6fc2ab5414813d56e4d4ffef'
            '14681da81a1a904ac97be98d7df7914e90a50d380878ab8fa12b7f46caf2225fde125f732e4fb03ec25d4d68501d6908558628088b3212135fb6f2ffe7831d0e'
            '72ff9e6f5f217196163fe45333d477f1f4d2835e495bc3b42dc6d0561434c477296c2eca3d40b6f6597a75d10847ae8a4b589695801329537db6873580f3aa96'
            '295037676bf87e897f30eb4c4a3d56aa3caa7ffa36b8da04c16e9c1087093a98adf6fb69c559c8132064d0258cea9923d67d1755c2e3afeef2d043ce1eb9eaf2')
options=(!lto)

prepare() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    for ko in $srcdir/*.ko; do
        _ko=${ko##*/}
        _ko=${_ko%_$pkgver.ko}
        install -v -Dm644 "$ko" "bin/aarch64/$_ko.ko"
        unset _ko
    done
}

build() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # workaround: static linking to Rust crate `zstd-sys`'
    # vendored `libzstd.a` library will cause some issue when
    # `options=(lto)` is turned on, so we link dynamically
    # to system zstd library to prevent this from happening
    ## disabled due to the `lz4-sys` does not give us an option
    ## to use system lz4 library, so currently we disable lto
    ## to avoid all the linking issue
    # export ZSTD_SYS_USE_PKG_CONFIG=1

    cargo build --frozen --release --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname"     -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE"                                    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
