# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=1.0.5
pkgrel=1
pkgdesc='KernelSU userspace cli'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
depends=('magiskboot-bin')
makedepends=('cargo')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/$_srcname/archive/v$pkgver.tar.gz"
        "android12-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android12-5.10_kernelsu.ko"
        "android13-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.10_kernelsu.ko"
        "android13-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android13-5.15_kernelsu.ko"
        "android14-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-5.15_kernelsu.ko"
        "android14-6.1_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android14-6.1_kernelsu.ko"
        "android15-6.6_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android15-6.6_kernelsu.ko"
        "001-zstd-linking.patch"
)
sha512sums=('3ea83e0b6da6068eb39e13faf7effcab94555c677a12569341094b207b169ca5c97737f076a7b3654084e371e3bd455c11144bbd3352ef09091a6d2f587bdf34'
            'b59368087e7eb492a170c4fc516b286c22f76d7b19b5fce509d8bfb95c20141413e9c77bfe06da1ed5aee8d3dae2f27aa67724d1d4d94802fc66251c402c497b'
            '1d496a76986fce55bdab7a33bd5cab7ae60efdef93f6d2cda93e39cac22d8c870423bc8ec5b96a1f4fd8081d5d71ac088cd0bd38e755672ff0759ad63fc2c19f'
            '077f19badde64dad784d6f1e4f213d10fdd21ec816412bb5a2a66ce665dc9d23a75853c2202eb351b872c92a1f88b7a50612699dab5e0e156d274de9c57fdeed'
            'ea17f464e6ce5b76322be3800b30228d1c2caaa51b31cde08d06439968bb30e7e3448c4bb78d26a2bf662878eecf2dab34ee54d154fd7bd637a42ca9cc673111'
            'bdeeff0069d5956da0de0c0f78913a816d5a1decb9dcc8ffb55b56d144b1baa12b0d6abe88b95227290232924577ed8761c73679f14d9f58bd5ac2e256d1d038'
            'b76557a5053b50a0ce70bd44036051944b7acf13f176c3ad4e4269f10638ef4c3bdfe97272dede27615b5094d6145661f3ab93ee9ef46a632f36fabdbb8bec7b'
            '1199b6dfd4ecbaf340c2ddf141a2034b3d5f1bee02557d1870b7605890fee29053a0dee10c1a0657d0e07d618fa92ec0d9a6da46d515d00c0f2e7b65f78f6b5c')

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
    patch < $srcdir/001-zstd-linking.patch
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
