# Maintainer: bananasjim <bananasjim1@gmail.com>
pkgname=padctl-bin
pkgver=0.1.9
pkgrel=1
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
sha256sums_x86_64=('3a755ac32b07beb569b646d033d5afc5a47dacd031421a80dd8985451434e9d7')
sha256sums_aarch64=('a09bd0c717e0eddbcc020d06812dd1e171a6eb9a8e1fe7f3f1c6f4b0ead29428')

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
