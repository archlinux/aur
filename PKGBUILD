# Stoat backend with eight independently managed systemd daemons.
# Source is pinned to the audited v0.16.5 release commit, not a movable tag.
pkgname=stoat-server
pkgver=0.16.5
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
)
makedepends=(
    'git'
    'rust>=1.92.0'
    'pkgconf'
    'cmake'
)
optdepends=(
    'mongodb: local MongoDB server (may be hosted remotely)'
    'valkey: local Redis-compatible server (may be hosted remotely)'
    'rabbitmq: local AMQP broker (may be hosted remotely)'
    'minio: local S3-compatible object store (may be hosted remotely)'
    'livekit: local voice server (only needed for voice calls)'
    'clamav: optional upload scanning when files.clamd_host is configured'
)
backup=('etc/stoat/Revolt.toml')

# Dereferenced annotated release tag v0.16.5 on 2026-11-20.
_commit=7eaa89a1a38b26e359cec3c77818ac6de36e2647
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
    "stoatchat::git+https://github.com/stoatchat/stoatchat.git#commit=${_commit}"
    "${_units[@]}"
    'stoat.conf'
    'stoat-wait-api'
    'stoat.tmpfiles'
    'stoat-Revolt.toml'
    'README.arch.md'
)
# Git checkout is locked to the release commit; local files have SHA-256 hashes.
sha256sums=(
    'SKIP'
    'f49154efb33defdfeb0906f38bebb8b8d2d672c8bb3ee42eaaca00eb9b5ed300'
    '934081d7a8e5504eacb10e8b142efb1b12710c1695efe275145567343800065f'
    '0084e6030e14803036405d687c681499ca7b85da213fbda383740e9a15e080bd'
    'd23198ae347443666be6223bcf0d1532a8436788e0a98a7b2a9ac09f00ea2e12'
    '10f6f7925777c7cff1c43fec43066f6ce66727a389cd9ccfe606f86deac1fcd9'
    '5408317c51050aac9c533ba71a06823adc900b6342c7a982b14e3a291870d5eb'
    '4385778ea772d979cc4f41342b778b6a59cae9265bed3463dceac3732796d3d0'
    'abef4dc39084d0861461fc8e549c273b8839ad3db8f387ca290a4982fb8f9b5a'
    '5c00305ecc75cf3a4910400df38034f3e40554eabfa38ccff39452091c4301a4'
    '380ba8357ae5a2ccba4da80c5389bdf25af81b92bbc93878eeb36286739a31c6'
    'f59cc377a9e7532b73244e57c3a8646f49c43d81f51b560c2e700f5983596c77'
    'da3bc55cac5b5778afd04d900c488fea5a3b4b6254a042292480206eab59f281'
    '8ae3194aa1d501b6407a80cda8c0fa7c84143e620fe9164214c1ef29d1ce73ea'
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

    # Not the development Revolt.toml: no default working secrets.
    install -Dm644 "$srcdir/stoat-Revolt.toml" \
        "$pkgdir/etc/stoat/Revolt.toml"

    for unit in "${_units[@]}"; do
        install -Dm644 "$srcdir/$unit" \
            "$pkgdir/usr/lib/systemd/system/$unit"
    done
    install -Dm644 "$srcdir/stoat.conf" \
        "$pkgdir/usr/lib/sysusers.d/stoat.conf"
    install -Dm644 "$srcdir/stoat.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/stoat.conf"
    install -Dm755 "$srcdir/stoat-wait-api" \
        "$pkgdir/usr/lib/stoat/wait-api"
    install -Dm644 "$srcdir/README.arch.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.arch.md"
    install -Dm644 "$srcdir/stoatchat/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
