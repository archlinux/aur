pkgname=rustpos-bin
_pkgname=rustpos
pkgver=1.3.2
pkgrel=1
pkgdesc="A modern, touch-friendly point of sale system built with Rust (binary repackage of upstream .deb)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/dividebysandwich/rustpos"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'openssl' 'systemd-libs')
provides=('rustpos')
conflicts=('rustpos')
options=('!strip' '!emptydirs')
install="${pkgname}.install"

_url_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_url_base}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_url_base}/${_pkgname}_${pkgver}_arm64.deb")
source_armv7h=("${_url_base}/${_pkgname}_${pkgver}_armhf.deb")

sha256sums_x86_64=('ca0fca6a0578c788b77150e49b97426bcad7e6c173c9bec0388b34240c7e924f')
sha256sums_aarch64=('b12f5360afa4117f1fc82f5c9c77f60d8d6b47b197e040d378717b56446cefe7')
sha256sums_armv7h=('6c1e488e15cf621d667452b976d7a57ab5fd8892a9d51d907d1cbf8867a3e106')

package() {
    cd "${srcdir}"

    # Extract data.tar.* from the .deb (works for xz, zstd, gz).
    bsdtar -xf "${_pkgname}_${pkgver}_"*.deb

    # Unpack the payload into ${pkgdir}.
    bsdtar -xpf data.tar.* -C "${pkgdir}"

    # Move systemd unit to Arch's expected location and adjust the
    # supplementary group (Debian uses 'dialout', Arch uses 'uucp').
    install -d "${pkgdir}/usr/lib/systemd/system"
    sed -e 's/^SupplementaryGroups=dialout$/SupplementaryGroups=uucp/' \
        "${pkgdir}/lib/systemd/system/${_pkgname}.service" \
        > "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    rm -rf "${pkgdir}/lib"
}
