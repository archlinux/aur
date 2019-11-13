# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('docker-compose-git')
_srcname='compose'
pkgver='r5440'
pkgrel='1'
pkgdesc='Define and run complex applications using Docker'
arch=('any')
url="https://github.com/docker/${_srcname}"
license=('Apache')

depends=(
    'python'
    'python-docopt'
    'python-yaml'
    'python-requests'
    'python-texttable'
    'python-websocket-client'
    'python-docker-py'
    'python-dockerpty'
    'python-six'
    'python-jsonschema'
    'python-setuptools'
)
makedepends=('git')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

prepare() {
    cd "${srcdir}/${_srcname}"

    # Remove upper bound on requirements
    sed --regexp-extended --in-place 's/==(\s*[0-9]+(\.[0-9]+)*)/>=\1/g' requirements.txt
    sed --regexp-extended --in-place "s/, < [0-9]+(\.[0-9]+)*//g" setup.py
}

package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1

    install -D --mode=644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
    install -D --mode=644 contrib/completion/bash/docker-compose "${pkgdir}/usr/share/bash-completion/completions/docker-compose"
}
