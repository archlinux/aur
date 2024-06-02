# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=1.0.0
pkgrel=1
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
sha512sums=('2bc8f8fff670e0ea817f316c0b628cff9c94b088affb9c3076c407270afe665726a81b8dde55ee9035a18f425d9a4221e432eb7712f1b84c04eb1d166616e0dd'
            'c1531249428f04eed7d4764dc7cadc719c24def5d31ba1f1395697c6316d0cd6348c41ef64d832c1457fcff993665667e8559a1d8d564f5a66643a86a514adf1'
            'e76a755a92620b932b55fd5e15b2f86076454fcba4dc5f634af34a21c8ed6dd9f2b5fed204ceb4ddc9f2febb79097ba5212b2a9312c4562dd4e5d3e86e1dda11'
            '2c8d2f594adba95e6534c932161aee7b7b6e01fb33e2adb126f35ca3a20e9e880aecd427930333027d134475100d591f661cd96009982df6906bdc340ab9a9f3'
            'd9ad129291574ca309647944644ffb00a12c77ea495390072b96516cf527db1f674d728adc07fa03a8fabd8b12894012cadb96728319c183915897794aa03efe'
            '6a214399d628033370d3f25e48efcfbbc35339e78d118443ea9817ba3b7374f8640229bd56c12fc8c5848e541797e87ea406bd9e8644873c07464484429a34b3'
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
