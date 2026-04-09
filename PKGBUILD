# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=12
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('x86_64')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=(
    'python>=3.11'
    'python-fastapi'
    'uvicorn'
    'python-gitpython'
    'python-httpx'
    'python-click'
    'python-rich'
    'python-pyyaml'
    'python-html2text'
    'python-beautifulsoup4'
    'python-lxml'
    'python-markdownify'
)
makedepends=('python-installer' 'uv')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
source=("https://files.pythonhosted.org/packages/py3/a/agent_rtfm/agent_rtfm-${pkgver}-py3-none-any.whl")
sha256sums=('SKIP')
noextract=("agent_rtfm-${pkgver}-py3-none-any.whl")

_bundledir="opt/agent-rtfm/lib"

build() {
    # Install chromadb + its pip-only deps into a self-contained bundle dir.
    # This avoids depending on python-chromadb from AUR which causes
    # resolution failures in AUR helpers.
    uv pip install \
        --target="${srcdir}/bundle" \
        --only-binary=:all: \
        --no-compile \
        --python-version=3.13 \
        chromadb
}

package() {
    # 1. Install agent-rtfm wheel into standard site-packages
    python -m installer --destdir="${pkgdir}" \
        "${srcdir}/agent_rtfm-${pkgver}-py3-none-any.whl"

    # 2. Bundle chromadb + pip-only deps into /opt/agent-rtfm/lib
    install -dm755 "${pkgdir}/${_bundledir}"
    cp -a "${srcdir}/bundle/"* "${pkgdir}/${_bundledir}/"

    # Remove packages from bundle that are already in system site-packages
    # (installed via depends) to avoid duplicates
    _pyver=$(python -c 'import sys;print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    _syspkg="/usr/lib/python${_pyver}/site-packages"
    for item in "${pkgdir}/${_bundledir}/"*; do
        name=$(basename "$item")
        if [ -e "${_syspkg}/${name}" ]; then
            rm -rf "$item"
        fi
    done

    # Remove bundled bin scripts (they conflict with system packages)
    rm -rf "${pkgdir}/${_bundledir}/bin"

    # 3. Add a .pth file so Python finds the bundled packages
    _dest_sitepkg="${pkgdir}/usr/lib/python${_pyver}/site-packages"
    echo "/${_bundledir}" > "${_dest_sitepkg}/agent-rtfm-bundled.pth"
}
