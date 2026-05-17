# Maintainer: bananasjim <bananasjim1@gmail.com>
pkgname=padctl-bin
pkgver=0.1.7
pkgrel=2
pkgdesc="HID gamepad daemon — declarative TOML device config, uinput output (prebuilt musl binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BANANASJIM/padctl"
license=('LGPL-2.1-or-later')
depends=('systemd')
makedepends=()
provides=('padctl')
conflicts=('padctl' 'padctl-git')

_baseurl="${url}/releases/download/v${pkgver}"

source_x86_64=("padctl-v${pkgver}-x86_64-linux-musl.tar.gz::${_baseurl}/padctl-v${pkgver}-x86_64-linux-musl.tar.gz")
source_aarch64=("padctl-v${pkgver}-aarch64-linux-musl.tar.gz::${_baseurl}/padctl-v${pkgver}-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('6ecd9271cf8806fa7bcb3a3e10c37281051486f861cf56698a53b38d364dbcf8')
sha256sums_aarch64=('bc91591e9c982dce78706e3e8b7ddb78632c38423a887b4b1c2c34d6fa50f0ce')

package() {
    local _arch
    case "${CARCH}" in
        x86_64)  _arch="x86_64-linux-musl" ;;
        aarch64) _arch="aarch64-linux-musl" ;;
    esac

    local _src="padctl-v${pkgver}-${_arch}"
    cd "${_src}"

    install -Dm755 bin/padctl "${pkgdir}/usr/bin/padctl"
    [[ -f bin/padctl-debug ]] && install -Dm755 bin/padctl-debug "${pkgdir}/usr/bin/padctl-debug"
    [[ -f bin/padctl-capture ]] && install -Dm755 bin/padctl-capture "${pkgdir}/usr/bin/padctl-capture"

    install -Dm644 install/padctl.service \
        "${pkgdir}/usr/lib/systemd/system/padctl.service"
    [[ -f install/padctl-resume.service ]] && install -Dm644 install/padctl-resume.service \
        "${pkgdir}/usr/lib/systemd/system/padctl-resume.service"
    [[ -f install/padctl-reconnect ]] && install -Dm755 install/padctl-reconnect \
        "${pkgdir}/usr/bin/padctl-reconnect"

    install -Dm644 install/60-padctl.rules \
        "${pkgdir}/usr/lib/udev/rules.d/60-padctl.rules"
    [[ -f install/61-padctl-driver-block.rules ]] && install -Dm644 install/61-padctl-driver-block.rules \
        "${pkgdir}/usr/lib/udev/rules.d/61-padctl-driver-block.rules"

    while IFS= read -r -d '' toml; do
        install -Dm644 "${toml}" "${pkgdir}/usr/share/padctl/${toml}"
    done < <(find devices -name '*.toml' -print0)

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
