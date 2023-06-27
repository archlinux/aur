# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-autoimport
_pkgname="${pkgname#python-}"
pkgver=1.3.3
pkgrel=1
pkgdesc='Autoimport automatically fixes wrong import statements'
arch=('any')
url=https://github.com/lyz-code/autoimport
license=('GPL3')
depends=('python'
         'python-autoflake'
         'python-click'
         'python-maison'
         'python-pyflakes'
         'python-pyprojroot'
         'python-sh'
         'python-xdg-base-dirs')
checkdepends=(
    "python-pytest"
    "python-pytest-xdist"
    "python-pytest-freezegun")
makedepends=('python-build' 'python-installer' 'python-pdm-pep517' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lyz-code/autoimport/archive/refs/tags/${pkgver}.tar.gz"
        "xdg-base-dirs.patch")
sha512sums=('6a80396ab16ef33db92eff97114a4f4897da111442bf54198a37cc8e60ab0570d2fbae924432a443f177f8d48883ed98adde8bcc9db6518d41f6f335b806a6cb'
            '2aa603866fef80cbe2fbeb2e8896db688dd4f29517fb4a0a696777abff7eb9c8c162815d5adf3b800f101282d2848030c3147ee0461ce3e14a0db319bbfee43c')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/xdg-base-dirs.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  python3 -m venv --system-site-packages "${srcdir}/testing-venv"

  cd "${_pkgname}-${pkgver}"
  "${srcdir}/testing-venv/bin/python" -m pip install --no-deps .

  # TODO: these 2 tests seem to fail when the proj directory name does not equal the package name
  "${srcdir}/testing-venv/bin/python" -m pytest \
    -k 'not (test_fix_autoimports_objects_defined_in_the_root_of_the_package or test_fix_autoimports_objects_defined_in___all__special_variable)'
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "CHANGELOG.md"
}
