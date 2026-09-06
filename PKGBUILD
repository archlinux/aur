# Maintainer: Pando85 <pando855@gmail.com>

_pkgname=passless
pkgname="${_pkgname}"
pkgver=0.19.2
pkgrel=1
pkgdesc="Virtual FIDO2 device and client FIDO 2 utility. Passkeys made easy."
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/passless"
license=('GPL')
install=passless.install
depends=('gcc-libs'
         'libgit2'
         'hidapi'
         'systemd-libs'
         'zlib')
makedepends=('cargo'
             'hidapi'
             'libgit2'
             'pkgconf'
             'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git#tag=v${pkgver}?signed"
        "passless.install")
validpgpkeys=('CD1DB60B2C8465FD50028EF6D381D73787B45B3E')
sha512sums=('SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/passless"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/passless"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBGIT2_SYS_USE_PKG_CONFIG=1
    export LIBGIT2_NO_VENDOR=1
    export HIDAPI_SYS_USE_PKG_CONFIG=1
    export HIDAPI_LIBRARIES=hidapi-hidraw
    export RUSTFLAGS="-C link-arg=-lhidapi-hidraw"
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/passless"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/passless"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/passless"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/passless-git-sync"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/sign-proxy"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/agent-prompt-probe"

    # Install shell completions
    local _completion_dir="$(find target/release/build/passless-rs-*/out/completions -type d 2>/dev/null | head -1)"
    if [ -n "$_completion_dir" ]; then
        install -Dm0644 "${_completion_dir}/passless.bash" \
            "${pkgdir}/usr/share/bash-completion/completions/passless"
        install -Dm0644 "${_completion_dir}/passless.fish" \
            "${pkgdir}/usr/share/fish/vendor_completions.d/passless.fish"
        install -Dm0644 "${_completion_dir}/_passless" \
            "${pkgdir}/usr/share/zsh/site-functions/_passless"
        install -Dm0644 "${_completion_dir}/passless.elv" \
            "${pkgdir}/usr/share/elvish/lib/passless.elv"
    fi

    install -Dm0644 contrib/systemd/passless.service "$pkgdir/usr/lib/systemd/user/passless.service"
    install -Dm0644 contrib/udev/90-passless.rules "$pkgdir/usr/lib/udev/rules.d/90-passless.rules"
    install -Dm0644 contrib/sysusers.d/passless.conf "$pkgdir/usr/lib/sysusers.d/passless.conf"
    install -Dm0644 contrib/modules-load.d/fido.conf "$pkgdir/etc/modules-load.d/fido.conf"
}
