# Maintainer: j4y <j4y_w4lk3r@pobox.com>
#
# ykw — multi-recipient YubiKey OpenPGP workflow CLI (Bash).
# Source-only package: ykw is a Bash script + two helper libraries, so the
# build is `arch=('any')` and no compilation step is required.
#
# Release flow:
#   - GitHub Actions tags a release at https://github.com/j4y-w4lk3r/ykw
#   - This PKGBUILD downloads the source tarball from that release.
#   - `arch/aur-bump.sh` updates pkgver + sha256sums + .SRCINFO and pushes
#     to the matching aur.archlinux.org/ykw.git repo.

pkgname=ykw
pkgver=0.1.2
pkgrel=1
pkgdesc="Multi-recipient YubiKey OpenPGP workflow CLI (Bash)"
arch=('any')
url="https://github.com/j4y-w4lk3r/ykw"
license=('MIT')
depends=(
    'bash'
    'gnupg'
    'yubikey-manager'
    'jq'
)
optdepends=(
    '1password-cli: store PINs + provisioning metadata in 1Password'
    'fzf: interactive tag picker (Ninjago presets)'
    'github-cli: GitHub repo helpers used by ykw sync'
)
provides=('ykw')
conflicts=('ykw-bin' 'ykw-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

# Replaced by `arch/aur-bump.sh` per release. 'SKIP' lets makepkg run
# without curl'ing the tarball during development.
sha256sums=('cc404b1fb85d66c86fc3cf3429b8809e0c79447e0a0e52b03866fcb73cf0e909')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Bash script + helpers live together in /usr/share/ykw/. The runtime
    # symlink-walk in ykw resolves SCRIPT_DIR back to this directory so the
    # `source "$SCRIPT_DIR/lib.sh"` / `source "$SCRIPT_DIR/op.sh"` calls work.
    install -Dm755 ykw    "${pkgdir}/usr/share/${pkgname}/ykw"
    install -Dm644 lib.sh "${pkgdir}/usr/share/${pkgname}/lib.sh"
    install -Dm644 op.sh  "${pkgdir}/usr/share/${pkgname}/op.sh"

    # Bundled pubkeys + keys.tsv. Read-only by virtue of /usr/share/. Users
    # who want to mutate state (re-export, rotate keys) should `cp -r` this
    # tree to $XDG_DATA_HOME/ykw and `export YKW_WORKSPACE=$XDG_DATA_HOME/ykw`.
    if [[ -d pubkeys ]]; then
        install -d "${pkgdir}/usr/share/${pkgname}/pubkeys"
        install -m644 pubkeys/* "${pkgdir}/usr/share/${pkgname}/pubkeys/"
    fi

    # /usr/bin/ykw is a wrapper that points YKW_WORKSPACE at /usr/share/ykw
    # so `ykw status` finds pubkeys/keys.tsv out of the box. Users override
    # with their own YKW_WORKSPACE before running write-mode commands.
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/bash
export YKW_WORKSPACE="${YKW_WORKSPACE:-/usr/share/ykw}"
exec /usr/share/ykw/ykw "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
