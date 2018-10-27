# Maintainer: Pierre Neidhardt <mail@ambrevar.xyz

pkgname=next-browser-git
_pkgname=next-browser
pkgver=0.08.36.g6564e3c
pkgrel=2
pkgdesc="Keyboard-oriented, Common Lisp extensible web-browser, inspired by Emacs"
arch=('i686' 'x86_64')
url="http://next.atlas.engineer"
license=('BSD-3')
conflicts=('next-browser')
provides=('next-browser')
source=(${_pkgname}::git+https://github.com/atlas-engineer/next
	git+https://github.com/atlas-engineer/cl-webkit
	https://beta.quicklisp.org/quicklisp.lisp)
sha256sums=('SKIP'
	'SKIP'
	"4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17")
makedepends=('common-lisp' 'cl-asdf')
depends=('webkit2gtk' 'sqlite' 'glib-networking' 'gsettings-desktop-schemas')
optdepends=('gstreamer: for HTML5 audio/video'
            'gst-plugins-base: for HTML5 audio/video'
            'gst-plugins-good: for HTML5 audio/video'
            'gst-plugins-bad: for HTML5 audio/video'
            'gst-plugins-ugly: for HTML5 audio/video')
# Binary will not run otherwise.
options=('!strip' '!makeflags')

pkgver() {
	cd ${_pkgname}
	git describe --long --tags|tr - .
}

build() {
	cd ${_pkgname}
	## Comment the following "rm" if you don't want to rebuild the quicklisp deps
	## everytime.
	# rm -rvf "../../quicklisp/"
	sbcl --non-interactive \
		--eval '(require "asdf")' \
		--load ../quicklisp.lisp \
		--eval '(unless (probe-file "../quicklisp/setup.lisp") (quicklisp-quickstart:install :path "../quicklisp/"))'
	## Expose cl-webkit to quicklisp.
	ln -rsvf ../cl-webkit ../quicklisp/local-projects
	## Build Next.
	sbcl --non-interactive \
		--eval '(require "asdf")' \
		--eval '(load "../quicklisp/setup.lisp")' \
		--load next.asd \
		--eval '(ql:quickload :next/gtk)' \
		--eval '(setq *exit-timeout* nil)' \
		--eval '(asdf:make :next/gtk)'
}

package() {
	cd ${_pkgname}
	install -Dm755 source/next-gtk ${pkgdir}/usr/bin/next
	install -Dm644 "$srcdir"/next-browser/LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

	install -Dm644 "$srcdir"/next-browser/assets/next.desktop "$pkgdir"/usr/share/xsessions/next.desktop
	install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	for i in 16 32 128 256 512; do
		install -Dm644 "$srcdir"/next-browser/assets/next_${i}x${i}.png \
			"$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/next.png"
	done
}
