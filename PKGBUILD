# Maintainer: Wendy Labs Inc. <support@wendy.dev>
pkgname=wendy
_pkgver=2026.11.13-112158
_pkgtag=2026.11.13-112158
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy CLI - Remote device debugging and deployment for Raspberry Pi, NVIDIA Jetson, and other Linux devices"
arch=('x86_64' 'aarch64')
url="https://wendy.dev"
license=('custom:proprietary')
provides=('wendy')
conflicts=('wendy-git')
depends=('usbutils' 'ca-certificates')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-amd64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-arm64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('ad1e35638babc1435bd0dad3e31d729101d2fe01079a9beabdbae3defbae726e')
sha256sums_aarch64=('24bb3ee6cf84766d9bcd856957ea2001e268926f07cc226836172cc57e49100f')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    local _dir=wendy-cli-linux-amd64
    [[ "${CARCH}" == "aarch64" ]] && _dir=wendy-cli-linux-arm64

    install -Dm755 "${_dir}/wendy" "${pkgdir}/usr/bin/wendy"
    # USB access for `wendy os install` recovery/EDL flashing. The rules grant
    # it to plugdev, which Arch lacks: the sysusers.d entry creates it as a
    # system group. pacman's hooks run sysusers (20-) before the udev reload
    # and re-trigger (35-) after the transaction.
    install -Dm644 -t "${pkgdir}/usr/lib/udev/rules.d" \
        "${_dir}/udev/70-wendy-jetson.rules" \
        "${_dir}/udev/70-wendy-qualcomm.rules"
    install -Dm644 "${_dir}/sysusers.d/wendy.conf" "${pkgdir}/usr/lib/sysusers.d/wendy.conf"
}
