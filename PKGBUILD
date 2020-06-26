# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# vim: set ts=4 sw=4 et ft=sh:

pkgname=qutebrowser-git
pkgver=1.13.0.r2.gcb15192cd
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL")
depends=("python-attrs" "python-jinja" "python-pygments" "python-pypeg2"
         "python-pyqt5" "python-yaml" "qt5-base" "python-pyqtwebengine"
         "python-setuptools")
makedepends=("asciidoc" "pygmentize" "git")
optdepends=("gst-libav: media playback with qt5-webkit backend"
            "gst-plugins-base: media playback with qt5-webkit backend"
            "gst-plugins-good: media playback with qt5-webkit backend"
            "gst-plugins-bad: media playback with qt5-webkit backend"
            "gst-plugins-ugly: media playback with qt5-webkit backend"
            "pdfjs: displaying PDF in-browser"
            "qt5-webkit: alternative backend")
options=(!emptydirs)
conflicts=('qutebrowser')
provides=('qutebrowser')
source=('git+https://github.com/qutebrowser/qutebrowser.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/qutebrowser"
    # Minor releases are not part of the master branch
    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
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
