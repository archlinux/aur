# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=6
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
    'python-yaml'
    'python-requests'
    'python-zipp'
)
makedepends=('uv' 'python-installer')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
options=('!strip')

# Packages already provided by Arch repos — exclude from wheel download
# to avoid file conflicts with pacman-managed packages
_excluded=(
    fastapi uvicorn gitpython httpx click rich pyyaml html2text
    beautifulsoup4 lxml markdownify numpy scipy sympy pyyaml
    requests urllib3 certifi charset-normalizer idna zipp
    sniffio anyio starlette typing-extensions annotated-types
    pydantic pydantic-core jinja2 markupsafe pygments markdown-it-py
    mdurl websockets httptools watchfiles python-dotenv
    smmap gitdb wrapt deprecated humanfriendly coloredlogs
    python-dateutil six pyasn1 pyasn1-modules rsa oauthlib
    requests-oauthlib cachetools google-auth mpmath
)

build() {
    _exclude_args=""
    for pkg in "${_excluded[@]}"; do
        _exclude_args="${_exclude_args} --no-binary :none:"
    done

    # Download only wheels not available in Arch repos
    uv pip download \
        --dest="${srcdir}/wheels" \
        --python-version "$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')" \
        --platform manylinux_2_17_x86_64 \
        --platform linux_x86_64 \
        --python-platform linux \
        "agent-rtfm==${pkgver}"

    # Remove wheels that conflict with system packages
    for pkg in "${_excluded[@]}"; do
        rm -f "${srcdir}/wheels/${pkg//-/_}"*.whl
        rm -f "${srcdir}/wheels/${pkg}"*.whl
    done
}

package() {
    for whl in "${srcdir}/wheels/"*.whl; do
        [ -f "$whl" ] || continue
        python -m installer --destdir="${pkgdir}" "$whl"
    done
}
