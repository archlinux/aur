# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-uhid-bin
#
# The privileged, disposable broker for rosec's FIDO2 / WebAuthn virtual
# authenticator. Install this only if you want rosec to serve passkeys to
# browsers as a security key.
#
# /dev/uhid is root-only (unrestricted uhid access can forge input devices),
# so a tiny socket-activated system service opens it, creates a device with a
# hard-coded FIDO usage-page descriptor, chowns the hidraw node to the
# requesting user, passes the fd back over SCM_RIGHTS, and exits. All CTAP
# logic then runs unprivileged inside the user's rosecd.
#
# The broker is standalone: it does not depend on rosec at runtime (rosecd
# connects to *it*). rosec lists this package in its optdepends.
#
# This reuses the main rosec release tarball, which already carries the
# rosec-uhid binary and the contrib/uhid units + modules-load file. The
# release workflow renders this file by substituting 0.0.33 and the
# bcd9c4509c7a12a9c1ddd3e35653255be425640f23148d29dadad54d9362f268 / @AARCH64_SHA256@ checksums before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-uhid-bin
pkgver=0.0.33
pkgrel=1
pkgdesc="Privileged broker for rosec's FIDO2/WebAuthn virtual authenticator (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
optdepends=(
    'rosec: the Secret Service daemon that drives the virtual authenticator'
)
provides=('rosec-uhid')
conflicts=('rosec-uhid' 'rosec-uhid-git')
install=rosec-uhid.install

source_x86_64=(
    "rosec-${pkgver}-x86_64.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
    "rosec-${pkgver}-aarch64.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums_x86_64=('bcd9c4509c7a12a9c1ddd3e35653255be425640f23148d29dadad54d9362f268')
sha256sums_aarch64=('@AARCH64_SHA256@')

package() {
    # The tarball unpacks to a directory named after the target triple.
    local srcdir_inner
    srcdir_inner=$(find "${srcdir}" -maxdepth 1 -type d -name '*-linux-gnu' | head -1)

    # The privileged broker binary
    install -Dm755 "${srcdir_inner}/rosec-uhid" \
        "${pkgdir}/usr/bin/rosec-uhid"

    # Socket-activated system service (not enabled by default — see the
    # post-install message)
    install -Dm644 "${srcdir_inner}/contrib/uhid/rosec-uhid.socket" \
        "${pkgdir}/usr/lib/systemd/system/rosec-uhid.socket"
    install -Dm644 "${srcdir_inner}/contrib/uhid/rosec-uhid.service" \
        "${pkgdir}/usr/lib/systemd/system/rosec-uhid.service"

    # Load the uhid module at boot so /dev/uhid exists (the broker's hardened
    # unit cannot modprobe it itself)
    install -Dm644 "${srcdir_inner}/contrib/uhid/modules-load.conf" \
        "${pkgdir}/usr/lib/modules-load.d/rosec-uhid.conf"

    # Keep the seat-scoped uaccess ACL off the virtual authenticator node so a
    # second local user cannot reach it (the broker owns it per-uid instead)
    install -Dm644 "${srcdir_inner}/contrib/uhid/69-rosec-uhid.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/69-rosec-uhid.rules"

    # License
    install -Dm644 "${srcdir_inner}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
