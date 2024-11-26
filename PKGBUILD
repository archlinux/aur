# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.1.3
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url='https://github.com/neroreflex/login-ng'
license=()
makedepends=('cargo' 'greetd')
depends=()
arch=('i686' 'x86_64' 'armv7h')
source=(
    "login-ng-${pkgver}.tar.gz::https://github.com/NeroReflex/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
    'login_ng.pam'
    'login_ng-autologin.pam'
    'login_ng.rules'
    'login_ng.sysusers'
    'login_ng.service'
    'login_ng.tmpfiles'
)
b2sums=(
    '6fd1a2223205b09e738532cf240ab24f0b76c624da67aac914353b284266eafe01611810552a45845cc9bc8cf22f4b8f542afe2b9811032a87e8a9660cbc192d' # login-ng-${pkgver}.tar.gz
    '0ad4cff08634a22ece4a2a37832ff080fcf57dcea4eb7551535f7068e38f55c6c60886dc9f82e8b8370f3f92bc00c7848a40978fe0493885e6ab6d5fb048bf1a' # login_ng.pam
    '71538bbae869b04f01dd214ae21879ca8be20dfc253fda866d197f0bf4c58ddf2e99b2f55438d9f0f885133ee1fc3afa4258b107447eb37b1dc6cfe5223299c7' # login_ng-autologin.pam
    'ce6b01d713277810b2eb64e8437a0b8bea684c0aec6aeb8e5ec4f8bcd37f94e68ab31f3bc70836f3fb61cc3fc1b007c3db68f9f9c86e8742325c4d5caea1f983' # login_ng.rules
    '60571e761369edb44c6a962baa586891aa3d2879187b8dbd0fa99cac8c82a7ed3077e5e214562609e5ce36d9805e27a2c58beffd7b037adcb5e1767345f645f9' # login_ng.sysusers
    '3ecb02ee15a5a01ac63d18227359d866cc7a32476f13a5d06e13dfa27f0eb3eca4e033ec040adc6fa6569de6736e041343f989a0ea905f83f32175e20ef046c8' # login_ng.service
    '22625e6acd4174a0af77650653183ca21765cbb4e7d288fdcf49b13dd61462a789cb1b66b6e815f57047e16a2fb403ec65e19daccff30682565dcede910a84a9' # login_ng.tmpfiles
)
backup=(
    etc/pam.d/login_ng
    etc/pam.d/login_ng-autologin
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

    cargo install --root="$pkgdir/opt/login-ng" --path .
    rm "$pkgdir/opt/login-ng/.crates2.json"
    rm "$pkgdir/opt/login-ng/.crates.toml"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/login-ng/bin/login-ng_ctl" "$pkgdir/usr/bin/login_ng-ctl"
    ln -s "/opt/login-ng/bin/login-ng_cli" "$pkgdir/usr/bin/login_ng-cli"

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
