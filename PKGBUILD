# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.1.0
pkgrel=2
pkgdesc='A greeter with addition functionalities'
url='https://github.com/neroreflex/login-ng'
license=()
makedepends=('cargo' 'greetd')
depends=()
arch=('i686' 'x86_64' 'armv7h')
source=(
    'login-ng.tar.gz::https://github.com/NeroReflex/login-ng/archive/refs/tags/0.1.0.tar.gz'
    'login_ng.pam'
    'login_ng-autologin.pam'
    'login_ng.rules'
    'login_ng.sysusers'
    'login_ng.service'
    'login_ng.tmpfiles'
)
b2sums=(
    'd8973f8dcb2f49bb74c65ef8fa18e37bc9a808938a83d821ba5231c4213bf5881686607722e491ce1c4dc4e70332e445df7214345b236c71c7677d9e6a50035f' # login-ng.tar.gz
    '0ad4cff08634a22ece4a2a37832ff080fcf57dcea4eb7551535f7068e38f55c6c60886dc9f82e8b8370f3f92bc00c7848a40978fe0493885e6ab6d5fb048bf1a' # login_ng.pam
    'eb8341389e8654ecad5c9608c133f6d5c2c7611c75c97ad0b3244281b7f6d7605757207eaae29b4793fbe2ede9131df5cfe0c144abd52070ee93cf3e88c04974' # login_ng-autologin.pam
    'ce6b01d713277810b2eb64e8437a0b8bea684c0aec6aeb8e5ec4f8bcd37f94e68ab31f3bc70836f3fb61cc3fc1b007c3db68f9f9c86e8742325c4d5caea1f983' # login_ng.rules
    '60571e761369edb44c6a962baa586891aa3d2879187b8dbd0fa99cac8c82a7ed3077e5e214562609e5ce36d9805e27a2c58beffd7b037adcb5e1767345f645f9' # login_ng.sysusers
    '3ecb02ee15a5a01ac63d18227359d866cc7a32476f13a5d06e13dfa27f0eb3eca4e033ec040adc6fa6569de6736e041343f989a0ea905f83f32175e20ef046c8' # login_ng.service
    '22625e6acd4174a0af77650653183ca21765cbb4e7d288fdcf49b13dd61462a789cb1b66b6e815f57047e16a2fb403ec65e19daccff30682565dcede910a84a9' # login_ng.tmpfiles
)
backup=(
    etc/apparmor.d/lightdm-guest-session
    etc/pam.d/lightdm
    etc/pam.d/lightdm-autologin
    etc/pam.d/lightdm-greeter
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo install --root="$pkgdir" --path .
    rm "$pkgdir/.crates2.json"
    rm "$pkgdir/.crates.toml"

    # PAM
    mkdir -p "${pkgdir}"/etc/pam.d
    install -m 644 "${srcdir}"/login_ng.pam "${pkgdir}"/etc/pam.d/login_ng
    install -m 644 "${srcdir}"/login_ng-autologin.pam "${pkgdir}"/etc/pam.d/login_ng-autologin

    # PolicyKit
    mkdir -p "${pkgdir}"/usr/share/polkit-1/rules.d
    install -dm 755 "${pkgdir}"/usr/share/polkit-1/rules.d
    install -m 644 ../login_ng.rules "${pkgdir}"/usr/share/polkit-1/rules.d/login_ng.rules

    # Systemd
    mkdir -p "${pkgdir}"/usr/lib/systemd/system
    mkdir -p "${pkgdir}"/usr/lib/sysusers.d
    mkdir -p "${pkgdir}"/usr/lib/tmpfiles.d
    #install -dm 755 "${pkgdir}"/usr/lib/{systemd/system,sysusers.d,tmpfiles.d}
    install -m 644 ../login_ng.service "${pkgdir}"/usr/lib/systemd/system/login_ng.service
    install -m 644 ../login_ng.sysusers "${pkgdir}"/usr/lib/sysusers.d/login_ng.conf
    install -m 644 ../login_ng.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/login_ng.conf

}
