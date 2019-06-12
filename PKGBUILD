# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgbase=python-jsonschema26
pkgname=('python-jsonschema26' 'python2-jsonschema26')
pkgver=2.6.0
pkgrel=1
pkgdesc="An implementation of JSON Schema validation for Python"
arch=('any')
url="http://pypi.python.org/pypi/jsonschema"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python2-functools32' 'python-vcversioner'
             'python2-vcversioner')
checkdepends=('python-twisted' 'python2-twisted' 'python-mock' 'python2-mock'
              'python-strict-rfc3339' 'python2-strict-rfc3339' 'python-rfc3987' 'python2-rfc3987'
              'python-webcolors' 'python2-webcolors')
source=("${pkgbase}-${pkgver}.tar.bz2::https://github.com/Julian/jsonschema/archive/v${pkgver}.tar.gz")
sha512sums=('863888fa70d7ae000530dcb405455d370a42c75b1e72970724d56397a1364da9198adb655ddebb6e8570b4bcf6ee17d26b712db86ddad15f65132dc9774e7255')

prepare() {
    echo -n "${pkgver}-0-UNKNOWN" > jsonschema-${pkgver}/version.txt
    cp -a jsonschema-${pkgver}{,-py2}
    find jsonschema-${pkgver}-py2 -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
    cd "${srcdir}"/jsonschema-${pkgver}
    python setup.py build

    cd "${srcdir}"/jsonschema-${pkgver}-py2
    python2 setup.py build
}

check() {
    cd "${srcdir}"/jsonschema-${pkgver}
    PYTHONPATH="${PWD}/build/lib" JSON_SCHEMA_TEST_SUITE=json trial3 jsonschema
    python -m doctest README.rst

    cd "${srcdir}"/jsonschema-${pkgver}-py2
    PYTHONPATH="${PWD}/build/lib" JSON_SCHEMA_TEST_SUITE=json trial jsonschema
    # TODO: figure out why
    rm -r build/lib/jsonschema/__pycache__
    python2 -m doctest README.rst
}

package_python-jsonschema26() {
    depends=('python-setuptools')
    provides=("python-jsonschema=${pkgver}")
    conflicts=('python-jsonschema')

    cd jsonschema-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 json/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-jsonschema26() {
    depends=('python2-setuptools' 'python2-functools32')
    provides=("python2-jsonschema=${pkgver}")
    conflicts=('python2-jsonschema')

    cd jsonschema-${pkgver}-py2
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 json/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    mv "${pkgdir}"/usr/bin/jsonschema{,2}
}

