# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# vim: set ts=4 sw=4 et ft=sh:

pkgname=qutebrowser-git
pkgver=3.4.0.r2.g1bcb536a4
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL")
depends=("python-jinja" "python-pyqt6" "python-yaml" "python-pyqt6-webengine")
makedepends=("asciidoc" "pygmentize" "git" "python-setuptools")
optdepends=("python-adblock: ABP-style adblocking"
            "pdfjs: displaying PDF in-browser"
            "gst-libav: media playback with qt5-webkit backend"
            "gst-plugins-base: media playback with qt5-webkit backend"
            "gst-plugins-good: media playback with qt5-webkit backend"
            "gst-plugins-bad: media playback with qt5-webkit backend"
            "gst-plugins-ugly: media playback with qt5-webkit backend"
            "python-pygments: :view-source with qt5-webkit backend" 
            "python-pyqt5: Legacy Qt wrapper"
            "python-pyqtwebengine: Legacy Qt wrapper"
            "qt5-webkit: legacy alternative backend")
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
