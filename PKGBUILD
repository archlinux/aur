# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=wllvm-git
pkgver=r486.c663442
pkgrel=1
pkgdesc="A wrapper script to build whole-program LLVM bitcode files"
arch=('any')
url="https://github.com/travitch/whole-program-llvm"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('wllvm')
conflicts=('wllvm')
source=("$pkgname"::'git+https://github.com/travitch/whole-program-llvm')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
