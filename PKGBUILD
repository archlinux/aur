# Stoat backend with eight independently managed systemd daemons.
# Source fetched by upstream release tag; patch old redis-rs for newer Rust.
pkgname=stoat-server
pkgver=0.16.5
pkgrel=3
pkgdesc='Stoat chat server'
arch=('x86_64')
url='https://stoat.chat'
license=('AGPL-3.0-or-later')
# Rust profile.release has its own LTO; disable conflicting distro-wide LTO.
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
    'patch'
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

_tag="v${pkgver}"
_redis_commit=523b2937367e17bd0073722bf6e23d06042cb4e4
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
    "stoatchat::git+https://github.com/stoatchat/stoatchat.git#tag=${_tag}"
    "${_units[@]}"
    'stoat.conf'
    'stoat-wait-api'
    'stoat.tmpfiles'
    'stoat-Revolt.toml'
    'README.arch.md'
    'redis-rs-never-type.patch'
    'stoat-email-base64.patch'
)
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
    '560e8aabf96299f597f533c70febb441c64f94815d58163351641a75620cb4b4'
    '692e041a8207ba28a8b64d0ae3973994003860aff3c497ea8a1fd890f30492ef'
    '78a75f79f700c9c063cae5c853bd3beb63654146ab65b479b7a87e79f7898466'
    '7fda96ed82712343362119b86c1b76a06538e9f8ecf5c44f2cd5dfb41899cc0b'
)

prepare() {
    cd "$srcdir/stoatchat"

    # Patch email template for fix verify links
    patch -Np1 -i "${srcdir}/stoat-email-base64.patch"

    # Avoid downloading a rustup-managed compiler during the Arch build.
    rm -f rust-toolchain.toml

    # Cargo's git checkout of redis-rs is patched below. Keep the Cargo cache
    # per build to avoid silently altering the user's global ~/.cargo cache.
    export CARGO_HOME="$srcdir/.cargo-home"
    mkdir -p "$CARGO_HOME"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"

    # Cargo.lock pins this redis-rs git revision; fail if upstream changes.
    local redis_source=()
    redis_source=("$CARGO_HOME"/git/checkouts/redis-rs-*/"${_redis_commit:0:7}"/redis/src/script.rs)
    if (( ${#redis_source[@]} != 1 )) || [[ ! -f "${redis_source[0]}" ]]; then
        printf 'ERROR: expected redis-rs revision %s not found in CARGO_HOME\n' "$_redis_commit" >&2
        return 1
    fi

    # The SCRIPT LOAD command returns a SHA-1 string. Explicitly bind its
    # return type, avoiding Rust's changed never-type (!) inference fallback.
    if grep -Fqx '                    self.load_cmd().query(con)?;' "${redis_source[0]}"; then
        patch --batch --fuzz=0 -p1 -d "${redis_source[0]%/src/script.rs}" \
            -i "$srcdir/redis-rs-never-type.patch"
    elif ! grep -Fqx '                    let _: String = self.load_cmd().query(con)?;' "${redis_source[0]}" || \
         ! grep -Fqx '                    let _: String = self.load_cmd().query_async(con).await?;' "${redis_source[0]}"; then
        printf 'ERROR: redis-rs source differs from expected patch revision\n' >&2
        return 1
    fi
}

build() {
    cd "$srcdir/stoatchat"
    export CARGO_HOME="$srcdir/.cargo-home"
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
