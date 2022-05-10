pkgname=qutebrowser-not-only-latin-git
pkgver=2.2.3.r827.g2b251da57
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5. Fork to support OTHER LAYOUTS, 
unlike the original, where only LATIN LAYOUT worked. 
Now it use SCANCODE instead of KEYCODE from the layout"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL")
depends=("python-jinja" "python-pyqt5" "python-yaml" "qt5-base" "python-pyqtwebengine")
makedepends=("asciidoc" "pygmentize" "git" "python-setuptools")
optdepends=("python-adblock: ABP-style adblocking"
            "pdfjs: displaying PDF in-browser"
            "gst-libav: media playback with qt5-webkit backend"
            "gst-plugins-base: media playback with qt5-webkit backend"
            "gst-plugins-good: media playback with qt5-webkit backend"
            "gst-plugins-bad: media playback with qt5-webkit backend"
            "gst-plugins-ugly: media playback with qt5-webkit backend"
            "python-pygments: :view-source with qt5-webkit backend" 
            "qt5-webkit: alternative backend")
options=(!emptydirs)
conflicts=('qutebrowser')
provides=('qutebrowser')
source=('git+https://github.com/EmptyBucket/qutebrowser.git')
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
