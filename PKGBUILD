# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix-bin
_pkgname=voix
pkgver=4.13.3
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication (pre-built)"
arch=('x86_64' 'aarch64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
provides=('sudo' 'doas')
conflicts=('sudo' 'doas' 'voix')
backup=('etc/pam.d/voix' 'etc/voix.conf')
install="${pkgname}.install"

# Every release artifact is published with a detached, armored GPG signature
# (<artifact>.asc). Unlike the checksums, the signature proves *who* produced the
# artifact, and makepkg checks it against validpgpkeys before anything builds.
#
# Primary ed25519 release key (full 40-character fingerprint):
#   7887165D6B07DE7785BD536E5239ACB42207EE03   Dae Euhwa <daedaevibin@ik.me>
# Published on keys.openpgp.org. Import it before building if it is missing:
#   gpg --recv-keys 7887165D6B07DE7785BD536E5239ACB42207EE03
# AUR helpers (paru/yay) fetch a missing validpgpkey automatically.
validpgpkeys=('7887165D6B07DE7785BD536E5239ACB42207EE03')

_release="https://github.com/Veridian-Zenith/Voix/releases/download/v${pkgver}"

# Per-architecture source arrays - AUR selects the matching one automatically.
# Each tarball is paired with its detached signature; the .asc gets a SKIP
# checksum because it is the signature itself (verified via validpgpkeys).
source_x86_64=(
    "voix-x86_64-bin.tar.gz::${_release}/voix-x86_64-bin.tar.gz"
    "voix-x86_64-bin.tar.gz.asc::${_release}/voix-x86_64-bin.tar.gz.asc"
)
sha256sums_x86_64=('fd04524b5a5546c37b7ce7557041150c1c94dda2fe9924fe59881c575483ce6b'
                   'SKIP')
sha256sums_aarch64=('d6d9a448a6fa9d10c0c47e163a11350ba544c2c9296c2b517171f77ce95edc20'
                    'SKIP')

source_aarch64=(
    "voix-aarch64-bin.tar.gz::${_release}/voix-aarch64-bin.tar.gz"
    "voix-aarch64-bin.tar.gz.asc::${_release}/voix-aarch64-bin.tar.gz.asc"
)

package() {
    cd voix-bin
    install -Dm4755 -o root -g root voix "${pkgdir}/usr/bin/voix"
    install -Dm600 -o root -g root voix.conf "${pkgdir}/etc/voix.conf"
    install -Dm644 -o root -g root voix.pam "${pkgdir}/etc/pam.d/voix"
    install -Dm644 -o root -g root voix.1 "${pkgdir}/usr/share/man/man1/voix.1"
    mkdir -p "${pkgdir}/var/lib/voix"
    ln -sf /usr/bin/voix "${pkgdir}/usr/bin/sudo"
    ln -sf /usr/bin/voix "${pkgdir}/usr/bin/doas"
}
