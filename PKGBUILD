# Contributor:  Paul Moffat <aur@paulmoffat.net>
# Contributor: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgname=zim
pkgname=${_pkgname}-git
pkgver=0.75.2.r75.ga0e992f
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop. Git Version"
arch=(any)
license=('GPL-2.0' 'Artistic-1.0-Perl')
url="https://zim-wiki.org/"
depends=('python' 'python-gobject' 'ttf-font' 'gtk3' 'python-xdg')
makedepends=('git' 'python-setuptools')
checkdepends=('xorg-server-xvfb' 'python-setuptools')
optdepends=('breezy: Version Control plugin'
            'bzr: Version Control plugin'
            'git: Version Control plugin'
            'mercurial: Version Control plugin'
            'gnuplot: Insert Gnuplot plugin'
            'ditaa: Insert Ditaa plugin'
            'graphviz: Insert Diagram plugin'
            'xdot: Link Map plugin'
            'gtkspell3: Spell Checker plugin'
            'r: Insert GNU R Plot plugin'
            'scrot: Insert Screenshot plugin'
            'lilypond: Insert Score plugin'
            'gtksourceview3: Source View plugin'
            'texlive-bin: Insert Equation plugin'
            'xdg-utils: recommended on linux'
            'zeitgeist: Log events with Zeitgeist plugin')
conflicts=('zim')
replaces=('zim')
source=("${_pkgname}::git+https://github.com/zim-desktop-wiki/zim-desktop-wiki.git")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${srcdir}/${_pkgname}
	sed -i 's|\t\tinstall_class.run(self)|&\n\t\treturn None|' setup.py
}

check() {
	cd "${srcdir}/${_pkgname}"

	xvfb-run -w0 ./test.py
}

package() {
	cd "${srcdir}/${_pkgname}"

	python setup.py install --root="${pkgdir}" --optimize=1

	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r xdg/hicolor/ "$pkgdir/usr/share/icons/"
}
