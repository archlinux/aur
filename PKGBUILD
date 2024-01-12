# Maintainer: Kimiblock
pkgname=apostrophe-system-font-git
pkgver=2.6.3.r201.g72f8faf
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+, using system monospace font"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL3')
depends=('libadwaita' 'otf-fira-mono' 'otf-fira-sans' 'python-cairo'
         'python-chardet' 'python-gobject' 'python-levenshtein' 'python-pyenchant'
         'python-pypandoc' 'python-regex' 'python-setuptools' 'webkitgtk-6.0' 'nodejs-reveal.js')
makedepends=('git' 'meson' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('texlive-bin: for the pdftex module'
            'mathjax: for formula preview')
provides=("apostrophe")
conflicts=("apostrophe" "apostrophe-git")
source=(
	'git+https://gitlab.gnome.org/World/apostrophe.git'
	"0001-Use-system-font.patch"
	"2-rm-reveal-check.patch"
)
sha256sums=(
	'SKIP'
	"SKIP"
	"SKIP")

function pkgver() {
	cd "${srcdir}/apostrophe"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/apostrophe"
	# Bug 1953395 - Apostrophe can't export to HTML
	sed -i 's|/app/share/fonts/FiraSans-Regular.ttf|/usr/share/fonts/OTF/FiraSans-Regular.otf|' \
		data/media/css/web/base.css
	sed -i 's|/app/share/fonts/FiraMono-Regular.ttf|/usr/share/fonts/OTF/FiraMono-Regular.otf|' \
		data/media/css/web/base.css

	# W: hidden-file-or-dir
	rm apostrophe/.pylintrc
	patch -Np1 -i "${srcdir}/0001-Use-system-font.patch"
	patch "${srcdir}/apostrophe/meson.build" < "${srcdir}/2-rm-reveal-check.patch"
}

function build() {
	arch-meson -Dprofile=development apostrophe build
	meson compile -C build
}

function check() {
	meson test -C build --print-errorlogs
}

function package() {
	meson install -C build --destdir "$pkgdir"
}
