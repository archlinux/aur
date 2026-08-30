# Maintainer: Bryan Everly <bryan@theeverlys.com>
#
# AUR package — sysmanage (server) — Phase 11.8 stub.
#
# pkgver is bumped to the release tag value by the ``aur`` job in
# .github/workflows/build-and-release.yml at publish time; do not
# hand-edit when releasing.  The ``0.0.0`` literal below is the sentinel
# sed-replace target.  The job also re-computes ``sha256sums=()`` against
# the GitHub source tarball, regenerates .SRCINFO via makepkg, and SSH-
# pushes to ssh://aur@aur.archlinux.org/sysmanage.git when
# ``aur_mode=publish`` AND the ``AUR_SSH_KEY`` repo secret is present.
#
# Dependency translation reference (see installer/opensuse/sysmanage.spec
# and requirements.txt):
#   FastAPI / Starlette / Uvicorn / SQLAlchemy / Alembic / psycopg /
#   aiohttp / cryptography / bcrypt / argon2-cffi / PyYAML / Pillow /
#   defusedxml / Jinja2 / orjson / Mako / etc.
#
# PostgreSQL 15+ and nginx are runtime deps (matches the RPM spec which
# pins postgresql-server >= 12 and Requires: nginx).
pkgname=sysmanage
pkgver=3.7.0.3
pkgrel=1
pkgdesc="Centralized system management server with web-based interface"
arch=('any')
url="https://github.com/bceverly/sysmanage"
license=('AGPL-3.0-only')
depends=(
    'python>=3.9'
    'postgresql>=15'
    'nginx'
    'python-aiohttp'
    'python-aiofiles'
    'python-alembic'
    'python-argon2-cffi'
    'python-bcrypt'
    'python-cryptography'
    'python-defusedxml'
    'python-fastapi'
    'python-httpx'
    'python-jinja'
    'python-mako'
    'python-markupsafe'
    'python-orjson'
    'python-pillow'
    'python-psutil'
    'python-psycopg'
    'python-pydantic'
    'python-pyyaml'
    'python-sqlalchemy'
    'python-starlette'
    'python-uvicorn'
    'python-websockets'
)
makedepends=('python-setuptools' 'python-pip')
backup=('etc/sysmanage.yaml' 'etc/nginx/conf.d/sysmanage-nginx.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bceverly/sysmanage/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a09990e3e54de2f00133153340897dab3fa76cbfb62f5a42db1ba8811fadc53')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install backend + supporting Python tree under /opt/sysmanage
    # (matches the RPM layout so configs / docs stay portable across
    # distros).
    install -d "${pkgdir}/opt/sysmanage"
    cp -r backend "${pkgdir}/opt/sysmanage/"
    cp -r alembic "${pkgdir}/opt/sysmanage/"
    install -m 0644 alembic.ini "${pkgdir}/opt/sysmanage/alembic.ini"
    install -m 0644 requirements.txt "${pkgdir}/opt/sysmanage/requirements.txt"
    install -m 0644 requirements-prod.txt "${pkgdir}/opt/sysmanage/requirements-prod.txt" 2>/dev/null || true
    cp -r config "${pkgdir}/opt/sysmanage/"
    cp -r scripts "${pkgdir}/opt/sysmanage/"

    # Air-gap bundle dispatcher template — buildAirGapBundle.sh (in
    # scripts/) resolves this relative to itself
    # (../installer/airgap-bundle/install.sh), so it must be packaged
    # alongside scripts/ or every bundle build dies at the "dispatcher
    # template not found" preflight.
    install -Dm0755 installer/airgap-bundle/install.sh "${pkgdir}/opt/sysmanage/installer/airgap-bundle/install.sh"

    # Pre-built frontend (dist + public) so the bootstrap nginx config
    # has something to serve out of the gate.
    install -d "${pkgdir}/opt/sysmanage/frontend"
    [ -d frontend/dist ] && cp -r frontend/dist "${pkgdir}/opt/sysmanage/frontend/" || true
    [ -d frontend/public ] && cp -r frontend/public "${pkgdir}/opt/sysmanage/frontend/" || true

    # Example config — package owns this path via the ``backup=()`` entry
    # so pacman keeps user edits on upgrade.
    install -d "${pkgdir}/etc"
    install -m 0640 installer/opensuse/sysmanage.yaml.example \
        "${pkgdir}/etc/sysmanage.yaml"

    # systemd unit
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -m 0644 installer/opensuse/sysmanage.service \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # nginx site config (Arch nginx ships /etc/nginx/conf.d/ as a drop-in
    # directory — mirror the RPM placement).
    install -d "${pkgdir}/etc/nginx/conf.d"
    install -m 0644 installer/opensuse/sysmanage-nginx.conf \
        "${pkgdir}/etc/nginx/conf.d/sysmanage-nginx.conf"

    # Var dirs (state + logs) — pacman won't create empty dirs without
    # us installing them.
    install -d "${pkgdir}/var/lib/${pkgname}"
    install -d "${pkgdir}/var/log/${pkgname}"

    # License + docs
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
