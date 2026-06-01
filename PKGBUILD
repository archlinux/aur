# Maintainer: Ayush Bhat <tfeayush@gmail.com>
pkgname=agentty-bin
_pkgname=agentty
# pkgver is resolved dynamically from the latest GitHub release by pkgver().
# The literal below is only a fallback/placeholder; it is overwritten on build.
pkgver=0.1.0
pkgrel=1
pkgdesc="Blazing-fast Claude in your terminal — 8.8 MB static binary, sandboxed by default, one-command SSH airgap. C++26 alternative to claude-code."
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/agentty"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('bubblewrap: sandbox bash/diagnostics tool calls'
            'openssh: for `agentty airgap`')

case "$CARCH" in
    x86_64)  _asset="agentty-linux-x86_64"  ;;
    aarch64) _asset="agentty-linux-aarch64" ;;
esac

# Always pull from the *latest* release. Integrity is enforced in prepare()
# against the release's own SHA256SUMS, so sums=SKIP here is intentional and
# does NOT mean "unverified" — see prepare().
source=("${_pkgname}::${url}/releases/latest/download/${_asset}"
        "SHA256SUMS::${url}/releases/latest/download/SHA256SUMS")
sha256sums=('SKIP' 'SKIP')

# Report the latest published version so yay/pacman see a real upgrade when a
# new release lands. Strips a leading 'v' from the tag (v0.2.0 -> 0.2.0).
pkgver() {
    curl -fsSL "https://api.github.com/repos/1ay1/${_pkgname}/releases/latest" \
        | sed -n 's/.*"tag_name"[[:space:]]*:[[:space:]]*"v\{0,1\}\([^"]*\)".*/\1/p' \
        | head -n1
}

# Verify the downloaded binary against the hash published in the release's
# SHA256SUMS file. This is the real integrity gate: a tampered or mismatched
# binary aborts the build here.
prepare() {
    cd "$srcdir"
    local want
    want=$(awk -v n="$_asset" '$2==n {print $1; exit}' SHA256SUMS)
    if [ -z "$want" ]; then
        echo "ERROR: no checksum for '$_asset' in published SHA256SUMS" >&2
        return 1
    fi
    printf '%s  %s\n' "$want" "$_pkgname" | sha256sum -c - \
        || { echo "ERROR: checksum mismatch for $_asset" >&2; return 1; }
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
