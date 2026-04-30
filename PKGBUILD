# Maintainer: snapetech <slskdn@proton.me>
# slskdn - Unofficial slskd fork with batteries-included Soulseek features
pkgname=slskdn-bin
_pkgname=slskd
pkgver=2026042900.slskdn.204
pkgrel=1
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
)
noextract=("slskdn-${pkgver}-main-linux-glibc-x64.zip")
# Note: First hash is SKIP (zip changes each release), others are static file hashes
sha256sums=('SKIP' '9724a9ad5790fa011868c3777cbdb9e41224c3b612e7c47990c524f8659ab278' '6d60a8a8ec79b1df0f5839e9a5ba8a77a021cc457fa138a62b58f4321b3a16df' '28b6c2c8d969a91bc8b5ae3e7289562928fff39ed07b92973e5b93fa45033056')

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
    install -Dm644 "${srcdir}/slskd.yml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"

    install -dm755 "${pkgdir}/var/lib/${_pkgname}"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/downloads"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/incomplete"
}
