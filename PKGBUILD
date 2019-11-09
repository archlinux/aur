# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-recommonmark
pkgver=0.6.0.194.48f9d1a
pkgrel=1
_gitcommit=48f9d1a6848c77a104854f556c053f3ed3c2c354
pkgdesc='Markdown parser for docutils'
url='https://github.com/readthedocs/recommonmark'
arch=('any')
license=('MIT')
depends=('python-docutils' 'python-commonmark' 'python-setuptools' 'python-sphinx')
makedepends=('git')
checkdepends=('python-pytest')
source=(${pkgname}::"git+https://github.com/readthedocs/recommonmark#commit=$_gitcommit"
        recommonmark-disable-math-on-builds.patch
        recommonmark-sphinx-2.patch)
sha512sums=('SKIP'
            '66ef07ac21643b913c8ee551c7c71753fcb6442712e4fb11b84ea5f34265715471759b2c5a1badc1e299ca6aa831713b12284144801616349b2db61738607e8a'
            '608c44a861f589964ffd30818917dd46aa0df2a249d74cf54f1dbd2e595dc3e1914357df563608d0c3f10bc3d387aece36d69178161c9d4fa824224a72c367e5')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" \
    "$(PYTHONPATH=. python -c 'print(__import__('"'recommonmark'"').__version__)')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d ${pkgbase} -p1 < "${srcdir}/recommonmark-disable-math-on-builds.patch"
  patch -d ${pkgbase} -p1 < "${srcdir}/recommonmark-sphinx-2.patch" # Fix tests with Sphinx 2
}

build() {
  msg2 "Building python..."
  cd ${pkgbase}
  python setup.py build
  make -j1 -C docs text man SPHINXBUILD=sphinx-build
}

check() {
  msg2 "Checking python..."
  cd ${pkgbase}
  py.test
}

package() {
  cd ${pkgbase}
  python setup.py install --root="${pkgdir}" --skip-build -O1
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/recommonmark.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
