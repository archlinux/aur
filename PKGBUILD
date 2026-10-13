# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-wifit3
_name=${pkgname#python-}
pkgver=0.4.5
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
sha256sums=('34ffe96898779c6be7e71878e7a770f830cf1cad0525a3829a0c8d47864f7859')

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
