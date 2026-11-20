# Stoat backend, with the original eight separately managed daemons.
pkgname=stoat-server
pkgver=0.16.2
pkgrel=1
pkgdesc='Stoat chat server'
arch=('x86_64')
url='https://stoat.chat'
license=('AGPL-3.0-or-later')
# GCC LTO objects embedded in native Cargo crates cannot be linked by lld.
# Rust's own [profile.release] lto=true is unaffected.
options=('!lto')

depends=(
    'bash'
    'coreutils'
    'glibc'
    'gcc-libs'
    'openssl'
    'zlib'
    'curl'
    'lcms2'
    'dav1d'
    'ca-certificates'
    'ffmpeg'
    'systemd'
    'mongodb'
    'minio'
    'rabbitmq'
    'valkey'
    'livekit'
)
makedepends=(
    'git'
    'rust>=1.92.0'
    'pkgconf'
    'cmake'
)
optdepends=(
    'clamav: optional upload scanning when files.clamd_host is configured'
)
backup=('etc/stoat/Revolt.toml')

_binaries=(
    revolt-autumn
    revolt-bonfire
    revolt-crond
    revolt-delta
    revolt-gifbox
    revolt-january
    revolt-pushd
    revolt-voice-ingress
)
_units=(
    stoat-api.service
    stoat-crond.service
    stoat-events.service
    stoat-file-server.service
    stoat-gifbox.service
    stoat-proxy.service
    stoat-pushd.service
    stoat-voice-ingress.service
)

source=(
    "stoatchat::git+https://github.com/stoatchat/stoatchat.git#tag=v${pkgver}"
    "${_units[@]}"
    'stoat.conf'
    'stoat-wait-api'
)
# Only the VCS source uses SKIP; local files have SHA256 checksums.
sha256sums=(
    'SKIP'
    'e25f35e32230d7ccdf5d440e189c6bc19a9181f851392e0328aa3aeee3aec960'
    'ebb85e2805f30509e2ba844c008ce0f7710577b062ce60c47a6473efc9005adb'
    '10975b24b0388127cdf2b1efc67731c2890404e9e916f7a11036205d35e17342'
    '826124ee6b7a63c95d92471496faa01559ee46c8cbbefe9217c3e11c3ddda2bc'
    '2de067716143decd45bfbb0b10b3856a6f865488debad33fb0b9e674650fd51f'
    '72e74d26c79a8aeafb999dca63f71453635d6487ff2d52333c8cbb7b21d20254'
    '0cc02f71f8bb26bfd6e8d8855e3cfc380abb5a798551cae6adf82278c44e813d'
    'd342273c412d1d1fffd0ca1cc18756688c1da574b806a0f889d5b9f9a8ee6bb7'
    '5c00305ecc75cf3a4910400df38034f3e40554eabfa38ccff39452091c4301a4'
    '380ba8357ae5a2ccba4da80c5389bdf25af81b92bbc93878eeb36286739a31c6'
)

prepare() {
    cd "$srcdir/stoatchat"

    # Use Arch's packaged compiler rather than downloading a rustup toolchain.
    rm -f rust-toolchain.toml
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "$srcdir/stoatchat"

    # Keep the output path independent of user Cargo configuration.
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --frozen --release --workspace --bins \
        --target "${CARCH}-unknown-linux-gnu"
}

package() {
    local binary unit

    for binary in "${_binaries[@]}"; do
        install -Dm755 \
            "$srcdir/target/${CARCH}-unknown-linux-gnu/release/$binary" \
            "$pkgdir/usr/bin/$binary"
    done

    install -Dm644 "$srcdir/stoatchat/Revolt.toml" \
        "$pkgdir/etc/stoat/Revolt.toml"

    for unit in "${_units[@]}"; do
        install -Dm644 "$srcdir/$unit" \
            "$pkgdir/usr/lib/systemd/system/$unit"
    done

    install -Dm644 "$srcdir/stoat.conf" \
        "$pkgdir/usr/lib/sysusers.d/stoat.conf"
    install -Dm755 "$srcdir/stoat-wait-api" \
        "$pkgdir/usr/lib/stoat/wait-api"
    install -Dm644 "$srcdir/stoatchat/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
