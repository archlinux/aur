# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR VCS split package: rosec-git + rosec-provider-bitwarden-pm-git
#                                   + rosec-provider-bitwarden-sm-git
#                                   + rosec-provider-gnome-keyring-git
#
# Builds rosec and all WASM providers from source (latest git HEAD).

pkgbase=rosec-git
pkgname=(
    'rosec-git'
    'rosec-provider-bitwarden-pm-git'
    'rosec-provider-bitwarden-sm-git'
    'rosec-provider-gnome-keyring-git'
)
pkgver=r0.unknown
pkgrel=1
pkgdesc="Read-only Secret Service daemon with Bitwarden backend (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
# Disable GCC LTO: makepkg appends -flto=auto to CFLAGS which produces
# GCC LTO IR in vendored C static libs (zstd, ittapi, wasmtime helpers).
# rust-lld cannot link GCC LTO objects, causing undefined symbol errors.
# Rust has its own LTO via codegen-units/lto profile settings.
options=(!lto)
makedepends=(
    'git'
    'rust'
    'cargo'
    'pkg-config'
    'dbus'
    'pam'
)

source=("${pkgbase}::git+https://github.com/jmylchreest/rosec.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    # Mirror release.yml / Justfile version derivation:
    #   semver:  0.0.7-dev.5+e1fcd29   (CI/Justfile)
    #   git tag: v0.0.7-dev.5           (GitHub, no + allowed)
    #   pacman:  0.0.7dev5              (no hyphens/+/colons/slashes allowed)
    #
    # vercmp sorts alphanumeric suffixes before bare versions:
    #   0.0.6 < 0.0.7dev1 < 0.0.7dev5 < 0.0.7 < 0.0.8dev1
    # This gives correct prerelease ordering for free.
    local describe
    describe=$(git describe --tags --long --match 'v[0-9]*')
    if [[ $describe =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)-([0-9]+)-g([a-f0-9]+)$ ]]; then
        local major=${BASH_REMATCH[1]}
        local minor=${BASH_REMATCH[2]}
        local patch=${BASH_REMATCH[3]}
        local commits=${BASH_REMATCH[4]}
        if (( commits == 0 )); then
            printf '%s.%s.%s' "$major" "$minor" "$patch"
        else
            printf '%s.%s.%sdev%s' "$major" "$minor" "$((patch + 1))" "$commits"
        fi
    else
        printf '0.0.0dev0'
    fi
}

prepare() {
    cd "${srcdir}/${pkgbase}"

    # Ensure the WASM target is available for provider builds
    rustup target add wasm32-wasip1

    # Fetch workspace dependencies
    cargo fetch --locked 2>/dev/null || cargo fetch

    # Fetch dependencies for the out-of-workspace WASM guest crates
    cd "${srcdir}/${pkgbase}/rosec-bitwarden-pm"
    cargo fetch --locked 2>/dev/null || cargo fetch

    cd "${srcdir}/${pkgbase}/rosec-bitwarden-sm"
    cargo fetch --locked 2>/dev/null || cargo fetch

    cd "${srcdir}/${pkgbase}/rosec-gnome-keyring"
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    # Build native binaries (rosecd, rosec, rosec-pam-unlock)
    cd "${srcdir}/${pkgbase}"
    cargo build --release --locked --bin rosecd --bin rosec --bin rosec-pam-unlock 2>/dev/null || \
    cargo build --release         --bin rosecd --bin rosec --bin rosec-pam-unlock

    # Build PAM module (C, no Rust deps — tiny .so for libpam)
    cd "${srcdir}/${pkgbase}/contrib/pam"
    make

    # Build WASM providers
    cd "${srcdir}/${pkgbase}/rosec-bitwarden-pm"
    cargo build --target wasm32-wasip1 --release --locked 2>/dev/null || \
    cargo build --target wasm32-wasip1 --release

    cd "${srcdir}/${pkgbase}/rosec-bitwarden-sm"
    cargo build --target wasm32-wasip1 --release --locked 2>/dev/null || \
    cargo build --target wasm32-wasip1 --release

    cd "${srcdir}/${pkgbase}/rosec-gnome-keyring"
    cargo build --target wasm32-wasip1 --release --locked 2>/dev/null || \
    cargo build --target wasm32-wasip1 --release
}

