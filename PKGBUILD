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
pkgver=3.1.0
pkgrel=6
pkgdesc='The highest-scoring AI memory system, with 30x context compression and a temporal knowledge graph.'
arch=('any')
url='https://github.com/milla-jovovich/mempalace'
license=('MIT')

# We depend on the system onnxruntime-cuda to ensure compatibility with 
# the system's CUDA version (especially for CUDA 13+).
depends=('python' 'python-onnxruntime-cuda')

provides=('mempalace')
conflicts=('mempalace')

# No makedepends needed beyond python (venv and pip are stdlib/bundled).
makedepends=()

source=("https://files.pythonhosted.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-$pkgver.tar.gz")
sha256sums=('13dd0d47fb4d5b3dc17993e1e2e058144979469dd5ebd5eef34808681d6dd3d2')

build() {
    # Create a virtualenv and install mempalace + all its dependencies via pip.
    # Using --system-site-packages to leverage the system's onnxruntime-cuda.
    python -m venv --system-site-packages "${srcdir}/venv"
    "${srcdir}/venv/bin/pip" install --no-cache-dir "mempalace==${pkgver}"
}

package() {
    # Install the virtualenv to /opt/mempalace/
    install -d "${pkgdir}/opt/mempalace"
    cp -a "${srcdir}/venv"/* "${pkgdir}/opt/mempalace/"

    # Fix shebang and path references from build-time srcdir to final /opt path.
    local _srcvenv="${srcdir}/venv"
    local _dstvenv="/opt/mempalace"

    # Rewrite the venv config
    sed -i "s|${_srcvenv}|${_dstvenv}|g" "${pkgdir}${_dstvenv}/pyvenv.cfg"

    # Rewrite shebangs and path refs in all bin/ scripts
    find "${pkgdir}${_dstvenv}/bin" -type f -exec \
        sed -i "s|${_srcvenv}|${_dstvenv}|g" {} +

    # Patch ChromaDB to disable DnnlExecutionProvider which is broken in current Arch packages.
    # This ensures it correctly falls back to CUDA or CPU without fatal errors.
    local _ef_file=$(find "${pkgdir}${_dstvenv}/lib" -name "onnx_mini_lm_l6_v2.py")
    if [ -f "${_ef_file}" ]; then
        sed -i '/"CoreMLExecutionProvider" in self._preferred_providers/,+2a \
\
        if (\
            self._preferred_providers\
            and "DnnlExecutionProvider" in self._preferred_providers\
        ):\
            # remove DnnlExecutionProvider from the list, it is broken in some Arch packages.\
            self._preferred_providers.remove("DnnlExecutionProvider")' "${_ef_file}"
    fi

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
