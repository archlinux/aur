# Maintainer: Wendy Labs Inc. <support@wendy.dev>
pkgname=wendy
_pkgver=2026.11.13-154136
_pkgtag=2026.11.13-154136
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
sha256sums_x86_64=('dc31d339b17e7d4417093074a8e49eef3cbe9ffd7f34195f71b37ad3b756c803')
sha256sums_aarch64=('e50f5f5d5bc621726c8d1c8dfef85211041f53c08b6aa7545a7114232d7663bd')

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
