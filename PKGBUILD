# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# vim: set ts=4 sw=4 et ft=sh:

pkgname=qutebrowser-qt6-git
pkgver=2.5.4.r929.gcb9f3fa14
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5 (Qt 6 branch)"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL")
depends=("python-jinja" "python-pyqt6" "python-yaml" "python-pyqt6-webengine")
makedepends=("asciidoc" "pygmentize" "git" "python-setuptools")
optdepends=("python-adblock: ABP-style adblocking"
            "pdfjs: displaying PDF in-browser")
options=(!emptydirs)
conflicts=('qutebrowser' 'qutebrowser-git')
provides=('qutebrowser')
source=('git+https://github.com/qutebrowser/qutebrowser.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/qutebrowser"
    # Minor releases are not part of the master branch
    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/qutebrowser"
    sed -i 's/_DEFAULT_WRAPPER = "PyQt5"/_DEFAULT_WRAPPER = "PyQt6"/' qutebrowser/qt/machinery.py
}

build() {
    cd "$srcdir/qutebrowser"
    python scripts/asciidoc2html.py
    a2x -f manpage doc/qutebrowser.1.asciidoc
    python setup.py build
}

package() {
    cd "$srcdir/qutebrowser"
    make -f misc/Makefile DESTDIR="$pkgdir" PREFIX=/usr install
}
