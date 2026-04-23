# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.2.4
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
sha512sums=('21e0554a223592fd1aecd02857a48b5d88855338ccb777859ef694445fe2b55a55c1b04d914214b57cee6820e4256e83801c8e11fd747fc26db6734255dd1910'
            'ff95f883569fd525c6e23a61455ae2e69a877436842a84c3eb8684d61d64d7791879ce73c2687e5f6d7b9e2ab494cb096d7518656a0ca7b7752a5424b8f662d0'
            'babfb8a3a7f264d58561e6c4a4664c0eca9b14e3e7b70cf5445301d9e617e4c9176aa2abbed9460bcbd383f09f4b17b27e45e39e963c2f4dfe2beb5390d61e60'
            'd6bf5b25c2134f8877fc80f7db5f9ea51fc8177058947445aaa272c8bcd46902f27841ca7d5352695b8588b969c44591444d7861516180cd660a6d8a7e39bf8c'
            '003e6455ac4f24016ce89cb0a5e1353de947ba1071f99bdb9f323d978e94b320b8402eeb78aa1eb9fef81c73a78666369f6d4c6fccbfd19fe7628c6a649a3ce4'
            '52f1a6004894ffb5f0f206549c197e49b14b863527e334e22ae1166956a3157edc701279c9eaaa432d2b3790161c43c2e98b6c6cc0b4e7bf62360be46f3bc3a9'
            '570a3e7fa0c348f51209c36b59e959711a37bda1517971438d25f166d8d2be6960ad8e753a42f0b314d0a6ae71efccc1be3d8d416741d36a7614583b23a8b0eb'
            '1584d84a5cc07226fa721f147638a3947922f37864ab521fd8052d0f02d7ded6602deee799296b7dc0ccabb89718ad6050ae768c0eec15c3d8d17c93c37f1a49')

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
    export ZSTD_SYS_USE_PKG_CONFIG=1

    cargo build --frozen --release --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname"     -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE"                                    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
