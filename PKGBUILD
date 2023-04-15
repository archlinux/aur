# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="curlylint-git"
_pkgname=${pkgname%-git}
pkgver=0.13.1
pkgrel=1
pkgdesc="Experimental HTML templates linting for Jinja, Nunjucks, Django templates, Twig, Liquid"
arch=('any')
url="https://github.com/thibaudcolas/curlylint"
license=("MIT")
depends=("python-parsy-git" "python-attrs" "python-click" "python-toml" "python-pathspec")
makedepends=('python-setuptools')
checkdepends=("python-pytest")
source=("${pkgname}::git+${url}#branch=main")
sha512sums=('SKIP')

prepare() {
    cd "${pkgname}"

    git reset --hard "$(git describe --tags --abbrev=0 --match 'v*')"
}

pkgver() {
    cd "${pkgname}"

    git describe --tags --abbrev=0 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"

    python3 setup.py build
}

check() {
    pytest "${pkgname}"
}

package() {
    cd "${pkgname}"

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
