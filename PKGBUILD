# Maintainer: Elias Riedel Gårding <eliasrg@kth.se>
# Author: Bryan Bugyi <bryanbugyi34@gmail.com>
pkgname=funky-git
pkgver=v3.3.1.r11.g2997e05
pkgrel=1
pkgdesc="Create directory-specific shell functions"
arch=('any')
url="https://github.com/bbugyi200/funky"
license=('MIT')
depends=('python-setuptools' 'python-future' 'python-pygments' 'python-six')
makedepends=('git')
provides=('funky')
conflicts=('funky')
install=funky-git.install
source=("git+https://github.com/bbugyi200/funky.git")
md5sums=('SKIP')

# --- Packaging notes ---
# usr/bin/funky imports pkg_resources, so python-setuptools is in depends, not
# makedepends, following the Python packaging guidelines

pkgver() {
    cd "${pkgname%%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${pkgname%%-git}"
    python setup.py build
}


package() {
    cd "${pkgname%%-git}"

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    cp LICENSE "$pkgdir/usr/share/licenses/${pkgname}"

    mkdir -p "$pkgdir/usr/share/doc/${pkgname%%-git}"
    cp README.md "$pkgdir/usr/share/doc/${pkgname%%-git}"

    # Set XDG_DATA_HOME to avoid installing funky.sh in $HOME/.local/share
    XDG_DATA_HOME=/usr/share python setup.py install \
        --root="$pkgdir/" --optimize=1 --skip-build
}
