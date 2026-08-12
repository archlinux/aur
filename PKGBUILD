# Maintainer: Bryan Everly <bryan@theeverlys.com>
#
# AUR package — Phase 11.8 stub.
#
# pkgver is bumped to the release tag value by the ``aur`` job in
# build-and-release.yml at publish time; do not hand-edit when releasing.
# The ``0.0.0`` literal below is the sentinel sed-replace target.
#
# Dependency translation reference (see installer/opensuse/sysmanage-agent.spec
# and requirements.txt):
#   websockets   -> python-websockets
#   PyYAML       -> python-yaml
#   aiohttp      -> python-aiohttp
#   cryptography -> python-cryptography
#   psutil       -> python-psutil
#   bcrypt       -> python-bcrypt
#   aiofiles     -> python-aiofiles
#   SQLAlchemy   -> python-sqlalchemy
#   alembic      -> python-alembic
#   defusedxml   -> python-defusedxml
pkgname=sysmanage-agent
pkgver=3.5.1.11
pkgrel=1
pkgdesc="Cross-platform system management agent for SysManage"
arch=('any')
url="https://github.com/bceverly/sysmanage-agent"
license=('AGPL-3.0-or-later')
depends=(
    'python>=3.9'
    'python-aiohttp'
    'python-yaml'
    'python-bcrypt'
    'python-psutil'
    'python-cryptography'
    'python-websockets'
    'python-sqlalchemy'
    'python-aiofiles'
    'python-alembic'
    'python-defusedxml'
)
makedepends=('python-setuptools')
backup=('etc/sysmanage-agent.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bceverly/sysmanage-agent/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('132b7ca122c0740766c615ce18530d9f17a460827ee4b60bf635ee99d03d79c7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the agent script + supporting Python tree under
    # /usr/lib/sysmanage-agent (Arch convention for non-package
    # Python apps that ship as a runnable directory).
    install -d "${pkgdir}/usr/lib/${pkgname}"
    install -m 0644 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"
    install -m 0644 alembic.ini "${pkgdir}/usr/lib/${pkgname}/alembic.ini"
    cp -r src "${pkgdir}/usr/lib/${pkgname}/"
    [ -d alembic ] && cp -r alembic "${pkgdir}/usr/lib/${pkgname}/" || true

    # Console launcher
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'LAUNCH_EOF'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/sysmanage-agent/main.py "$@"
LAUNCH_EOF
    chmod 0755 "${pkgdir}/usr/bin/${pkgname}"

    # systemd unit
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -m 0644 installer/opensuse/sysmanage-agent.service \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # Example config — package owns this path via the ``backup=()`` entry
    # so pacman keeps user edits on upgrade.
    install -d "${pkgdir}/etc"
    install -m 0640 sysmanage-agent-system.yaml \
        "${pkgdir}/etc/sysmanage-agent.yaml"

    # License + docs
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
