# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=python-crfsuite
pkgname=${_base}-git
epoch=1
pkgver=0.9.10.r0.gf7c0165
pkgrel=4
pkgdesc="A python binding for crfsuite"
arch=('any')
url="https://github.com/scrapinghub/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'cython' 'git')
source=("git+https://github.com/scrapinghub/python-crfsuite.git"
        "git+https://github.com/chokkan/crfsuite.git"
        "001-Fix-GCC-14-build-error.patch"
        "git+https://github.com/chokkan/liblbfgs.git")
sha512sums=('SKIP'
            'SKIP'
            '0e8031112ce62eaeaa993a7156269a1786ee9f53729a07c2328fdd680fcd827111e298d7d8151910424e6386f0f63219df2772874b910ede6c8baa35f7225db0'
            'SKIP')
provides=('python-crfsuite')
conflicts=('python-crfsuite')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_base}"
  patch -Np1 < "$srcdir"/"001-Fix-GCC-14-build-error.patch"
  cython pycrfsuite/_pycrfsuite.pyx --cplus -a -2 -I pycrfsuite

  git submodule init

  git config submodule.crfsuite/crfsuite.url "$srcdir/crfsuite"
  git config submodule.liblbfgs/liblbfgs.url "$srcdir/liblbfgs"

  git -c protocol.file.allow=always submodule update
  git -C "${srcdir}/${_base}" clean -dfx
}

build() {
  cd "${_base}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
