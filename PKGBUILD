# Maintainer: Julian Xhokaxhiu <https://julianxhokaxhiu.com>

pkgname=anythingllm-web
pkgver=1.13.0
pkgrel=5
pkgdesc="All-in-one AI application for RAG, AI agents, and full LLM support"
arch=('x86_64' 'aarch64')
url="https://github.com/Mintplex-Labs/anything-llm"
license=('MIT')
depends=('nodejs-lts-krypton' 'npm' 'chromium')
makedepends=('yarn-berry')
backup=("etc/anythingllm/server.env")
options=(!strip !debug)
install=anythingllm.install
source=(
    "anything-llm-${pkgver}.tar.gz::https://github.com/Mintplex-Labs/anything-llm/archive/refs/tags/v${pkgver}.tar.gz"
    "anythingllm-server.service"
    "anythingllm-collector.service"
    "anythingllm.sysusers"
    "anythingllm.tmpfiles"
    "anythingllm.install"
    "anythingllm-server.env"
)
sha256sums=('818df288f5bd2e256e50c9aad0f157c0bd788e8082372a7ae908c5ef30c4b603'
            '5d238a1543fa11a37059013be0b3f5f54e0a10fad5135a727749a3e24a1038a5'
            'ded32c336e3ed0038718c1aff5347d0b2a3b4d0a733760a4c37e3b7db9a022e0'
            'a14f374ca98adc1a563d73dddbb09a4956387c49287eca1df798e4783d880474'
            'b7ec557af6710dce498a05f3d53ce337752a5727fa2975b1a4698b575e478ffe'
            '3c9b6a5bdf381b04294f68004ad595e2ee85a27d34fbf214bbae06e9d8cfccc6'
            '44ecfa87e5efc496e9154e8f9d7b68a34b32615a32a21fe159a0eb41c2ca8969')

_installdir="/srv/anythingllm"
_storagedir="/var/lib/anythingllm"
_logdir="/var/log/anythingllm"
_confdir="/etc/anythingllm"

prepare() {
    cd "${srcdir}/anything-llm-${pkgver}"

    cp frontend/.env.example frontend/.env

    # Set the frontend API base for production deployment
    sed -i \
        "s|^# VITE_API_BASE='/api'.*|VITE_API_BASE='/api'|" \
        frontend/.env
    sed -i \
        "s|^VITE_API_BASE='http://localhost|# VITE_API_BASE='http://localhost|" \
        frontend/.env

    # Prevent build-time environment (including $srcdir paths) from being
    # serialised into the frontend bundle via Vite's process.env expansion.
    sed -i \
        's|"process\.env": process\.env|"process.env": {}|' \
        frontend/vite.config.js
}

build() {
    cd "${srcdir}/anything-llm-${pkgver}"

    cd frontend && yarn install && yarn cache clean && yarn build && cd ..
    cd server && yarn install && yarn cache clean && cd ..
    cd collector && yarn install && yarn cache clean && cd ..
}

package() {
    cd "${srcdir}/anything-llm-${pkgver}"

    install -dm750 "${pkgdir}${_installdir}"

    install -dm750 "${pkgdir}${_installdir}/server"
    cp -a server/. "${pkgdir}${_installdir}/server/"

    install -dm750 "${pkgdir}${_installdir}/collector"
    cp -a collector/. "${pkgdir}${_installdir}/collector/"

    install -dm750 "${pkgdir}${_installdir}/server/public"
    cp -r frontend/dist/. "${pkgdir}${_installdir}/server/public/"

    # ── Patch Prisma client: fix hard-coded build-time engine path ────────────
    local prisma_client="${pkgdir}${_installdir}/server/node_modules/.prisma/client"
    for f in "${prisma_client}/index.js" "${prisma_client}/edge.js"; do
        [[ -f "$f" ]] && sed -i \
            "s|${srcdir}/anything-llm-${pkgver}/server|${_installdir}/server|g" "$f"
    done

    # ── Storage, log, config directories ─────────────────────────────────────
    install -dm750 "${pkgdir}${_storagedir}"
    install -dm750 "${pkgdir}${_logdir}"
    install -dm750 "${pkgdir}${_confdir}"
    install -Dm640 "${srcdir}/anythingllm-server.env" "${pkgdir}${_confdir}/server.env"

    # ── Systemd units ─────────────────────────────────────────────────────────
    install -Dm644 "${srcdir}/anythingllm-server.service" \
        "${pkgdir}/usr/lib/systemd/system/anythingllm-server.service"
    install -Dm644 "${srcdir}/anythingllm-collector.service" \
        "${pkgdir}/usr/lib/systemd/system/anythingllm-collector.service"

    # ── sysusers / tmpfiles ───────────────────────────────────────────────────
    install -Dm644 "${srcdir}/anythingllm.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/anythingllm.conf"
    install -Dm644 "${srcdir}/anythingllm.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/anythingllm.conf"

    # ── License ───────────────────────────────────────────────────────────────
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
