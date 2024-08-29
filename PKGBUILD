# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=1.0.1
pkgrel=2
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
        "001-zstd-linking.patch"
)
sha512sums=('a327bd8b6c5abce0da971153759785753470041df285f4a8e9b09049d539c7b4b28cc2adfdceb27edb65a96053cfa9e9e0c43f06f129bca0f9f1f0ca8cd06586'
            'dd971c4fa3f1d1003b34e7746117e09beb14db2efbc690bd2dab10b91604dd1c730e5a56cbfeb25d3783851fe48b4b2bd4610bc9f5e4e4e45296ad64c122aef0'
            'a461d9d07531c662861b020d4251d197320c4bdd8f7e532c8e5221c364b815b9be345d18902d818ca528d12ae875a2144aff478ba3a34f2a61cc2bb68908a0b1'
            '58437823be316e9e558dc32c2baa3e59f852e9ffe1459f55177dbad8656b54b98eaef5afe30025cbbc2569156cb6a6e042ae44ed12c1a1bd3db9e25e36a3e63a'
            '05fc22d63a6fec6820bb7bc27b9ff236b4df94d47f9a9a861aedc1e65f656f79805cbdf65bb6e6d6bb344bcbda7121f88bf22b5ad4aca2354209029682a3f7ec'
            'db0ee7f47a300c9f9b0e5bd1da0c10550705bb277457e71f0c0dc78f81823e267f6055aa136ed5d0631411bc144abaef11c32d44d64fcbaf7a2ff39d190b07ee'
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
