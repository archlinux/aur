# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

_pkgname=qutebrowser
pkgname=qutebrowser-qtwebengine
pkgver=0.11.0
pkgrel=2
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5 and QtWebKit"
arch=("any")
url="http://www.qutebrowser.org/"
license=("GPL")
depends=("desktop-file-utils" "hicolor-icon-theme" "libxkbcommon-x11"
	"python-jinja" "python-opengl" "python-pygments" "python-pypeg2"
	"python-pyqt5>=5.2" "python-yaml" "qt5-base>=5.2" "qt5-webengine" 
	"xdg-utils")
makedepends=("asciidoc")
optdepends=("python-colorlog: colored logging output"
	"gst-libav: media playback"
	"gst-plugins-base: media playback"
	"gst-plugins-good: media playback"
	"gst-plugins-bad: media playback"
	"gst-plugins-ugly: media playback"
	"pdfjs: displaying PDF in-browser"
	"python-opengl: required when QtWebengine is used")
provides=('qutebrowser')
conflicts=('qutebrowser')
options=(!emptydirs)
source=(
	"https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz"
	"https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz.asc")
validpgpkeys=("E04E560002401B8EF0E76F0A916EB0C8FD55A072")
sha256sums=('dbb7de2d54f3849b03db11c2417a725ab8bf26a8f7f48bfa36ad852a8de9308e'
            'SKIP')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	a2x -f manpage doc/qutebrowser.1.asciidoc
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
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
	install -Dm755 -t "$pkgdir/usr/share/qutebrowser/userscripts/" misc/userscripts/*
}
