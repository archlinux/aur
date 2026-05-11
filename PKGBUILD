# Maintainer: kay-ws <a3.works@gmail.com>
pkgname=bcon
pkgver=1.4.0
pkgrel=2
pkgdesc="GPU-accelerated terminal emulator for Linux console (DRM/KMS)"
arch=('x86_64')
url="https://github.com/sanohiro/bcon"
license=('MIT')
backup=('etc/bcon/config.toml')

# Disable LTO: the libseat crate compiles log_handler.c via cc, and
# -flto=auto from CFLAGS makes the resulting archive symbols unresolvable
# to rust-lld at link time (undefined reference to
# init_preformatted_log_handler). The Arch convention is options=(!lto).
#
# Disable debug split: `cargo --release` ships no debug info by default,
# so the auto-generated bcon-debug package would be empty.
options=(!lto !debug)

depends=(
    'libdrm'
    'mesa'
    'libxkbcommon'
    'libinput'
    'freetype2'
    'fontconfig'
    'seatd'
    # NOTE: dbus is not linked directly — zbus provides its own protocol
    # implementation. dbus-daemon is only needed via the optional fcitx5
    # IME path, which optdepends 'fcitx5' will pull in transitively.
)

makedepends=(
    'rust'
    'cmake'
    'clang'
    'pkgconf'
)

optdepends=(
    'fcitx5: Japanese input method support via D-Bus'
    'noto-fonts-cjk: CJK text rendering'
    'noto-fonts-emoji: color emoji rendering'
)

source=("bcon-${pkgver}.tar.gz::https://github.com/sanohiro/bcon/archive/refs/tags/v${pkgver}.tar.gz"
        "bcon-default.toml")
sha256sums=('8a09aefb2dcfd3ea6bda15dabd66ab3db21f49c5065ce66a1bf74415ac283a15'
            '34aaa8bc982699fb579a42c710ce68d2c1d0bf8e28daf2c8c78abe1f0bbd67f2')

prepare() {
    cd "$srcdir/bcon-$pkgver"
    sed -i 's|/usr/local/bin/|/usr/bin/|g' bcon.desktop bcon@.service
}

build() {
    cd "$srcdir/bcon-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/bcon-$pkgver"
    # Drift guard: regenerate the default template from the just-built
    # binary and diff against the shipped bcon-default.toml. If upstream
    # changes Config::default_template() output, we must refresh our
    # shipped reference; otherwise users on fresh install get a stale
    # default that won't round-trip through the runtime.
    #
    # Normalization (1.4.0-2): bcon's Config::default_template() includes
    # two kinds of environment-dependent content that we must strip before
    # diffing:
    #   1. "# Config path: <abs>" header line (path-dependent, only present
    #      in the runtime output).
    #   2. [font] section body: Config::default_template() queries
    #      fontconfig at template-generation time, so detected fonts vary
    #      by host (build machine vs end-user machine vs CI chroot). We
    #      keep the "[font]" heading and strip its body in both files.
    rm -f "$srcdir/bcon-default-runtime.toml"
    ./target/release/bcon --init-config="$srcdir/bcon-default-runtime.toml" 2>/dev/null

    local _norm_runtime _norm_canonical
    _norm_runtime=$(mktemp)
    _norm_canonical=$(mktemp)

    _bcon_normalize() {
        awk '
            /^# Config path: / { next }
            /^\[font\]$/      { in_font = 1; print; next }
            /^\[/ && in_font  { in_font = 0; print; next }
            in_font           { next }
                              { print }
        ' "$1"
    }
    _bcon_normalize "$srcdir/bcon-default-runtime.toml" > "$_norm_runtime"
    _bcon_normalize "$srcdir/bcon-default.toml"         > "$_norm_canonical"

    if ! diff -q "$_norm_canonical" "$_norm_runtime" > /dev/null; then
        echo "ERROR: shipped bcon-default.toml drifted from runtime template" >&2
        echo "--- shipped (bcon-default.toml, normalized)" >&2
        echo "+++ runtime (bcon --init-config, normalized)" >&2
        diff "$_norm_canonical" "$_norm_runtime" | head -50 >&2
        rm -f "$_norm_runtime" "$_norm_canonical"
        return 1
    fi
    rm -f "$_norm_runtime" "$_norm_canonical"
    echo "Drift guard: bcon-default.toml matches runtime template (path header + [font] section normalized)"
}

package() {
    cd "$srcdir/bcon-$pkgver"
    install -Dm755 target/release/bcon   "$pkgdir/usr/bin/bcon"
    install -Dm755 bcon-session          "$pkgdir/usr/bin/bcon-session"
    install -Dm644 bcon@.service         "$pkgdir/usr/lib/systemd/system/bcon@.service"
    install -Dm644 bcon.desktop          "$pkgdir/usr/share/xsessions/bcon.desktop"
    install -Dm644 LICENSE               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/bcon-default.toml" "$pkgdir/etc/bcon/config.toml"
}
