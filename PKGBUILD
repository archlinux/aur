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

# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>
# Contributor: txtsd

pkgname=python-mempalace
pkgver=3.3.1
pkgrel=3
pkgdesc='The highest-scoring AI memory system, with 30x context compression and a temporal knowledge graph.'
arch=('any')
url='https://github.com/milla-jovovich/mempalace'
license=('MIT')
depends=('python' 'python-onnxruntime')
provides=('mempalace')
conflicts=('mempalace')
source=("https://files.pythonhosted.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-$pkgver.tar.gz")
sha256sums=('abdd98e0c4e7afa3a7c85b1f8b410ee8034c4a0f9fef14ddff1ffc30fcba620d')

build() {
    python -m venv --system-site-packages "${srcdir}/venv"
    "${srcdir}/venv/bin/pip" install --no-cache-dir "mempalace==${pkgver}"
}

package() {
    install -d "${pkgdir}/opt/mempalace"
    cp -a "${srcdir}/venv"/* "${pkgdir}/opt/mempalace/"

    local _srcvenv="${srcdir}/venv"
    local _dstvenv="/opt/mempalace"

    sed -i "s|${_srcvenv}|${_dstvenv}|g" "${pkgdir}${_dstvenv}/pyvenv.cfg"
    find "${pkgdir}${_dstvenv}/bin" -type f -exec \
        sed -i "s|${_srcvenv}|${_dstvenv}|g" {} +

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mempalace" <<'WRAPPER'
#!/bin/bash
exec /opt/mempalace/bin/python -m mempalace "$@"
WRAPPER

    install -Dm644 "${srcdir}/${pkgname:7}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
