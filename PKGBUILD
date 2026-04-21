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
pkgver=3.3.2
pkgrel=2
pkgdesc='The highest-scoring AI memory system, with 30x context compression and a temporal knowledge graph.'
arch=('any')
url='https://github.com/milla-jovovich/mempalace'
license=('MIT')
depends=('python' 'python-onnxruntime' 'python-chromadb')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('mempalace')
conflicts=('mempalace')
source=("https://files.pythonhosted.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-$pkgver.tar.gz")
sha256sums=('c8087814b9db2026b945660549f9458a87d8f9b9eda6587a9b52c3c03928acb8')

build() {
    cd "${srcdir}/${pkgname:7}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname:7}-${pkgver}"
    
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mempalace" <<'WRAPPER'
#!/bin/bash
exec /usr/bin/python -m mempalace "$@"
WRAPPER

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}