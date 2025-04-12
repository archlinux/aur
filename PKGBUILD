# Maintainer: devome <evinedeng@hotmail.com>

pkgname=mailrise
pkgver=1.4.0
pkgrel=1
pkgdesc="An SMTP gateway for Apprise notifications."
url="https://github.com/YoRyan/${pkgname}"
arch=('any')
license=('MIT')
backup=("etc/conf.d/${pkgname}.yaml")
depends=(apprise python-aiosmtpd python-yaml)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-sphinx python-wheel)
checkdepends=(python-types-pyyaml python-pytest python-pytest-asyncio python-pytest-cov)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.yaml")
sha256sums=('04a97983847d2f922bca031df556e2db4885d803e9c5249f2b1536e6768f1937'
            '85a95e9f0367c57e0b63577713f80fd0dc0a60dbb99df655a680cfcb39abc6b3'
            '0d414a53a16c73bad933af4577d79084a3121311c4e741c8f71eec0bed43496f')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

    cd docs
    make man
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    python -m installer --destdir="tmp_install" "${pkgname}-${pkgver}"/dist/*.whl
    export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH"
    pytest
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.yaml"    "${pkgdir}/etc/conf.d/${pkgname}.yaml"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}"      README* CHANGELOG*
    install -Dm644 -t "${pkgdir}/usr/share/man/man1"            docs/_build/man/"${pkgname}".1
}
