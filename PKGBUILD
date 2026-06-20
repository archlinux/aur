pkgname=rustpos-bin
_pkgname=rustpos
pkgver=1.4.0
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

sha256sums_x86_64=('04624d6345bea91f737c1d57e940801a6151691ebe5b029e80a4d49653753005')
sha256sums_aarch64=('9b9bc285a61d7ccbe1de35a2fe91ff807d5dbf79664c690f2a538a315303adcd')
sha256sums_armv7h=('07a1e01ce54dca2b649d138ce691bc1468cc1fd0e5f1c97df11591ded92436d3')

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
