# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/pyhamcrest-git

_pkgname=PyHamcrest
pkgbase=${_pkgname,,}-git
pkgname=(python{2,}-pyhamcrest-git)
pkgver=1.8.2.r18.g6d8389a
pkgrel=1
pkgdesc='A framework for writing matcher objects, allowing you to declaratively define "match" rules'
arch=('any')
url="https://github.com/hamcrest/PyHamcrest"
license=('BSD')
makedepends=(python{2,}-setuptools)
source=("git+https://github.com/hamcrest/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^V//'
}

build() {
    for pybin in python python2; do
        _dir="${srcdir}/${pybin}-${_pkgname}-${pkgver}"
        mkdir -p "${_dir}"
        cd "${_dir}"
        cp -r "${srcdir}/${_pkgname}"/. .
        ${pybin} setup.py build
    done
}

_package() {
    pybin=$1
    depends=(${pybin})
    cd "${srcdir}/${pybin}-${_pkgname}-${pkgver}"
    ${pybin} setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _name in "${pkgname[@]}"; do
    _splitname=(${_name//-/ }) # For retriving the python version needed
    eval "package_${_name}() { _package ${_splitname[0]}; }"
done
