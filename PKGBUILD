# Maintainer: ddnomad <dd at ddworks dot io>

pkgname=protonvpn-cli
pkgver=1577101870
pkgrel=1
pkgdesc="Legacy version of ProtonVPN CLI client. Most people are better off installing protonvpn-cli-ng package instead."
arch=("any")
url="https://github.com/ProtonVPN/protonvpn-cli"
license=("MIT")
depends=("openresolv" "openvpn" "python" "dialog" "wget" "procps-ng")
makedepends=("git")
source=("git+https://github.com/ProtonVPN/protonvpn-cli.git")
md5sums=("SKIP")

_update_resolv_conf_src_dir="openvpn-update-resolv-conf"
_protonvpn_src_dir="protonvpn-cli"

package() {
    # Define paths
    _update_resolv_conf_src_dir="${srcdir}/${_update_resolv_conf_src_dir}"
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"

    # Install update-resolv-conf dependency if needed
    if ! test -f /etc/openvpn/update-resolv-conf; then
        mkdir -p "${_update_resolv_conf_src_dir}"

        git clone \
            https://github.com/masterkorp/openvpn-update-resolv-conf.git \
            "${_update_resolv_conf_src_dir}"

        _oldpath="$(pwd)"
        cd "${_update_resolv_conf_src_dir}"
        install -D -m655 update-resolv-conf.sh \
            "${pkgdir}/etc/openvpn/update-resolv-conf"
        cd "${_oldpath}"
    fi

    # Install protonvpn-cli package
    cd "${_protonvpn_src_dir}"
    install -Dm755 ./protonvpn-cli.sh "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/pvpn"

    # Install the license
    install -Dm644 ./license.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
