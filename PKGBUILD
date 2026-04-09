# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=13
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('x86_64')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=('python>=3.11')
makedepends=('python')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
options=('!strip')

build() {
    # Isolated venv — no PEP 668, no system interference
    python -m venv "${srcdir}/venv"
    "${srcdir}/venv/bin/pip" install \
        --no-cache-dir \
        --only-binary=:all: \
        "agent-rtfm==${pkgver}"
}

package() {
    _pyver=$(python -c 'import sys;print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    # Copy site-packages from venv
    install -dm755 "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    cp -a "${srcdir}/venv/lib/python"*/site-packages/* \
        "${pkgdir}/usr/lib/python${_pyver}/site-packages/"

    # Remove pip/setuptools/wheel that came with venv
    rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/pip"*
    rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/setuptools"*
    rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/wheel"*
    rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/_distutils_hack"*
    rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/distutils-precedence.pth"
    rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/pkg_resources"*

    # Remove packages that exist in Arch official repos to avoid conflicts
    for pkg in \
        fastapi uvicorn starlette anyio sniffio httptools watchfiles \
        click rich pygments markdown_it_py mdurl \
        httpx httpcore certifi idna \
        pydantic pydantic_core annotated_types \
        numpy scipy sympy mpmath \
        yaml pyyaml requests urllib3 charset_normalizer oauthlib \
        gitdb smmap gitpython git \
        beautifulsoup4 bs4 soupsieve lxml html2text markdownify \
        jsonschema jsonschema_specifications referencing rpds \
        typing_extensions zipp importlib_metadata \
        tqdm coloredlogs humanfriendly overrides wrapt deprecated \
        tenacity bcrypt grpcio orjson \
        jinja2 markupsafe \
        websockets python_dotenv dotenv \
        build pyproject_hooks packaging
    do
        rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/${pkg}"
        rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/${pkg}"*.dist-info
        rm -rf "${pkgdir}/usr/lib/python${_pyver}/site-packages/${pkg//_/-}"*.dist-info
    done

    # Clean entry point
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/rtfm" << 'SCRIPT'
#!/usr/bin/env python
from rtfm.cli import cli
cli()
SCRIPT
    chmod 755 "${pkgdir}/usr/bin/rtfm"
}
