# Maintainer: Cédric Airaud <cairaud@gmail.com>
_pkgname='spyder-notebook'
pkgname="${_pkgname}-git"
pkgver=v0.1.3.r1.ga0f5186
pkgrel=1
pkgdesc='Spyder Jupyter notebook plugin'
arch=('any')
url='https://github.com/spyder-ide/spyder-notebook'
license=('MIT')
depends=('spyder3>=3.2' 'jupyter-notebook>=4.3')
makedepends=('git' 'python>=3.6' 'python-setuptools')
provides=()
conflicts=()
replaces=()
source=('git+https://github.com/spyder-ide/spyder-notebook.git')
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/${_pkgname}"
    python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
