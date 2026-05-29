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
pkgver=0.1.5
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
sha256sums=('74bab86e2f96f3a537a7b98e4ad914bf83110b0c684c67da6f198ee83ee97742')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Bash script + helpers live together in /usr/share/ykw/. The runtime
    # symlink-walk in ykw resolves SCRIPT_DIR back to this directory so the
    # `source "$SCRIPT_DIR/lib.sh"` / `source "$SCRIPT_DIR/op.sh"` calls work.
    install -Dm755 ykw    "${pkgdir}/usr/share/${pkgname}/ykw"
    install -Dm644 lib.sh "${pkgdir}/usr/share/${pkgname}/lib.sh"
    install -Dm644 op.sh  "${pkgdir}/usr/share/${pkgname}/op.sh"

    # Pubkeys are NOT bundled — `ykw bootstrap` (Phase 5) materializes them
    # from the encrypted bu bundle in B2 the first time the user runs it on
    # a fresh machine. Bundling them here would just go stale every time a
    # YubiKey is rotated.

    # /usr/bin/ykw is a one-line wrapper. lib.sh resolves the workspace:
    # $YKW_WORKSPACE if set, dev-checkout if .git is present beside lib.sh,
    # otherwise $XDG_DATA_HOME/ykw (default ~/.local/share/ykw).
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/bash
exec /usr/share/ykw/ykw "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
