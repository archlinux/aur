# Maintainer: Atay Özcan <atay@oezcan.me>
pkgname=sentinel
pkgver=0.4.1
pkgrel=3
install=sentinel.install
# Cargo.toml's release profile already strips symbols (`strip = "symbols"`),
# so makepkg's debug-package generator has nothing to index — opt out to
# avoid noisy gdb-add-index "No debugging symbols" errors.
options=('!debug')
pkgdesc="UAC-style confirmation dialog for Linux privilege escalation (COSMIC + sudo-rs friendly)"
arch=('x86_64' 'aarch64')
url="https://github.com/atayozcan/sentinel"
license=('GPL-3.0-or-later')
depends=(
    'pam'
    'polkit'
    'wayland'
    'libxkbcommon'
    'fontconfig'
    'freetype2'
    'mesa'
    'vulkan-icd-loader'
    'gcc-libs'
    'glibc'
)
makedepends=(
    'rust'
    'pkgconf'
    'wayland-protocols'
)
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'polkit: for graphical privilege prompts'
)
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # update with: makepkg -g >> PKGBUILD

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SENTINEL_PREFIX=/usr
    export SENTINEL_SYSCONFDIR=/etc
    export SENTINEL_LIBEXECDIR=lib
    cargo build --frozen --release --workspace

    # Generate shell completions + man pages from the freshly-built binaries.
    install -d target/release/share
    for bin in sentinel-helper sentinel-polkit-agent; do
        target/release/$bin completions bash > target/release/share/$bin.bash
        target/release/$bin completions fish > target/release/share/$bin.fish
        target/release/$bin completions zsh  > target/release/share/_$bin
        target/release/$bin man              > target/release/share/$bin.1
    done
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/sentinel-helper \
        "$pkgdir/usr/lib/sentinel-helper"

    # 0755 (not 0644) — libpam under systemd-sandboxed PAM stacks
    # refuses to dlopen .so files without the execute bit.
    install -Dm755 target/release/libpam_sentinel.so \
        "$pkgdir/usr/lib/security/pam_sentinel.so"

    install -Dm644 config/sentinel.conf \
        "$pkgdir/etc/security/sentinel.conf"

    install -Dm644 config/polkit-1 \
        "$pkgdir/etc/pam.d/polkit-1"

    # config/sudo is *not* installed to /etc/pam.d/sudo automatically —
    # silently rewriting /etc/pam.d/sudo is a notorious foot-gun. Ship
    # it under /usr/share/doc/ for users to copy in manually.
    install -Dm644 config/sudo \
        "$pkgdir/usr/share/doc/$pkgname/sudo"

    install -Dm755 target/release/sentinel-polkit-agent \
        "$pkgdir/usr/lib/sentinel-polkit-agent"

    install -Dm644 packaging/systemd/polkit-agent-helper@.service.d/sentinel.conf \
        "$pkgdir/etc/systemd/system/polkit-agent-helper@.service.d/sentinel.conf"

    install -Dm644 packaging/xdg-autostart/sentinel-polkit-agent.desktop \
        "$pkgdir/etc/xdg/autostart/sentinel-polkit-agent.desktop"

    # Shell completions.
    install -Dm644 target/release/share/sentinel-helper.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-helper"
    install -Dm644 target/release/share/sentinel-polkit-agent.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-polkit-agent"
    install -Dm644 target/release/share/sentinel-helper.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-helper.fish"
    install -Dm644 target/release/share/sentinel-polkit-agent.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-polkit-agent.fish"
    install -Dm644 target/release/share/_sentinel-helper \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-helper"
    install -Dm644 target/release/share/_sentinel-polkit-agent \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-polkit-agent"

    # Man pages.
    install -Dm644 target/release/share/sentinel-helper.1 \
        "$pkgdir/usr/share/man/man1/sentinel-helper.1"
    install -Dm644 target/release/share/sentinel-polkit-agent.1 \
        "$pkgdir/usr/share/man/man1/sentinel-polkit-agent.1"
    install -Dm644 packaging/man/sentinel.conf.5 \
        "$pkgdir/usr/share/man/man5/sentinel.conf.5"
    install -Dm644 packaging/man/pam_sentinel.8 \
        "$pkgdir/usr/share/man/man8/pam_sentinel.8"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
