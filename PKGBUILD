# Maintainer: facelock contributors
pkgname=facelock-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Face authentication for Linux PAM (development build)"
arch=('x86_64')
url="https://github.com/tyvsmith/facelock"
license=('MIT OR Apache-2.0')
depends=('glibc' 'dbus' 'pam' 'gcc-libs' 'tpm2-tss' 'libxkbcommon' 'onnxruntime')
makedepends=('rust' 'cargo' 'clang' 'gettext' 'wayland' 'libxkbcommon' 'git')
optdepends=(
    'onnxruntime-opt-cuda: NVIDIA GPU acceleration (replaces onnxruntime)'
    'onnxruntime-opt-rocm: AMD GPU acceleration (replaces onnxruntime)'
)
provides=('facelock')
conflicts=('facelock')
backup=('etc/facelock/config.toml')
install=facelock.install
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# A build has to land strictly between the release it descends from and the next
# one. Below the first and pacman refuses it as an upgrade, so AUR helpers report
# this package as permanently out of date; above the second and it blocks the
# real release. Four things earn that, and all four were broken. #330 reported
# the first and third; the other two are the same bug in the same expression:
#
#   --tags        every release tag since v0.1.2 is lightweight; without this,
#                 describe finds only the annotated v0.1.0-rc4 and each build
#                 claims to descend from it.
#   --match       the repository carries non-version tags (`assets`), and the
#                 nearest one wins if it is not filtered out.
#   ${tag#v}      pacman ranks an alphabetic first segment below a numeric one,
#                 so a surviving `v` sorts the build under every release.
#   ${x//[-.]/}   the prerelease suffix converts the way release_arch_pkgver
#                 converts it for the released package: v0.2.0-alpha.1 becomes
#                 0.2.0alpha1, not 0.2.0.alpha.1. pacman compares separator runs
#                 before segments, so the dotted form outranks 0.2.0alpha2,
#                 0.2.0beta1 and the stable 0.2.0 alike.
#
# Held to this shape by test/release-version-contract.sh; the ordering it buys is
# decided by vercmp in test/release-native-ordering.sh. scripts/release-versions.sh
# carries the same shape as release_arch_git_pkgver, which is what those two read.
pkgver() {
    cd "$pkgname"

    # Failing here is the right answer when no release tag is reachable: makepkg
    # stops with "failed to update pkgver". Without the guard the expansions
    # below would build a version out of an empty string and ship it, because
    # what they produce still satisfies makepkg's pkgver character check.
    local described tag base suffix count object
    described="$(git describe --long --tags --abbrev=7 --match 'v[0-9]*')" || return 1

    # --long always ends in -<commits>-g<object>, so the two right-most fields
    # come off to leave the tag, which carries a dash of its own on a prerelease.
    tag="${described%-*-*}"
    count="${described#"$tag"-}"
    object="${count#*-}"
    count="${count%-*}"

    tag="${tag#v}"
    base="${tag%%-*}"
    suffix="${tag#"$base"}"

    printf '%s%s.r%s.%s\n' "$base" "${suffix//[-.]/}" "$count" "$object"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
    cargo build --frozen --release -p facelock-cli --features tpm
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname"

    # Binaries
    install -Dm755 target/release/facelock "$pkgdir/usr/bin/facelock"
    install -Dm755 target/release/facelock-polkit-agent "$pkgdir/usr/bin/facelock-polkit-agent"

    # PAM module
    install -Dm755 target/release/libpam_facelock.so "$pkgdir/usr/lib/security/pam_facelock.so"

    # Configuration
    install -Dm644 config/facelock.toml "$pkgdir/etc/facelock/config.toml"

    # Quirks database
    install -Dm644 -t "$pkgdir/usr/share/facelock/quirks.d/" config/quirks.d/*.toml

    # Compiled translation catalogs, both gettext domains. Installs nothing
    # while po/ holds only .pot templates, and creates no empty locale root.
    scripts/install-locale-catalogs.sh "$pkgdir/usr/share/locale"

    # systemd units
    install -Dm644 systemd/facelock-daemon.service "$pkgdir/usr/lib/systemd/system/facelock-daemon.service"

    # D-Bus policy and activation service
    install -Dm644 dbus/org.facelock.Daemon.conf "$pkgdir/usr/share/dbus-1/system.d/org.facelock.Daemon.conf"
    install -Dm644 dbus/org.facelock.Daemon.service "$pkgdir/usr/share/dbus-1/system-services/org.facelock.Daemon.service"

    # tmpfiles.d for runtime directories
    install -Dm644 dist/facelock.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/facelock.conf"
    install -Dm644 dist/facelock-pam-remove.hook "$pkgdir/usr/share/libalpm/hooks/facelock-pam-remove.hook"

    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
