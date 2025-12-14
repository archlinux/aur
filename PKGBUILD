# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.0.0
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
sha512sums=('c2c6a88b594e2995896a82c631fa37084cd95c29a5853bde8d167873fac27229a453c21a19f7bb15dc407c1f80308582d1b6bb6ba738614fa97f34ba4115951d'
            '7f981dbb2f8429196a85e83cb598f5140a7fa9856f2c0afcfa0ddf242c1bd94231068a269b611061d665946dd2f0dc29e6877fd203f1669891afe48f304c2f00'
            'd73d14aed5c64104f499d58874a32c86bcf8c0bb354903bfcc0a7818c547944166badf884a6700d4e22c33cd5fa5b757bd812f5b06c96d899ff2a6f448506c58'
            'a8ed3b9c70278380d54d15373eb09cb1f73e4d1b6fc718eba75da45fa087412175a67762155f12760ba4199a94bff4dc0a381d0b5835faf73726a3ded4291a68'
            '954f5875365a07c340bffda6a2977a5343eeaff63a383dc2a06f0cf856937e80d1ff5877165cbeeda2cbde3e4540162df02f616fced1d7c14039eb9c8d939af2'
            '1d52abbf3aecd43c1e69207f966e8cfdc6c7cfef02361f4c86756005fcd87c9dcf2388b9035da94b010e6b14dbf9f6075bbd1fe1446b9beba1dde72b2edd87f7'
            '6616f00ad8264ef4249540efef80e8e2a7d34377ad79cca9011a3920f6938f5c9179315a8db0b00fa2bdd46531a9c1fa100f66ae4b3a1413a858fb847579c50a'
            '4a9397c759b9b7ec6af4fbd392e828c197a4917536195979780da9edd2abec5d77e4e384997526bbf20a643892ab864bff3a5d94d8c372ba9ca0d254371d61eb')

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
