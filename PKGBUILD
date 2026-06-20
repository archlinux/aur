pkgname=rustpos-bin
_pkgname=rustpos
pkgver=1.4.2
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

sha256sums_x86_64=('b06ec33a07aeffb3d0bc15f2fac515bb230fc07e5f0b867ab74de064884452aa')
sha256sums_aarch64=('865dc3ba18bf7c142da75333e92ff56978170e8d3b450655e8a015a17d72d86b')
sha256sums_armv7h=('0eb0c93e7a52adfb631f2c8238e243b34bf7e7a7899c31439659cbda719ccf16')

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
