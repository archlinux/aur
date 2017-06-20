# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et ft=sh:

pkgname=qutebrowser-git
pkgver=0.10.1.r851.gcb5cd1a91
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5 and QtWebKit"
arch=(any)
url="http://www.qutebrowser.org/"
license=('GPL')
depends=('python>=3.4' 'python-setuptools' 'python-pyqt5>=5.2' 'qt5-base>=5.2'
         'qt5-webkit' 'qt5-declarative' 'libxkbcommon-x11' 'python-pypeg2'
         'python-jinja' 'python-pygments' 'xdg-utils' 'desktop-file-utils'
         'python-yaml' 'hicolor-icon-theme')
makedepends=('asciidoc' 'source-highlight' 'git')
optdepends=(
  'gst-libav: media playback'
  'gst-plugins-base: media playback'
  'gst-plugins-good: media playback'
  'gst-plugins-bad: media playback'
  'gst-plugins-ugly: media playback'
  'pdfjs: Displaying PDF in-browser'
  'qt5-webengine: To use --backend webengine'
  'python-opengl: To use --backend webengine'
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
  install -Dm644 qutebrowser.desktop \
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
