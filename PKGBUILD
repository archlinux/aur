# Maintainer: snapetech <slskdn@proton.me>
# slskdn - Unofficial slskd fork with batteries-included Soulseek features (build from source)
pkgname=slskdn
_pkgname=slskd
pkgver=2026050500.slskdn.224
pkgrel=5
_archive_root="slskdN-${pkgver//.slskdn/-slskdn}"
pkgdesc="slskdN, an unofficial batteries-included fork of slskd with SongID, Discovery Graph, multi-source downloads, DHT mesh networking, auto-replace, wishlist, and security hardening."
arch=('x86_64' 'aarch64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'aspnet-runtime-10.0' 'yt-dlp')
makedepends=('dotnet-sdk-10.0' 'dotnet-runtime-10.0' 'aspnet-runtime-10.0' 'nodejs' 'npm')
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
    "${pkgname}-${pkgver}.tar.gz::https://github.com/snapetech/slskdn/archive/refs/tags/${pkgver//.slskdn/-slskdn}.tar.gz"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
    "slskd.tmpfiles"
)
# Note: First hash is SKIP (tarball changes each release), others are static file hashes
sha256sums=('SKIP' '123cb6af52ee33d04f308751929f662c1437221937eeca9a896a60f746074177' '6d60a8a8ec79b1df0f5839e9a5ba8a77a021cc457fa138a62b58f4321b3a16df' '28b6c2c8d969a91bc8b5ae3e7289562928fff39ed07b92973e5b93fa45033056' '949f950aeb0f24725c901ed9d73a4f679ae8eb4abdfaf108b80e62e6247b85e5')

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

    cd src/web
    npm ci --legacy-peer-deps
    DISABLE_ESLINT_PLUGIN=true npm run build
    cd ../..

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
        --self-contained false \
        -r "${_rid}" \
        -p:Version="$_dotnet_version" \
        -p:InformationalVersion="$_version" \
        -p:PackageVersion="$_dotnet_version" \
        -p:AllowMissingPrunePackageData=true
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

    install -dm755 "${pkgdir}/var/lib/${_pkgname}"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/downloads"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/incomplete"
}
