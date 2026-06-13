# Maintainer: padctl maintainers
# pkgver/pkgrel/sha256sums: sed-overwritten by .github/workflows/release.yml — local edits have no effect.
pkgname=padctl-bin
pkgver=0.1.16
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
sha256sums_x86_64=('c5d7a47846f0ea55e9811cdf876159b9ff39b457f9c3b7e46371e91f013f9f0d')
sha256sums_aarch64=('7f4259cf31f817689f947493d2d251539ebf652ddcc3e22c624aac07577b487a')

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
        "${pkgdir}/usr/lib/systemd/user/padctl.service"
    # padctl-resume.service was removed in issue #131 Problem B fix; the
    # udev padctl-reconnect hook handles post-suspend reconnect. Kept the
    # conditional guard so older tarballs still package cleanly, but new
    # tarballs will not ship the file.
    [[ -f install/padctl-resume.service ]] && install -Dm644 install/padctl-resume.service \
        "${pkgdir}/usr/lib/systemd/user/padctl-resume.service"
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
