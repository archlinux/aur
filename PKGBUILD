# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=1.0.3
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
sha512sums=('c973e0294b6a6644028cd233ce357782c19e81057d8522e70ddeaa3d3b44c923c3bb8e72838c17147ce044dc18b3e10fddc7dd3e218e4202d17314d77449123c'
            'c5758c7e6c5532fcacb780d136b45e03b28dbb7b9fb8aa388d3966b9e87801029840573f88799e87278bcd8f66e15e52a5133a8ff4b625906a214feb438a1cc0'
            '262a89f9f0854868bf97e7735265dd19252d50d69bca0ed36b21a159c7fd43ff406c215ad46cdb1c18e31de0ed3b6d1797aaad5c4c4b582ddd9d804e601767d5'
            '68c3b1ab2af28a188cec92be9fceaee3d6d768df4b6b0100a2967d0122b7868ae78b7d0e688b2784a642cec9ff0058bb7423b1084f16fff690b1c5b9faac4a9a'
            'd838abfe7a56c2054d123946172cbdb2a957197384dfea7743f40e8139bd93c22129168be7aa689b91e5a3cb200b060566ffd85df5e3294bd37de1413a566516'
            '42cd819fa5e8afafddd942cce24c91289fb2553ffd9bfa7ffe66f81cbb1998dcd56c502c57daf8f568b23538b61d4bb49dbb635343db67673f1afc14896f3c2e'
            'b34213483876e601eae59c318cbd2ab13f4ba80c0009f634e478ff3999bd6030eca885245e5fab73ed3d9f2615ad55e1a4e6f473696e2a8fa666c83f7692b7a5'
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
