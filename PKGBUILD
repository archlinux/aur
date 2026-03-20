# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-bin
#
# This PKGBUILD installs pre-built binaries from the GitHub release.
# The release workflow renders this file by substituting 0.0.21 and
# e4f0a2edddac47c757385fe25a6371cccfe7373b2c48126a29b74b68da1e587d / @AARCH64_SHA256@ before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-bin
pkgver=0.0.21
pkgrel=1
pkgdesc="Multi-provider Secret Service daemon with SSH agent, FUSE mount, and PAM unlock"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
depends=(
    'dbus'
    'pam'
)
optdepends=(
    'fuse3: SSH key FUSE filesystem at $XDG_RUNTIME_DIR/rosec/ssh'
    'openssh: SSH agent support'
    'libnotify: desktop notifications on lock/unlock'
)
optdepends+=(
    'rosec-provider-bitwarden-pm-bin: Bitwarden Password Manager provider (sync, SSH keys)'
    'rosec-provider-bitwarden-sm-bin: Bitwarden Secrets Manager provider (sync)'
    'rosec-provider-gnome-keyring-bin: GNOME Keyring read-only provider'
)
provides=('rosec' 'org.freedesktop.secrets')
conflicts=('rosec')
install=rosec.install

source_x86_64=(
    "rosec-${pkgver}-x86_64.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
    "rosec-${pkgver}-aarch64.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums_x86_64=('e4f0a2edddac47c757385fe25a6371cccfe7373b2c48126a29b74b68da1e587d')
sha256sums_aarch64=('@AARCH64_SHA256@')

package() {
    # The tarball unpacks to a directory named after the target triple.
    local srcdir_inner
    srcdir_inner=$(find "${srcdir}" -maxdepth 1 -type d -name '*-linux-gnu' | head -1)

    # Binaries
    install -Dm755 "${srcdir_inner}/rosecd"       "${pkgdir}/usr/bin/rosecd"
    install -Dm755 "${srcdir_inner}/rosec"        "${pkgdir}/usr/bin/rosec"
    install -Dm755 "${srcdir_inner}/rosec-prompt" "${pkgdir}/usr/bin/rosec-prompt"

    # PAM helper binary — talks to rosecd over D-Bus to unlock providers
    install -Dm755 "${srcdir_inner}/rosec-pam-unlock" \
        "${pkgdir}/usr/lib/rosec/rosec-pam-unlock"

    # PAM module (native .so — stashes password in auth, forks helper in session)
    if [[ -f "${srcdir_inner}/pam_rosec.so" ]]; then
        install -Dm755 "${srcdir_inner}/pam_rosec.so" \
            "${pkgdir}/usr/lib/security/pam_rosec.so"
    fi

    # PAM config snippet (include from /etc/pam.d/system-local-login or screen locker)
    install -Dm644 "${srcdir_inner}/contrib/pam/rosec" \
        "${pkgdir}/etc/pam.d/rosec"

    # Service activation files are generated at runtime by `rosec enable`
    # with the correct binary paths — no static copies shipped.

    # Shell completions
    install -Dm644 "${srcdir_inner}/contrib/bash/rosec.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/rosec"
    install -Dm644 "${srcdir_inner}/contrib/zsh/_rosec" \
        "${pkgdir}/usr/share/zsh/site-functions/_rosec"

    # Docs
    install -Dm644 "${srcdir_inner}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # License
    install -Dm644 "${srcdir_inner}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
