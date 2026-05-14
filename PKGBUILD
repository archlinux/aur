pkgname=rustpos-bin
_pkgname=rustpos
pkgver=1.2.1
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

sha256sums_x86_64=('8aeb01fc3ab3591c64ed9ebbc91ff2ae030b226d4b5be9ffd25ef507f1d4f6ef')
sha256sums_aarch64=('60fcb87a0fee542c6ce9ee07058364bc82548e3e667d5a2a639dd617fc66a9d8')
sha256sums_armv7h=('be07c7391c13f7af63422a6e647b45a3aa6427ab1f5fa6e500d216e578998de2')

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
