# Maintainer: snapetech <slskdn@proton.me>
# slskdn - Unofficial slskd fork with batteries-included Soulseek features (build from source)
pkgname=slskdn
_pkgname=slskd
pkgver=2026111723.slskdn.354
_release_tag=v2026111723-slskdn.354
pkgrel=8
_archive_root="slskdN-${pkgver//.slskdn/-slskdn}"
pkgdesc="slskdN, an unofficial batteries-included fork of slskd with SongID, Discovery Graph, multi-source downloads, DHT mesh networking, auto-replace, wishlist, and security hardening."
arch=('x86_64' 'aarch64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'icu' 'krb5' 'openssl' 'zlib' 'yt-dlp')
makedepends=('nodejs' 'pnpm')
_dotnet_sdk_version=11.0.100
optdepends=(
    'docker: for containerized deployment'
    'ffmpeg: for audio decoding and SongID media handling'
    'python: for SongID Python tooling'
    'python-torchaudio: optional enhancement for advanced Python-based fingerprint and analysis workflows in SongID'
)
provides=('slskdn')
conflicts=('slskd' 'slskd-bin' 'slskdN-bin')
backup=('etc/slskd/slskd.yml')
install=slskd.install
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/snapetech/slskdn/archive/refs/tags/${_release_tag}.tar.gz"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
    "slskd.tmpfiles"
)
# Use a pinned SDK until the distribution can supply the required feature band.
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_dotnet_sdk_version}/dotnet-sdk-${_dotnet_sdk_version}-linux-x64.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_dotnet_sdk_version}/dotnet-sdk-${_dotnet_sdk_version}-linux-arm64.tar.gz")
sha512sums_x86_64=('1bec9cca2ec689b1e80245b84f2b53c9441d1aa6daccf2ceb27490768bffa95954fa585bd275def31069d874d543d9ba9e6591fe9ade2dbd9f34ec5c0fd0050c')
sha512sums_aarch64=('cfa248bb1377606e868602fb5b4d66fa16b7546156593937d1982f7f2142e6ded76d71c4a26efdab99f87c46ab40c3c672ab1b57ef7fa25449efe5b140a55af4')
noextract=("dotnet-sdk-${_dotnet_sdk_version}-linux-x64.tar.gz" "dotnet-sdk-${_dotnet_sdk_version}-linux-arm64.tar.gz")

# Note: First hash is SKIP (tarball changes each release), others are static file hashes
sha256sums=('SKIP' '123cb6af52ee33d04f308751929f662c1437221937eeca9a896a60f746074177' 'd1f8914fe41681eabfbf0c9da33202ab1079a1016dfd00fde5d36a327919c39e' '28b6c2c8d969a91bc8b5ae3e7289562928fff39ed07b92973e5b93fa45033056' '949f950aeb0f24725c901ed9d73a4f679ae8eb4abdfaf108b80e62e6247b85e5')

build() {
    cd "${srcdir}/${_archive_root}"

    local _rid
    case "${CARCH}" in
        x86_64)
            _rid=linux-x64
            ;;
        aarch64)
            _rid=linux-arm64
            ;;
        *)
            echo "Unsupported Arch build architecture: ${CARCH}" >&2
            return 1
            ;;
    esac

    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    mkdir -p "$DOTNET_ROOT"
    tar -xzf "${srcdir}/dotnet-sdk-${_dotnet_sdk_version}-${_rid}.tar.gz" -C "$DOTNET_ROOT"
    export PATH="$DOTNET_ROOT:$PATH"

    pnpm install --frozen-lockfile
    DISABLE_ESLINT_PLUGIN=true pnpm --filter @slskdn/web build

    rm -rf src/slskd/obj src/slskd/bin publish
    _version="${pkgver//.slskdn/-slskdn}"
    if [[ "${pkgver}" =~ ^([0-9]{10})\.slskdn\.([0-9]+)$ ]]; then
        _dotnet_version="0.0.0-slskdn.${BASH_REMATCH[1]}.${BASH_REMATCH[2]}"
    else
        _dotnet_version="${_version}"
    fi
    dotnet publish src/slskd/slskd.csproj \
        -c Release \
        -o publish \
        --self-contained true \
        -r "${_rid}" \
        -p:Version="$_dotnet_version" \
        -p:InformationalVersion="$_version" \
        -p:PackageVersion="$_dotnet_version" \
        -p:AllowMissingPrunePackageData=true

    dotnet publish src/slskdN.VpnAgent/slskdN-vpn-agent.csproj \
        -c Release \
        -o publish-vpn-agent \
        --self-contained true \
        -r "${_rid}" \
        -p:PublishSingleFile=true \
        -p:Version="$_dotnet_version" \
        -p:InformationalVersion="$_version" \
        -p:PackageVersion="$_dotnet_version"
}

package() {
    cd "${srcdir}/${_archive_root}"

    local app_root="${pkgdir}/usr/lib/${_pkgname}"
    local release_root="${app_root}/releases/${pkgver}"

    install -dm755 "${release_root}"
    cp -r publish/* "${release_root}/"

    install -dm755 "${release_root}/wwwroot"
    cp -r src/web/build/* "${release_root}/wwwroot/"

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

    install -Dm755 "publish-vpn-agent/slskdN-vpn-agent" "${pkgdir}/usr/bin/slskdN-vpn-agent"
    install_vpn_unit "src/slskdN.VpnAgent/systemd/slskdN-vpn-split.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-split.service"
    install_vpn_unit "src/slskdN.VpnAgent/systemd/slskdN-vpn-ingress.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-ingress.service"
    install -Dm644 "src/slskdN.VpnAgent/systemd/slskdN-vpn-ingress-renew.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-ingress-renew.service"
    install -Dm644 "src/slskdN.VpnAgent/systemd/slskdN-vpn-ingress-renew.timer" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-ingress-renew.timer"
    install_vpn_unit "src/slskdN.VpnAgent/systemd/slskdN-vpn-gluetun-compat.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-gluetun-compat.service"
    install_vpn_unit "src/slskdN.VpnAgent/systemd/slskdN-vpn-watchdog.service" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-watchdog.service"
    install -Dm644 "src/slskdN.VpnAgent/systemd/slskdN-vpn-watchdog.timer" "${pkgdir}/usr/lib/systemd/system/slskdN-vpn-watchdog.timer"

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
