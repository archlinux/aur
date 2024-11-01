# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=1.0.2
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
        "android15-6.6_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android15-6.6_kernelsu.ko"
        "001-zstd-linking.patch"
)
sha512sums=('abcd5ca882120a4217707dc2d25e2184f35ff570b3626cfdb9aca15db435fe381bdd266d0a39d5165f40b22e7f5838a3736bcde5a9d2ca019c5df0c3616a397c'
            '54a4f594f49844936d4333581503ca31845f7825c6bf56513e5e0f77680ea75931672f73ab5ce0f554c3bccb8a3e6442340a3fc8f3d681bd97408b11c9887347'
            '41705cd42533e767764c361a8cbde16356b92b97e623b41c25dca2c8dc20c646e13cc4c0b6a14e54829c4b02a5ac5791e6efff6f5b7c6b480d0f3198215b3f44'
            '9d21118d918d710b8476f5b1e62165e567c13e644072ab10a60f046299159b34ddda1a72524d5ef74278b03988f18d7aad3a7e68acb15735270ddaaeff155607'
            '2ee9c3ace3a05a462f6b2ad1395bb1f9e73db5170d900ea16ab31d272a3e50680f6e38328ba4160bbc73da59888b9f2d7fd832bf35ef59abd8adde25da062811'
            '93d6d8f1eba2b78a2718f1a975fbc532a32cbaebfc96cbd3eebfb7d5eeefe9517180aae5bd89301316abc18f18d3c271c33a9650724bf218d7f2da4de2b0b8f5'
            'bbf55b86d1afe280b885351def0aa228dae45718e4cb79f73e2a5ab0c333134604be9ee9ced1993aeca1d8f1a6cfca885b495d37d046b0d4fdb5a735d19b7829'
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
