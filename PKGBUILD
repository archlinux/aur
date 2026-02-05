# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.1.0
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
        "android16-6.12_kernelsu_$pkgvar.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android16-6.12_kernelsu.ko"
)
sha512sums=('decc536e3c01f32c0de3449a8de613d58ba8267b498dfd08b545ab52cebdffd675ad29c4cf34448f418524da3308a0c45cb88d2819bf6f64059a95790182d6ae'
            'ff8eac94baed4f40eac9441e1e407fb71587e0a02a80c6352f5b52cf88875829d44fe8c22f7a09f479446811fa3249c513a72c2a037ca41350369c0a8b24b654'
            '02ecfbd78bff9b14634d4799736ff085d8a3642a45a74a4908820622422a9d535b2dc937b491c119864b20d95a17a3297725c2de759d6a96a4c8d740b6143fef'
            'f5326cffe37ed117da81e1e77074e5e4b4dacacfbc2f9f1cc249995b2add43e94047013a8883a7b1ccce001ddef341dc425b040e60acf3e69a7b758fdb5fd821'
            'b255ef1109c77af83846d8cfaf41ef98c52ccd9b959ccd070d67f3220067b63bff7f5f293df9a20a56a5943d77f93ca15a58d7c751030593ad48a2a917fcf6d8'
            'fd815c95d89efdff303f0b4a36a1f22105068c162e29b48bc44d23b2af3f0f27f843a6c72a9fabc82eee0f04c1b12bd225777c7682ea927ec870e2b4dd2cc95d'
            'e40dfaa06e190208b0bec288f214d9a305760bdb222f27dd65ed9f3420e0d985ce5c9aa006eda8b4258e8d8c70f46e585d852c6565cc5a50d48778d7623505bc'
            '624050fc957f78c9f8c4c1318a9f4a342bc0b1b6211055cb1edc87bf7a1e4f08fda9f51d5df0012f782d24e2327b104bdc741482ecb8d13cbefa85a55408d7c6')

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

    cargo build --frozen --release --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname"     -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE"                                    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
