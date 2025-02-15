# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.1.10
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
    'da0e562d7cc012914a3fd3c538832dd198e2312313b850aab578242ddcb8da5e3fb9252623ca61c4f8dab712bece8b9d789286bda5f5a93683aa56b51ac1609b' # login-ng-${pkgver}.tar.gz
    'bd43f7f7071d40dbf6d461fec131cfcc76ba572d6cf88c7836eab9cd2f3ec948f04f8dd887925c6d4a36ed330c7400e37442c6832a872785dd74c6ca66d49122' # login_ng.pam
    '14ae12933100fe170459d3f918abdce33634780e71da5ac5121b361fae48d5d5ce2d349e9736e52a0e6e76cb716c020472c68d1e3fb9b973e47e758ebb3517cd' # login_ng-autologin.pam
    'ce6b01d713277810b2eb64e8437a0b8bea684c0aec6aeb8e5ec4f8bcd37f94e68ab31f3bc70836f3fb61cc3fc1b007c3db68f9f9c86e8742325c4d5caea1f983' # login_ng.rules
    '60571e761369edb44c6a962baa586891aa3d2879187b8dbd0fa99cac8c82a7ed3077e5e214562609e5ce36d9805e27a2c58beffd7b037adcb5e1767345f645f9' # login_ng.sysusers
    '35060732db4f48a8c19cae4e52e6208c8087e78a76bc670ff25b670dc2e5f11762130ba09de91d450fbd02f18883c2957b9ce9df35a9dfd7433d1d69b5dc2da8' # login_ng.service
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

    mkdir -p "$pkgdir/usr/bin"
    install -m 755 "$srcdir/$pkgname-$pkgver/target/release/login_ng-ctl" "$pkgdir/usr/bin/login_ng-ctl"
    install -m 755 "$srcdir/$pkgname-$pkgver/target/release/login_ng-cli" "$pkgdir/usr/bin/login_ng-ctl"

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
