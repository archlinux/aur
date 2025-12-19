# Maintainer: Joaquim Monteiro <joaquim dot monteiro at protonmail dot com>

pkgname=python-qasync-git
pkgver=0.28.0.r33.g0e369e4
pkgrel=1
pkgdesc="Python library for using asyncio in Qt-based applications (Git version)"
arch=(any)
url="https://github.com/CabbageDevelopment/qasync"
license=("BSD")

depends=("python")
makedepends=("git" "python-build" "python-installer" "python-uv-build")
optdepends=("python-pyqt5: PyQt5 support"
            "python-pyqt6: PyQt6 support"
            "pyside2: PySide2 support"
            "pyside6: PySide6 support")
provides=("python-qasync")
conflicts=("python-qasync")

source=("qasync::git+https://github.com/CabbageDevelopment/qasync.git")
sha512sums=("SKIP")

pkgver() {
    cd qasync
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
    cd qasync
    sed -i -E 's/requires\s*=\s*\[\s*"uv_build[^"]*"\s*\]/requires = \["uv_build"\]/' pyproject.toml
}

build() {
    cd qasync
    [[ -d dist/ ]] && rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd qasync
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
