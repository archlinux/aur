# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blackiceprog-git
pkgver=r4.8b6667d
pkgrel=1
pkgdesc='Programmer for the blackice FPGAs by myStorm (https://mystorm.uk/)'
url='https://github.com/jpenalbae/black-iceprog'
license=('GPL-3.0-only')
arch=(any)
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
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     python setup.py test
# }

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
