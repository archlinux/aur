# Maintainer: Camden Cheek <ccheek22@gmail.com>
_pkgname='vimdoc'
pkgname="${_pkgname}-git"
pkgver=r104.00ae18b
pkgrel=1
pkgdesc="Helpfile generation for vim plugins"
arch=('any')
url="https://github.com/google/vimdoc"
license=('apachev2')
depends=()
makedepends=('git' 'python>=3.6')
provides=()
conflicts=("vimdoc")
source=('git+https://github.com/google/vimdoc.git')
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgname}"
    python3 setup.py config
    python3 setup.py build
    python3 setup.py install --root="$pkgdir" || return 1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
