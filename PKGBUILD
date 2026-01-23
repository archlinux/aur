# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.7.10
pkgrel=2
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('270b77413c951b1b987d00dac79eabecd99a4b3e68345021304065b5f60a358d')
backup=('etc/speculum.conf')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm 644 "files/speculum.conf" "${pkgdir}/etc/speculum.conf"
    install -dm 755 "${pkgdir}/usr/lib/systemd/system/"

    for UNIT in files/*.{service,timer}; do
        install -m 644 "${UNIT}" "${pkgdir}/usr/lib/systemd/system/"
    done
}
