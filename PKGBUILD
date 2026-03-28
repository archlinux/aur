# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.2.2
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
        "android16-6.12_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/android16-6.12_kernelsu.ko"
)
sha512sums=('9c087ece106bba8ace592c8520468da0bf4aa09d982e14c3a2383ea8bc196284b389ce1a5baaeafa0ac00a71eddf27204bda507a596c3aca2d881439942cf955'
            'cf09884862b80b1e189756219fe0398ce816a891f992ec3a5b54c8c881c4d0a4b84dea7463118d1a6cd32c9fd2bf0bdb348f4d7ce20d7d8924c7b2f11060570c'
            'e48ca6b95d77d31b13b28970efd14765245c0f613908cffa7a9d0e796b32c1a238c74e85640d063d540024875a3839677572a2946eb9cb3e239096f170104f02'
            'e5fe9801062ff34ba21faf1338f8c9ad5d804b6796b36e82f4a7d8f863671a54c131f3337225d131f321f3148e8019df577535479802e8a5af85bede766bf7f9'
            '58be6fa968d5bcd44600a12bb2cee0339ed8784ec80b30177b29290347a0cca5b492cff6c821b3e1c09ed70775fb44dc5eabe2705eab1e22d96c40f0722dec23'
            'bd59a26a9c0a0ec524a6f3ef554ea821c8677e9a067a2021d9458358b67d6dc42c7b58a1de27d45a429e3afbab022f4925dedd15ba7a07a466e8e2dabc66485a'
            '8c92ac01452a2f90263fe89b8f6b5318de4b64ee21a87bcbcf86c3cd4e41d9ca05977c9f37a4a0411ce7fc16f24d046da20a0f41b0a816b96f3c47fee5c81e19'
            '9174dc9abc75f72d5c3f311380248e7a267802a633dd08bb7cb6b57f303590cd65ba905e510807287a57af535f4aab2d193eb305688f77ab55460a79f6e01928')

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
