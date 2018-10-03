# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et ft=sh:

pkgname=qutebrowser-git
pkgver=1.4.1.r123.ge927fecbb
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5"
arch=(any)
url="https://www.qutebrowser.org/"
license=('GPL')
depends=('python' 'python-setuptools' 'python-pyqt5' 'qt5-base'
         'qt5-webengine' 'qt5-declarative' 'python-pypeg2' 'python-jinja'
         'python-pygments' 'python-yaml' 'python-attrs')
makedepends=('asciidoc' 'pygmentize' 'git')
optdepends=(
  'qt5-webkit: To use the QtWebKit backend'
  'gst-libav: media playback with QtWebKit'
  'gst-plugins-base: media playback with QtWebKit'
  'gst-plugins-good: media playback with QtWebKit'
  'gst-plugins-bad: media playback with QtWebKit'
  'gst-plugins-ugly: media playback with QtWebKit'
  'pdfjs: Displaying PDF in-browser with QtWebKit'
)

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
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 doc/qutebrowser.1 "$pkgdir/usr/share/man/man1/qutebrowser.1"
  install -Dm644 misc/qutebrowser.desktop \
    "$pkgdir/usr/share/applications/qutebrowser.desktop"

	for i in 16 24 32 48 64 128 256 512; do
		install -Dm644 "icons/qutebrowser-${i}x$i.png" \
			"$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/qutebrowser.png"
	done
  install -Dm644 icons/qutebrowser.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/qutebrowser.svg"

  install -dm755 "$pkgdir/usr/share/qutebrowser/userscripts"
  find misc/userscripts -type f -exec install -m755 {} "$pkgdir/usr/share/qutebrowser/userscripts" \;
}
