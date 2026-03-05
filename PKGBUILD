# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-bin
#
# This PKGBUILD installs pre-built binaries from the GitHub release.
# The release workflow renders this file by substituting 0.0.9 and
# dbc9b7585c0ab1700016dbfaf986cae427b01d66ddbc57bb042c70a9eb7b2996 / @AARCH64_SHA256@ before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="Read-only Secret Service daemon with Bitwarden backend"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
depends=(
    'dbus'
    'pam'
)
optdepends=(
    'libnotify: desktop notifications on lock/unlock'
)
optdepends+=(
    'rosec-provider-bitwarden-pm-bin: Bitwarden Password Manager provider'
    'rosec-provider-bitwarden-sm-bin: Bitwarden Secrets Manager provider'
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

sha256sums_x86_64=('dbc9b7585c0ab1700016dbfaf986cae427b01d66ddbc57bb042c70a9eb7b2996')
sha256sums_aarch64=('@AARCH64_SHA256@')

package() {
    # The tarball unpacks to a directory named after the target triple.
    local srcdir_inner
    srcdir_inner=$(find "${srcdir}" -maxdepth 1 -type d -name '*-linux-gnu' | head -1)

    # Binaries
    install -Dm755 "${srcdir_inner}/rosecd" "${pkgdir}/usr/bin/rosecd"
    install -Dm755 "${srcdir_inner}/rosec"  "${pkgdir}/usr/bin/rosec"

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

    # Service activation files (shipped as reference examples — use
    # `rosec enable` to generate them with correct binary paths at runtime)
    install -Dm644 "${srcdir_inner}/contrib/systemd/rosecd.service" \
        "${pkgdir}/usr/share/doc/${pkgname}/systemd/rosecd.service"
    install -Dm644 "${srcdir_inner}/contrib/systemd/rosecd.socket" \
        "${pkgdir}/usr/share/doc/${pkgname}/systemd/rosecd.socket"
    install -Dm644 "${srcdir_inner}/contrib/dbus/org.freedesktop.secrets.service" \
        "${pkgdir}/usr/share/doc/${pkgname}/dbus/org.freedesktop.secrets.service"
    install -Dm644 "${srcdir_inner}/contrib/dbus/org.gnome.keyring.service" \
        "${pkgdir}/usr/share/doc/${pkgname}/dbus/org.gnome.keyring.service"
    install -Dm644 "${srcdir_inner}/contrib/autostart/rosecd.desktop" \
        "${pkgdir}/usr/share/doc/${pkgname}/autostart/rosecd.desktop"

    # Docs
    install -Dm644 "${srcdir_inner}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # License
    install -Dm644 "${srcdir_inner}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
