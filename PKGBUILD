# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR VCS package: rosec-uhid-git
#
# Builds the rosec-uhid broker from source (latest git HEAD) — the privileged,
# disposable half of rosec's FIDO2 / WebAuthn virtual authenticator. Install
# this only if you want rosec to serve passkeys to browsers as a security key.
#
# The broker is standalone: it does not depend on rosec at runtime (rosecd
# connects to *it*). rosec lists this in its optdepends.
#
# The release workflow renders this file by substituting 0.0.33.
# At build time, pkgver() overrides the static version with the actual
# git-derived version.

pkgname=rosec-uhid-git
pkgver=0.0.33
pkgrel=1
pkgdesc="Privileged broker for rosec's FIDO2/WebAuthn virtual authenticator (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
# See PKGBUILD-git: makepkg's -flto=auto produces GCC LTO IR that rust-lld
# cannot link; Rust does its own LTO via the release profile.
options=(!lto)
optdepends=(
    'rosec: the Secret Service daemon that drives the virtual authenticator'
)
makedepends=(
    'git'
    'rust'
    'cargo'
)
provides=('rosec-uhid')
conflicts=('rosec-uhid' 'rosec-uhid-bin')
install=rosec-uhid.install

source=("rosec-uhid-git::git+https://github.com/jmylchreest/rosec.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # Mirror PKGBUILD-git's version derivation.
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
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release --locked --bin rosec-uhid 2>/dev/null || \
    cargo build --release          --bin rosec-uhid
}

check() {
    cd "${srcdir}/${pkgname}"
    cargo test --release --locked -p rosec-uhid 2>/dev/null || \
    cargo test --release          -p rosec-uhid
}

package() {
    cd "${srcdir}/${pkgname}"

    # The privileged broker binary
    install -Dm755 target/release/rosec-uhid \
        "${pkgdir}/usr/bin/rosec-uhid"

    # Socket-activated system service (not enabled by default — see the
    # post-install message)
    install -Dm644 contrib/uhid/rosec-uhid.socket \
        "${pkgdir}/usr/lib/systemd/system/rosec-uhid.socket"
    install -Dm644 contrib/uhid/rosec-uhid.service \
        "${pkgdir}/usr/lib/systemd/system/rosec-uhid.service"

    # Load the uhid module at boot so /dev/uhid exists (the broker's hardened
    # unit cannot modprobe it itself)
    install -Dm644 contrib/uhid/modules-load.conf \
        "${pkgdir}/usr/lib/modules-load.d/rosec-uhid.conf"

    # Keep the seat-scoped uaccess ACL off the virtual authenticator node so a
    # second local user cannot reach it (the broker owns it per-uid instead)
    install -Dm644 contrib/uhid/69-rosec-uhid.rules \
        "${pkgdir}/usr/lib/udev/rules.d/69-rosec-uhid.rules"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
