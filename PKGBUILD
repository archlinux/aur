# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-wifit3
_name=${pkgname#python-}
pkgver=0.4.3
pkgrel=1
pkgdesc="A standalone USB Wi-Fi auditor"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/derv82/wifit3"
_pydeps=(
    platformdirs
    pyusb
    rich
    textual
    zstandard

    libusb-package
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=()
license=('GPL-2.0-only')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('5e3f793199a36d29cb132f0c6a215442e803270cc25485804b1538e0e64f0206')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
