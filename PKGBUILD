# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Michael Goehler <somebody dot here at gmx dot de>

pkgname=docker-registry-git
_pkgname=docker-registry
pkgver=v2.5.0.rc.1.94.g4107cdb
pkgrel=1
pkgdesc="An implementation of the Docker Registry HTTP API V2 for use with docker 1.6+."
arch=('any')
url="https://github.com/docker/distribution"
license=('Apache')
makedepends=('git' 'go')
backup=("etc/${_pkgname}/config.yml")
source=('distribution::git+https://github.com/docker/distribution.git'
        'docker-registry.service')
md5sums=('SKIP'
         '6602a69661349de0f2c020effbcf417a')

pkgver() {
    cd "${srcdir}/distribution"
    git describe --match 'v[0-9]*' --dirty='.m' --always | sed 's/-/./g'
}

build() {
    export DISTRIBUTION_DIR="${srcdir}/distribution"
    export GOPATH="${DISTRIBUTION_DIR}/Godeps/_workspace"
    cd "${DISTRIBUTION_DIR}"

    # GOPATH fix
    mkdir -p "$GOPATH/src/github.com/docker"
    ln -s "${DISTRIBUTION_DIR}" "${DISTRIBUTION_DIR}/Godeps/_workspace/src/github.com/docker/distribution"

    make clean binaries
}

package() {
    export DISTRIBUTION_DIR="${srcdir}/distribution"
    install -v -D -m644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -v -D -m755 "${DISTRIBUTION_DIR}/bin/registry" "${pkgdir}/usr/lib/${_pkgname}/registry"
    install -v -D -m644 "${DISTRIBUTION_DIR}/cmd/registry/config-example.yml" "${pkgdir}/etc/${_pkgname}/config.yml"
    install -v -d -m755 "${pkgdir}/var/lib/registry"
}

# vim:set ts=4 sw=4 et:
