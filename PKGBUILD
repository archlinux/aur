# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=20kly-git
_pkgname="${pkgname%-git}"
pkgver=1.5.0.r2.g29d0f92
pkgrel=1
epoch=1
pkgdesc="20'000 Light Years Into Space game"
arch=('any')
url="http://www.jwhitham.org/20kly/"
license=('GPL')
depends=('python>=3.6' 'python-pygame>=1.9.6' 'glpk')
checkdepends=('python-pytest>=6.2.2' 'python-pytest-cov>=2.11.1')
conflicts=('20kly')
provides=('20kly')
source=("git+https://github.com/20kly/20kly.git"
        '0001-fix.patch')
md5sums=('SKIP'
         'aeb391dc0e4b9fe991ac44df7ccc8a35')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    patch -p1 -i $srcdir/0001-fix.patch
}

package() {
    cd "${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/lightyears"
    cp -r data lib20k "${pkgdir}/usr/share/lightyears"
    #ln -s lib20k "${pkgdir}/usr/share/lightyears/code"

    install -D lightyears -t "${pkgdir}/usr/bin/"
    ln -s lightyears "${pkgdir}/usr/bin/20kly"

    install -Dm644 manual.pdf -t "${pkgdir}/usr/share/doc/lightyears/"
}

check() {
    cd "${_pkgname}"
    python tests/run_all_tests.py --no-mypy
}
