# Maintainer: enihcam <enihcam@noreply.gitcode.com>
pkgname=openjiuwen-sandbox
pkgver=0.1.8
pkgrel=1
pkgdesc="OpenJiuwen sandbox + gateway: code-execution sandbox server and gateway proxy"
arch=('x86_64')
url="https://gitcode.com/openJiuwen/agent-studio"
license=('Apache-2.0')
depends=(
    'python>=3.11.4'
    'python-fastapi>=0.124.0'
    'uvicorn>=0.38.0'
    'python-httpx>=0.28.0'
    'python-yaml'
    'python-dotenv'
    'python-libseccomp-git'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'openjiuwen-server: backend that consumes this sandbox via CODE_SANDBOX_URL'
)
_srcdir_repo=agent-studio
source=("git+https://gitcode.com/openJiuwen/agent-studio.git#tag=v${pkgver}")
source+=("openjiuwen-sandbox.service")
source+=("openjiuwen-sandbox-gateway.service")
source+=("openjiuwen-sandbox.sysusers")
source+=("openjiuwen-sandbox.tmpfiles")
sha256sums=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')

build() {
    local srcdir_top="${srcdir}/${_srcdir_repo:-agent-studio}"

    cd "${srcdir_top}/sandbox_server/sandbox"
    python -m build --wheel --no-isolation

    cd "${srcdir_top}/sandbox_server/gateway"
    python -m build --wheel --no-isolation
}

package() {
    local srcdir_top="${srcdir}/${_srcdir_repo:-agent-studio}"

    # Install both wheels into separate staging dirs, then merge. Using separate
    # dirs avoids installer failing with FileExistsError if a previous failed
    # build left stale files at ${srcdir}/staging (makepkg does not auto-clean
    # its workdir between runs without -C).
    local staging_s="${srcdir}/staging-sandbox"
    local staging_g="${srcdir}/staging-gateway"
    rm -rf "${staging_s}" "${staging_g}"
    install -dm755 "${staging_s}" "${staging_g}"
    python -m installer --destdir="${staging_s}" --compile-bytecode=1 \
        "${srcdir_top}/sandbox_server/sandbox/dist/"*.whl
    python -m installer --destdir="${staging_g}" --compile-bytecode=1 \
        "${srcdir_top}/sandbox_server/gateway/dist/"*.whl

    # Merge into one staging tree for the move into /opt
    local staging="${srcdir}/staging"
    rm -rf "${staging}"
    install -dm755 "${staging}"
    cp -a "${staging_s}/." "${staging}/"
    cp -a "${staging_g}/." "${staging}/"

    # Lay out /opt/openjiuwen-sandbox
    install -dm755 "${pkgdir}/opt/openjiuwen-sandbox/lib"
    cp -a "${staging}/usr/lib/python3"*/site-packages/. \
          "${pkgdir}/opt/openjiuwen-sandbox/lib/"

    # Runtime / state dirs
    install -dm750 "${pkgdir}/var/lib/openjiuwen-sandbox"
    install -dm755 "${pkgdir}/var/log/openjiuwen-sandbox"

    # Licenses
    install -Dm644 "${srcdir_top}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Systemd units (two services in one package)
    install -Dm644 "${srcdir}/openjiuwen-sandbox.service" \
        "${pkgdir}/usr/lib/systemd/system/openjiuwen-sandbox.service"
    install -Dm644 "${srcdir}/openjiuwen-sandbox-gateway.service" \
        "${pkgdir}/usr/lib/systemd/system/openjiuwen-sandbox-gateway.service"

    install -Dm644 "${srcdir}/openjiuwen-sandbox.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/openjiuwen-sandbox.conf"
    install -Dm644 "${srcdir}/openjiuwen-sandbox.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/openjiuwen-sandbox.conf"
}