# Maintainer: Julian Xhokaxhiu <https://julianxhokaxhiu.com>

pkgname=anythingllm-web
pkgver=1.13.0
pkgrel=1
pkgdesc="All-in-one AI application for RAG, AI agents, and full LLM support"
arch=('x86_64' 'aarch64')
url="https://github.com/Mintplex-Labs/anything-llm"
license=('MIT')
depends=('nodejs-lts' 'npm')
makedepends=('yarn')
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
            '54cdc3ac90ab367e12aeb0d52ccdca2e47930eee0c692d48a2c45e4ddd23f470'
            'f7bb05d1fc35e19abd44d0c9bc2be93cd02a7288ad9ac428daed0b5432addc06'
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
}

build() {
    cd "${srcdir}/anything-llm-${pkgver}"

    export YARN_CACHE_FOLDER="${srcdir}/.yarn-cache"
    yarn setup --frozen-lockfile --non-interactive

    cd frontend && yarn build && cd ..

    cd server && npx prisma generate --schema=./prisma/schema.prisma && cd ..
}

package() {
    cd "${srcdir}/anything-llm-${pkgver}"

    # ── Application files — owned by the service user so Prisma and any other
    #    runtime writes (engine cache, tmp files) succeed without extra config ──
    install -dm750 "${pkgdir}${_installdir}"

    install -dm750 "${pkgdir}${_installdir}/server"
    cp -r server/{index.js,package.json,prisma,utils,endpoints,swagger,node_modules,models,middleware,jobs} \
        "${pkgdir}${_installdir}/server/"

    install -dm750 "${pkgdir}${_installdir}/collector"
    cp -r collector/{index.js,package.json,utils,node_modules,middleware,extensions,hotdir,processLink,processRawText,processSingleFile} \
        "${pkgdir}${_installdir}/collector/"

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
