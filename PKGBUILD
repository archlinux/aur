# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>

# This package uses a self-contained virtualenv installed to /opt/mempalace/.
# This approach is used because several of mempalace's Python dependencies
# (notably python-chromadb) are orphaned, outdated, or broken on the AUR,
# making a traditional depends-based PKGBUILD unreliable for end users.
#
# A virtualenv in /opt is an established pattern on AUR for complex Python
# applications with large dependency trees (cf. home-assistant-core, bazarr).
# All Python deps are installed via pip into the venv, keeping the system
# Python site-packages clean.

pkgname=python-mempalace
pkgver=3.0.0
pkgrel=3
pkgdesc='The highest-scoring AI memory system, with 30x context compression and a temporal knowledge graph.'
arch=('any')
url='https://github.com/milla-jovovich/mempalace'
license=('MIT')

# Only depend on the Python interpreter itself; all Python library deps are
# vendored inside the virtualenv at /opt/mempalace/.
depends=('python')

provides=('mempalace')
conflicts=('mempalace')

# No makedepends needed beyond python (venv and pip are stdlib/bundled).
makedepends=()

source=("${pkgname:7}-$pkgver.tar.gz::https://github.com/milla-jovovich/mempalace/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64f7c22d0fc50e26d0cd7746325e091e041f8863182e09c47b688bde070925c6')

build() {
    # Create a virtualenv and install mempalace + all its dependencies via pip.
    # Using --no-cache-dir to avoid polluting the build environment.
    python -m venv --system-site-packages "${srcdir}/venv"
    "${srcdir}/venv/bin/pip" install --no-cache-dir "mempalace==${pkgver}"
}

package() {
    # Install the virtualenv to /opt/mempalace/
    install -d "${pkgdir}/opt/mempalace"
    cp -a "${srcdir}/venv"/* "${pkgdir}/opt/mempalace/"

    # Fix shebang and path references from build-time srcdir to final /opt path.
    # virtualenv hardcodes absolute paths, so we need to rewrite them.
    local _srcvenv="${srcdir}/venv"
    local _dstvenv="/opt/mempalace"

    # Rewrite the venv config
    sed -i "s|${_srcvenv}|${_dstvenv}|g" "${pkgdir}${_dstvenv}/pyvenv.cfg"

    # Rewrite shebangs and path refs in all bin/ scripts
    find "${pkgdir}${_dstvenv}/bin" -type f -exec \
        sed -i "s|${_srcvenv}|${_dstvenv}|g" {} +

    # Install a wrapper script to /usr/bin/ so 'mempalace' is on PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mempalace" <<'WRAPPER'
#!/bin/bash
# Wrapper script for mempalace — delegates to the vendored virtualenv.
exec /opt/mempalace/bin/mempalace "$@"
WRAPPER

    # Install the license file from the source tarball
    install -Dm644 "${srcdir}/${pkgname:7}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
