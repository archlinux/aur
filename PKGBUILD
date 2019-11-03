# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=python-recommonmark
pkgname=('python-recommonmark' 'python2-recommonmark')
pkgver=0.4.0.133.c410abb
pkgrel=6
_gitcommit=c410abb565a3c4ad4de0ce204ab2fa2db8031cf1
pkgdesc='Markdown parser for docutils'
url='https://github.com/readthedocs/recommonmark'
arch=('any')
license=('MIT')
makedepends=('git'
             'python-setuptools' 'python-commonmark' 'python-docutils' 'python-sphinx'
             'python2-setuptools' 'python2-commonmark' 'python2-docutils' 'python2-sphinx')
checkdepends=('python-pytest' 'python2-pytest')
source=(${pkgbase}::"git+https://github.com/readthedocs/recommonmark#commit=$_gitcommit"
        recommonmark-disable-math-on-builds.patch
        recommonmark-sphinx-refdomain-fix.patch
        recommonmark-fix-mdnode-parent.patch
        recommonmark-sphinx-2.patch)
sha512sums=('SKIP'
            '66ef07ac21643b913c8ee551c7c71753fcb6442712e4fb11b84ea5f34265715471759b2c5a1badc1e299ca6aa831713b12284144801616349b2db61738607e8a'
            'df2440e7ce927ca6adc31e07f9e375fa4643bbe1c33a34821d3d3e5d9d4b2ae8bbdf7412a8f2c64d343c9004f54a4a650fc59e461b3b1eb1ab11c1dec02422fd'
            '89745108ad78349ace30582cb28f8693edc109c97e94182a37afe5219bec8988bb785d77594e34306facf0eaa4e640c0bdf4e53249d6154094222e58df9498e9'
            'cff81ff659acd39557fbaf5c2b85a8c4f2b5ff0f950a2ecb10131f2673582173686c3cf46c7c8811d01f9ebab4675dfbcc097612005504121978f2957001ddf6')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" \
    "$(PYTHONPATH=. python -c 'print(__import__('"'recommonmark'"').__version__)')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d ${pkgbase} -p1 < "${srcdir}/recommonmark-disable-math-on-builds.patch"
  patch -d ${pkgbase} -p1 < "${srcdir}/recommonmark-sphinx-refdomain-fix.patch"
  patch -d ${pkgbase} -p1 < "${srcdir}/recommonmark-fix-mdnode-parent.patch"
  cp -a ${pkgbase}{,-py2}
  for tool in cm2{html,latex,man,pseudoxml,xetex,xml}; do
    sed -r "s|(${tool}) |\12 |g" -i ${pkgbase}-py2/setup.py
  done
  patch -d ${pkgbase} -p1 < "${srcdir}/recommonmark-sphinx-2.patch" # Fix tests with Sphinx 2
}

build() {
  msg2 "Building python..."
  (cd ${pkgbase}
    python setup.py build
    make -j1 -C docs text man SPHINXBUILD=sphinx-build
  )
  msg2 "Building python2..."
  (cd ${pkgbase}-py2
    python2 setup.py build
    make -j1 -C docs text man SPHINXBUILD=sphinx-build2
  )
}

check() {
  msg2 "Checking python..."
  (cd ${pkgbase}
    py.test
  )
  msg2 "Checking python2..."
  (cd ${pkgbase}-py2
    py.test2
  )
}

package_python-recommonmark() {
  depends=('python-docutils' 'python-commonmark' 'python-setuptools' 'python-sphinx')

  cd ${pkgbase}
  python setup.py install --root="${pkgdir}" --skip-build -O1
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/recommonmark.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

package_python2-recommonmark() {
  depends=('python2-docutils' 'python2-commonmark' 'python2-setuptools' 'python2-sphinx')

  cd ${pkgbase}-py2
  python2 setup.py install --root="${pkgdir}" --skip-build -O1
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/recommonmark.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
