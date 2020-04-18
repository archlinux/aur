# Maintainer: Slash <youremail@domain.com>

pkgname=weechat-matrix-git
_pkgname=${pkgname%-git}
pkgver=r723.d415841
pkgrel=1
pkgdesc='Weechat Matrix protocol script written in Python'
arch=('any')
url="https://github.com/poljar/weechat-matrix"
license=('ISC')
depends=('python-atomicwrites' 'python-attrs' 'python-future' 'python-logbook' 'python-matrix-nio'
         'python-pygments' 'python-pyopenssl' 'python-webcolors')
makedepends=('git' 'python-dephell')
checkdepends=('python-hypothesis' 'python-pytest')
optdepends=('python-aiohttp: matrix_sso_helper support'
            'python-magic: matrix_upload support'
            'python-requests: matrix_decrypt and matrix_upload support'
            'ranger: default plumber for matrix_decrypt')
replaces=('weechat-poljar-matrix-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    sed -ri 's|#!/usr/bin/env( -S)? python3|#!/usr/bin/python3|' contrib/*.py
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "${_pkgname}"
    python setup.py build
}

check() {
    cd "${_pkgname}"
    python -m pytest
}

package() {
    cd "${_pkgname}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm755 main.py \
        "${pkgdir}/usr/share/weechat/python/weechat-matrix.py"

    for _script in matrix_decrypt matrix_sso_helper matrix_upload
    do
        install -Dm755 "contrib/${_script}.py" \
            "${pkgdir}/usr/bin/${_script}"
    done

    install -Dm644 'LICENSE' \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
