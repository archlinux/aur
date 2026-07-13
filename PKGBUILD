# Maintainer: enihcam <enihcam@noreply.gitcode.com>
pkgname=openjiuwen-server
pkgver=0.1.8
pkgrel=1
pkgdesc="OpenJiuwen Studio backend: FastAPI server, SQLAlchemy ORM, plugin manager, evaluation CLI (agenteval)"
arch=('x86_64')
url="https://gitcode.com/openJiuwen/agent-studio"
license=('Apache-2.0')
depends=(
    'python>=3.11.4'
    'python-fastapi'
    'python-uvicorn'
    'python-pydantic'
    'python-sqlalchemy'
    'python-alembic'
    'python-redis'
    'python-pymilvus<2.6.10'
    'python-jinja'
    'python-requests'
    'python-aiosqlite'
    'python-pymysql'
    'python-aiomysql'
    'python-pyjwt'
    'python-jose'
    'python-pycryptodome'
    'python-minio'
    'python-psutil'
    'python-yaml'
    'python-networkx'
    'python-numpy'
    'python-scipy'
    'python-greenlet'
    'python-protobuf'
    'python-apscheduler'
    'python-croniter'
    'python-click'
    'python-dotenv'
    'python-pydantic-settings'
    'python-telegram-bot'
    'python-slack-bolt'
    'python-mcp'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'redis: production session checkpointer (default uses in-memory)'
    'chromadb: in-process vector index (default; alternative to milvus)'
    'pymilvus: server-side vector index (requires MILVUS_HOST env var)'
    'mysql-server: production SQL backend (default uses sqlite)'
)
_srcdir_repo=agent-studio
source=("git+https://gitcode.com/openJiuwen/agent-studio.git#tag=v${pkgver}")
source+=("openjiuwen-server.service")
source+=("openjiuwen-server.sysusers")
source+=("openjiuwen-server.tmpfiles")
source+=("openjiuwen-server.install")
sha256sums=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')

build() {
    cd "${srcdir}/${_srcdir_repo:-agent-studio}/backend"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_srcdir_repo:-agent-studio}/backend"

    # Python package install
    python -m installer --destdir="${pkgdir}" --compile-bytecode=1 dist/*.whl

    # Move conflicting /opt entry to /opt/openjiuwen-studio for systemd
    install -dm755 "${pkgdir}/opt/openjiuwen-studio"
    cp -a "${pkgdir}/usr/lib/python3"*/site-packages/openjiuwen_studio \
          "${pkgdir}/opt/openjiuwen-studio/lib"
    rm -rf "${pkgdir}/usr/lib/python3"*/site-packages/openjiuwen_studio

    # Backend resources (alembic trees, configs)
    install -dm755 "${pkgdir}/opt/openjiuwen-studio/upgrade"
    cp -a upgrade "${pkgdir}/opt/openjiuwen-studio/"
    install -Dm644 alembic.ini "${pkgdir}/opt/openjiuwen-studio/alembic.ini"
    install -Dm644 main.py "${pkgdir}/opt/openjiuwen-studio/main.py"

    # Runtime directories
    install -dm750 "${pkgdir}/var/lib/openjiuwen-studio"
    install -dm755 "${pkgdir}/var/log/openjiuwen-studio"

    # Configuration template (installed but NOT activated — user copies & edits)
    install -Dm644 /dev/null "${pkgdir}/etc/openjiuwen-studio.env.example"
    cat > "${pkgdir}/etc/openjiuwen-studio.env.example" <<'EOF'
# OpenJiuwen Studio — copy to /etc/openjiuwen-studio.env and edit before first start.
# See README.md / docs/en/ for the full key list. The defaults below boot with sqlite + chroma.

DB_TYPE=sqlite
OPS_DB_NAME=openjiuwen_ops
AGENT_DB_NAME=openjiuwen_agent

INDEX_MANAGER_TYPE=chroma

RUNTIME_HOST=127.0.0.1
RUNTIME_PORT=8186
WORKFLOW_EXECUTE_TIMEOUT=300

# Required: generate with `python -c "import secrets; print(secrets.token_hex(32))"`
JWT_SECRET_KEY=change-me-before-production

# Optional — leave commented if you don't need them
# REDIS_HOST=127.0.0.1
# REDIS_PORT=6379
# MILVUS_HOST=127.0.0.1
# MILVUS_PORT=19530
# CODE_SANDBOX_URL=http://127.0.0.1:8190
EOF

    # License
    install -Dm644 "${srcdir}/agent-studio/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Systemd unit + sysusers + tmpfiles + install hook
    install -Dm644 "${srcdir}/openjiuwen-server.service" \
        "${pkgdir}/usr/lib/systemd/system/openjiuwen-server.service"
    install -Dm644 "${srcdir}/openjiuwen-server.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/openjiuwen-server.conf"
    install -Dm644 "${srcdir}/openjiuwen-server.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/openjiuwen-server.conf"
    install -Dm755 "${srcdir}/openjiuwen-server.install" \
        "${pkgdir}/usr/share/libalpm/scripts/openjiuwen-server.install"
}