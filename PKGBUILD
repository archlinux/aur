# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
# Contributor: torculus <20175597+torculus@users.noreply.github.com>

pkgname=cthulock
pkgver=0.1.2
pkgrel=1
license=('GPL-3.0-only')
pkgdesc='Wayland screen locker focused on customizability'
url='https://github.com/FriederHannenheim/cthulock'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('cargo')
depends=('egl-wayland' 'glibc' 'gcc-libs' 'libxkbcommon' 'pam')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9aeaeaa0ac4de9dfd85fc46815dde0452cbc3dd4b45fc1e96d8357c36af6857265efecfef03bb399b22ca61f814df97c83e2a6bcc91430711614d18a52b2e380')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --offline --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export SLINT_NO_QT=1
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    # symlink /etc/pam.d/cthulock to /etc/pam.d/login as per README
    mkdir -p "$pkgdir/etc/pam.d/"
    ln -s /etc/pam.d/login "$pkgdir/etc/pam.d/cthulock"

    # copy sample config to /etc/cthulock/sample.slint
    install -Dm0755 "$srcdir/$pkgname-$pkgver/sample_config/style.slint" "$pkgdir/etc/$pkgname/style.slint"
}
