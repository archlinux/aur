# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=guiless-search
pkgver=r16.20260812.368db8d
pkgrel=1
pkgdesc='Multi-backend headless web search proxy'
arch=('any')
url='https://github.com/wszqkzqk/guiless-search'
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'qt6-webengine')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=('etc/guiless-search.conf')
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
    install -Dm644 guiless-search.service "${pkgdir}/usr/lib/systemd/system/guiless-search.service"
    install -Dm644 guiless-search.conf.example "${pkgdir}/etc/guiless-search.conf"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
