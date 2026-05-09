# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tinyfpgab-git
pkgver=r80.e8f9150
pkgrel=2
pkgdesc="Programmer for the TinyFPGA B2 boards"
arch=(any)
url="https://github.com/tinyfpga/TinyFPGA-B-Series"
license=('GPL-3.0-only')
depends=(
    python
    python-pyserial
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
	cd "${srcdir}/${pkgname}/programmer"
	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${pkgname}/programmer"
	pytest test.py
}

package() {
	cd "${srcdir}/${pkgname}/programmer"

	python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 ../LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
