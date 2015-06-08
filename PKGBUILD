pkgname=('docker-compose-git')
srcname='docker-compose'
pkgver='r1'
pkgrel='1'
pkgdesc='Define and run complex applications using Docker'
arch=('any')
url='https://github.com/docker/compose'
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
    'python-setuptools'
)
makedepends=('git')
provides=('docker-compose')
conflicts=('docker-compose')

source=(
    "${srcname}::git+https://github.com/docker/compose.git#tag=1.2.0"
    'version.patch'
)
sha512sums=(
    'SKIP'
    'd716f03591b720f178599bb9b4d3ac31d7fde4a20637d5edf626f517f159fd38dd3e47b1f8dfa303ff2523b54b729363c6be0b887c260581663b8e63e0005e43'
)

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

prepare() {
    cd "${srcdir}/${srcname}"

    git apply "${srcdir}/version.patch"
}

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1

    install -D --mode=644 LICENSE "${pkgdir}/usr/share/licenses/${srcname}/LICENSE"
    install -D --mode=644 contrib/completion/bash/docker-compose "${pkgdir}/usr/share/bash-completion/completions/docker-compose"
}
