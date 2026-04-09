# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=8
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('any')
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
    'python-numpy'
    'python-scipy'
    'python-sympy'
    'python-requests'
    'python-zipp'
)
makedepends=('uv' 'python-installer')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
options=('!strip')

build() {
    uv pip install \
        --target="${srcdir}/target" \
        --no-compile \
        "agent-rtfm==${pkgver}"
}

package() {
    _pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    _syspkg="/usr/lib/python${_pyver}/site-packages"
    _destpkg="${pkgdir}${_syspkg}"
    mkdir -p "${_destpkg}"

    # Only install dirs/files that don't already exist in system site-packages
    for item in "${srcdir}/target/"*; do
        name=$(basename "$item")
        if [ ! -e "${_syspkg}/${name}" ]; then
            cp -a "$item" "${_destpkg}/"
        fi
    done

    # Only install the rtfm script, skip all other bin scripts
    # (they belong to dependency packages managed by pacman)
    install -dm755 "${pkgdir}/usr/bin"
    if [ -f "${srcdir}/target/bin/rtfm" ]; then
        install -m755 "${srcdir}/target/bin/rtfm" "${pkgdir}/usr/bin/rtfm"
    fi
}
