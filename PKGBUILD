# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=docker-registry
pkgver=2.0.1
pkgrel=1
pkgdesc="An implementation of the Docker Registry HTTP API V2 for use with docker 1.6+."
arch=('any')
url="https://github.com/docker/distribution"
license=('Apache')
makedepends=('git' 'go')
backup=("etc/${_pkgname}/config.yml")
source=("${url}/archive/v${pkgver}.tar.gz"
        'docker-registry.service')
sha256sums=('1664584c311dac98a8b09880d5c79ffceea7a4e0f2359be70c6a9a6ddd9d804a'
            '32b4e0586cbcc24c6a262b7302ea568580261664ca7b41779358680bc790be7e')


build() {
    export DISTRIBUTION_DIR="${srcdir}/distribution-${pkgver}"
    export GOPATH="${DISTRIBUTION_DIR}/Godeps/_workspace"
    cd "${DISTRIBUTION_DIR}"

    # GOPATH fix
    ln -s "${DISTRIBUTION_DIR}" "${DISTRIBUTION_DIR}/Godeps/_workspace/src/github.com/docker/distribution"

    make clean binaries
}

package() {
    export DISTRIBUTION_DIR="${srcdir}/distribution-${pkgver}"
    install -v -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -v -D -m755 "${DISTRIBUTION_DIR}/bin/registry" "${pkgdir}/usr/bin/${pkgname}"
    install -v -D -m644 "${DISTRIBUTION_DIR}/cmd/registry/config.yml" "${pkgdir}/etc/${_pkgname}/config.yml"
}

# vim:set ts=4 sw=4 et:
