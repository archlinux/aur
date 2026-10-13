# Maintainer: Joel Jensen <yobert@gmail.com>

_pkgname=keyrings.google-artifactregistry-auth
pkgname=python-keyrings.google-artifactregistry-auth
pkgver=1.1.2
pkgrel=2
pkgdesc="Keyring backend for Google Auth tokens"
arch=('any')
url="https://github.com/GoogleCloudPlatform/artifact-registry-python-tools"
license=('Apache-2.0')
depends=('python' 'python-google-auth' 'python-keyring' 'python-pluggy' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=(
    'google-cloud-cli: fall back to gcloud credentials when Application Default Credentials are unavailable'
    'python-tox: tox plugin that installs this backend into test environments'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bd6abb72740d2dfeb4a5c03c3b105c6f7dba169caa29dee3959694f1f02c77de')

prepare() {
    cd "${_pkgname}-${pkgver}"
    # find_namespace: would otherwise install tests/ as a top-level package
    printf '\n[options.packages.find]\nexclude = tests*\n' >> setup.cfg
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    # No upstream tests; make sure keyring discovers the backend from the built wheel
    rm -rf test_dir
    python -m installer --destdir=test_dir dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    PYTHONPATH="${PWD}/test_dir${_site}" keyring --list-backends | grep -q '^keyrings\.gauth\.GooglePythonAuth '
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
