pkgname=rustpos-bin
_pkgname=rustpos
pkgver=1.3.3
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

sha256sums_x86_64=('dde513bee2233b71e3633e3940190c21def33afb583239c8341e58878db8e070')
sha256sums_aarch64=('4b8004d5d135ce755f062349776a735b20b54a04889a99c3095433232cd36993')
sha256sums_armv7h=('1fde7c3a5d0bb2bd9af7b6b853ab139fc0c1c9638f9def223e3969cd0b2ae0df')

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
