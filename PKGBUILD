# Maintainer: abel0x <https://github.com/abel0x>
# X Link Collector — middle-click a tweet: the link is saved and the tab closes

pkgname=x-link-collector
pkgver=1.5.0
pkgrel=1
pkgdesc="Middle-click a tweet to save its link and close the tab; a local panel downloads every photo and video"
arch=('x86_64' 'aarch64')
url="https://github.com/abel0x/x-link-collector"
license=('Apache-2.0')
depends=(
    'glibc'
    'libgcc'
    'python'
)
makedepends=(
    'cargo'
)
optdepends=(
    'yt-dlp: download videos (otherwise the panel installs its own copy)'
    'gallery-dl: download photos (otherwise the panel installs its own copy)'
    'ffmpeg: join a video whose picture and sound X serves apart'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e0d8ad701fb09eb42b95b3b64342448988d74ca38b11293ff4596832b531173')

prepare() {
    cd "$srcdir/$pkgname-$pkgver/receiver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver/receiver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Leaves this build folder's path out of the binary (docs/packaging.md).
    export X_LINK_COLLECTOR_PACKAGED=1

    # Optimisation and stripping come from [profile.release] in Cargo.toml.
    # The receiver has no dependencies, so the build needs no network.
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver/receiver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export X_LINK_COLLECTOR_PACKAGED=1
    cargo test --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # The receiver, and the two tools beside it in /usr/bin
    install -Dm755 "receiver/target/release/x-link-receiver" "$pkgdir/usr/bin/x-link-receiver"

    # The tools and the extension, where the receiver looks for them
    # (docs/packaging.md): /usr/share/x-link-collector
    install -Dm755 "tools/x-download" "$pkgdir/usr/share/$pkgname/tools/x-download"
    install -Dm755 "tools/x-flatten" "$pkgdir/usr/share/$pkgname/tools/x-flatten"
    cp -R --no-preserve=ownership "extension" "$pkgdir/usr/share/$pkgname/"
    ln -s "/usr/share/$pkgname/tools/x-download" "$pkgdir/usr/bin/x-download"
    ln -s "/usr/share/$pkgname/tools/x-flatten" "$pkgdir/usr/bin/x-flatten"

    # Per-user service: systemctl --user enable --now x-link-receiver
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    sed 's|^ExecStart=.*|ExecStart=/usr/bin/x-link-receiver|' \
        "packaging/systemd/x-link-receiver.service" \
        > "$pkgdir/usr/lib/systemd/user/x-link-receiver.service"
    chmod 644 "$pkgdir/usr/lib/systemd/user/x-link-receiver.service"

    # Documentation and licence notice
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
