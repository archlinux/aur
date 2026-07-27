# Maintainer: snapetech <slskdn@proton.me>
# slskdn - Unofficial slskd fork with batteries-included Soulseek features
pkgname=slskdn-bin
_pkgname=slskd
pkgver=2026072716.slskdn.291
pkgrel=4
pkgdesc="slskdN, an unofficial batteries-included fork of slskd with SongID, Discovery Graph, multi-source downloads, DHT mesh networking, auto-replace, wishlist, and security hardening."
arch=('x86_64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('unzip')
optdepends=(
    'docker: for containerized deployment'
    'ffmpeg: for audio decoding and SongID media handling'
    'python: for SongID Python tooling'
    'python-torchaudio: optional enhancement for advanced Python-based fingerprint and analysis workflows in SongID'
)
provides=('slskdn')
conflicts=('slskd' 'slskd-bin' 'slskdN')
backup=('etc/slskd/slskd.yml')
options=('!strip')
install=slskd.install
source=(
    "slskdn-${pkgver}-main-linux-glibc-x64.zip::https://github.com/snapetech/slskdn/releases/download/${pkgver//.slskdn/-slskdn}/slskdn-main-linux-glibc-x64.zip"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
    "slskd.tmpfiles"
)
noextract=("slskdn-${pkgver}-main-linux-glibc-x64.zip")
# Note: First hash is SKIP (zip changes each release), others are static file hashes
sha256sums=('SKIP' '123cb6af52ee33d04f308751929f662c1437221937eeca9a896a60f746074177' '4e5d4be130945d26fca280da86456926be3fb7631c42df9ac505051fc3ca4de6' '28b6c2c8d969a91bc8b5ae3e7289562928fff39ed07b92973e5b93fa45033056' '949f950aeb0f24725c901ed9d73a4f679ae8eb4abdfaf108b80e62e6247b85e5')

package() {
    local app_root="${pkgdir}/usr/lib/${_pkgname}"
    local release_root="${app_root}/releases/${pkgver}"
    local archive="${srcdir}/slskdn-${pkgver}-main-linux-glibc-x64.zip"
    local stage_root
    stage_root="$(mktemp -d)"
    trap 'rm -rf "${stage_root}"' RETURN

    install -dm755 "${release_root}"
    unzip -q "${archive}" -d "${stage_root}"

    [[ -x "${stage_root}/slskd" ]] || { echo "Missing apphost in ${archive}" >&2; return 1; }
    [[ -f "${stage_root}/slskd.deps.json" ]] || { echo "Missing deps file in ${archive}" >&2; return 1; }
    [[ -f "${stage_root}/Microsoft.AspNetCore.Diagnostics.Abstractions.dll" ]] || {
        echo "Missing Microsoft.AspNetCore.Diagnostics.Abstractions.dll in ${archive}" >&2
        return 1
    }

    cp -a "${stage_root}"/. "${release_root}/"

    chmod -R u=rwX,go=rX "${release_root}"
    chmod 755 "${release_root}/slskd"
    ln -sfn "releases/${pkgver}" "${app_root}/current"

    cat > "${app_root}/slskd" <<'EOF'
#!/bin/sh
exec /usr/lib/slskd/current/slskd "$@"
EOF
    chmod 755 "${app_root}/slskd"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${_pkgname}/slskd" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/slskd.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/slskd.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/slskd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/slskd.yml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"

    if [[ -x "${stage_root}/vpn-agent/slskdN-vpn-agent" ]]; then
        install -Dm755 "${stage_root}/vpn-agent/slskdN-vpn-agent" "${pkgdir}/usr/bin/slskdN-vpn-agent"
        install_vpn_unit "${stage_root}/vpn-agent/systemd/slskdN-vpn-split.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-split.service"
        install_vpn_unit "${stage_root}/vpn-agent/systemd/slskdN-vpn-ingress.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-ingress.service"
        install -Dm644 "${stage_root}/vpn-agent/systemd/slskdN-vpn-ingress-renew.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-ingress-renew.service"
        install -Dm644 "${stage_root}/vpn-agent/systemd/slskdN-vpn-ingress-renew.timer" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-ingress-renew.timer"
        install_vpn_unit "${stage_root}/vpn-agent/systemd/slskdN-vpn-gluetun-compat.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-gluetun-compat.service"
        install_vpn_unit "${stage_root}/vpn-agent/systemd/slskdN-vpn-watchdog.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-watchdog.service"
        install -Dm644 "${stage_root}/vpn-agent/systemd/slskdN-vpn-watchdog.timer" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-watchdog.timer"
    fi

    install -dm775 "${pkgdir}/var/lib/${_pkgname}"
    install -dm775 "${pkgdir}/var/lib/${_pkgname}/downloads"
    install -dm775 "${pkgdir}/var/lib/${_pkgname}/incomplete"
    install -dm755 "${pkgdir}/var/lib/slskdN-vpn"
}

install_vpn_unit() {
    local src="$1"
    local dst="$2"

    install -Dm644 "$src" "$dst"
    sed -i \
        -e 's#/usr/local/bin/slskdN-vpn-agent#/usr/bin/slskdN-vpn-agent#g' \
        -e 's#slskdN\.service#slskd.service#g' \
        -e '/^Environment=SLSKDN_CONFIG=/d' \
        -e '/^Environment=SLSKDN_SERVICE_USER=/d' \
        -e '/^Environment=SLSKDN_PROCESS_NAME=/d' \
        -e '/^Environment=SLSKDN_SERVICE_NAME=/d' \
        "$dst"
    sed -i '/^\[Service\]/a Environment=SLSKDN_CONFIG=/etc/slskd/slskd.yml\nEnvironment=SLSKDN_SERVICE_USER=slskd\nEnvironment=SLSKDN_PROCESS_NAME=slskd\nEnvironment=SLSKDN_SERVICE_NAME=slskd' "$dst"
}
