# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=qt-web-extractor
pkgver=r50.20260809.02f4e04
pkgrel=1
pkgdesc='Qt WebEngine based web content extractor with HTTP server'
arch=('any')
url='https://github.com/wszqkzqk/qt-web-extractor'
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'qt6-webengine')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=('etc/qt-web-extractor.conf')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}"
    python -m unittest discover -s tests -v
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 qt-web-extractor.service "${pkgdir}/usr/lib/systemd/system/qt-web-extractor.service"
    install -Dm644 qt-web-extractor.conf.example "${pkgdir}/etc/qt-web-extractor.conf"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
