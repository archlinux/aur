# Maintainer:
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname='ropper-git'
pkgver=1.13.13.r0.gc9e66e1
pkgrel=1
pkgdesc='Show information about binary files and find gadgets to build rop chains for different architectures'
url='https://github.com/sashs/Ropper'
arch=('any')
license=('BSD-3-Clause')
depends=(
  python
  python-capstone
  python-filebytes
  python-z3-solver
  python-pyvex
  python-archinfo
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(
  python-pytest
)
provides=('ropper' 'python-ropper')
conflicts=('ropper')
source=("${pkgname}::git+${url}.git"
         fix-license.patch
         fix-syntax-warnings.patch)
sha512sums=('SKIP'
            'b4503b51bdfc90c6dc23d84e0544f4d9f7580f71fa669bed9ebf950d649de25bb440d166022f7519b1573b78f86e5311fe79f207ce0ac404e7cb97fa797b6393'
            '9fbd955eb285fd6c41593e17b857a5bd451cfe461cdb326a62ba289427272749d0c12c129be5c864f569fed6b55de846a5185a71c90b9273684a48c8c726dcf4')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  patch -p1 < ../fix-license.patch
  patch -p1 < ../fix-syntax-warnings.patch
}

build() {
  cd ${pkgname}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}
  pytest
}

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md sample.py -t "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
