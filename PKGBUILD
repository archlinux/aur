# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkg='easybuild-easyblocks'
pkgname="${_pkg}-git"
pkgver=4.8.2.r83.ge3e870d6c
pkgrel=2
pkgdesc="A software build and installation framework for HPC systems"
arch=('any')
url="https://github.com/easybuilders/easybuild-easyblocks"
license=('GPL2')
depends=('python' 'python-toml' 'easybuild-framework')
makedepends=('git' 'python-setuptools')
provides=("$_pkg")
conflicts=("$_pkg")
source=("git+https://github.com/easybuilders/${_pkg}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkg"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/.*v\(.*\)$/\1/;s/-/./g')"
}

prepare() {
    git -C "$srcdir/$_pkg" clean -dfx
}

build() {
    cd "$srcdir/$_pkg"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkg"

    local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python setup.py install --root="$pkgdir" --optimize=1

    # removing pycache files
    rm "$pkgdir/usr/lib/python${python_version}/site-packages/easybuild/__init__.py"
    rm -r "$pkgdir/usr/lib/python${python_version}/site-packages/easybuild/__pycache__"
}