check() {
    cd "${srcdir}/${pkgbase}"
    cargo test --release --locked --workspace 2>/dev/null || \
    cargo test --release          --workspace
}

package_rosec-git() {
    pkgdesc="Read-only Secret Service daemon with Bitwarden backend (git)"
    depends=('dbus' 'pam')
    optdepends=(
        'rosec-provider-bitwarden-pm-git: Bitwarden Password Manager provider'
        'rosec-provider-bitwarden-sm-git: Bitwarden Secrets Manager provider'
        'rosec-provider-gnome-keyring-git: GNOME Keyring read-only provider'
        'libnotify: desktop notifications on lock/unlock'
    )
    provides=('rosec' 'org.freedesktop.secrets')
    conflicts=('rosec' 'rosec-bin')
    install=rosec.install

    cd "${srcdir}/${pkgbase}"

    # Binaries
    install -Dm755 target/release/rosecd "${pkgdir}/usr/bin/rosecd"
    install -Dm755 target/release/rosec  "${pkgdir}/usr/bin/rosec"

    # PAM helper binary — talks to rosecd over D-Bus to unlock providers
    install -Dm755 target/release/rosec-pam-unlock \
        "${pkgdir}/usr/lib/rosec/rosec-pam-unlock"

    # PAM module (native .so — stashes password in auth, forks helper in session)
    install -Dm755 contrib/pam/pam_rosec.so \
        "${pkgdir}/usr/lib/security/pam_rosec.so"

    # PAM config snippet (include from /etc/pam.d/system-local-login or screen locker)
    install -Dm644 contrib/pam/rosec \
        "${pkgdir}/etc/pam.d/rosec"

    # Service activation files are generated at runtime by `rosec enable`
    # with the correct binary paths — no static copies shipped.

    # Docs
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/rosec/README.md"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/rosec/LICENSE"
}

package_rosec-provider-bitwarden-pm-git() {
    pkgdesc="Bitwarden Password Manager provider for rosec (git)"
    arch=('any')
    depends=('rosec-git')
    provides=('rosec-provider-bitwarden-pm')
    conflicts=('rosec-provider-bitwarden-pm' 'rosec-provider-bitwarden-pm-bin')

    cd "${srcdir}/${pkgbase}"

    install -Dm644 rosec-bitwarden-pm/target/wasm32-wasip1/release/rosec_bitwarden_pm.wasm \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/rosec-provider-bitwarden-pm-git/LICENSE"
}

package_rosec-provider-bitwarden-sm-git() {
    pkgdesc="Bitwarden Secrets Manager provider for rosec (git)"
    arch=('any')
    depends=('rosec-git')
    provides=('rosec-provider-bitwarden-sm')
    conflicts=('rosec-provider-bitwarden-sm' 'rosec-provider-bitwarden-sm-bin')

    cd "${srcdir}/${pkgbase}"

    install -Dm644 rosec-bitwarden-sm/target/wasm32-wasip1/release/rosec_bitwarden_sm.wasm \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_sm.wasm"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/rosec-provider-bitwarden-sm-git/LICENSE"
}

package_rosec-provider-gnome-keyring-git() {
    pkgdesc="GNOME Keyring read-only provider for rosec (git)"
    arch=('any')
    depends=('rosec-git')
    provides=('rosec-provider-gnome-keyring')
    conflicts=('rosec-provider-gnome-keyring' 'rosec-provider-gnome-keyring-bin')

    cd "${srcdir}/${pkgbase}"

    install -Dm644 rosec-gnome-keyring/target/wasm32-wasip1/release/rosec_gnome_keyring.wasm \
        "${pkgdir}/usr/lib/rosec/providers/rosec_gnome_keyring.wasm"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/rosec-provider-gnome-keyring-git/LICENSE"
}
