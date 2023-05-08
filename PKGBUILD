# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

_pkgbase=kitty
_suffix=shade-transparency-patch
pkgbase=$_pkgbase-$_suffix
pkgname=($_pkgbase-$_suffix $_pkgbase-terminfo-$_suffix $_pkgbase-shell-integration-$_suffix)
_commit_id=\
bdb089608b15b6b8fe9aebf1b80e9810dec57e9a
_pkgbase_id="${_pkgbase}-${_commit_id}"
pkgver=0.28.1.0
pkgrel=1
pkgdesc='Kitty terminal emulator with a patch to make shade characters semitransparent'
arch=('x86_64')
url="https://github.com/kovidgoyal/$_pkgbase"
license=('GPL3')
depends=('python3' 'freetype2'  'fontconfig' 'wayland' 'libx11' 'libxkbcommon-x11' 'libxi'
         'hicolor-icon-theme' 'libgl' 'dbus' 'lcms2' 'librsync')
makedepends=('libxinerama' 'libxcursor' 'libxrandr' 'wayland-protocols' 'go'
             'python-sphinx' 'python-sphinx-copybutton'
             'python-sphinx-inline-tabs' 'python-sphinxext-opengraph'
             'python-sphinx-furo')
source=("${_pkgbase_id}.zip::https://github.com/MithicSpirit/${_pkgbase}/archive/${_commit_id}.zip")
sha512sums=('a226899ee62b8df46a79381b78f2a809ac3b5985c459cc3679c4e3250018ee04176ca9ce191357f51c282b35eae5cf31dd6607f2cb4bfcb8642bd43784becec7')

build() {
	cd "$srcdir/$_pkgbase_id"
	python3 setup.py linux-package --update-check-interval=0
}

package_kitty-shade-transparency-patch() {
	provides=($_pkgbase)
	conflicts=($_pkgbase)
	depends+=("$_pkgbase-terminfo-$_suffix"
	          "$_pkgbase-shell-integration-$_suffix")
	optdepends=('imagemagick: viewing images with icat'
	            'python-pygments: syntax highlighting in kitty +kitten diff'
	            'libcanberra: playing "bell" sound on terminal bell')

	cd "$srcdir/$_pkgbase_id"

	cp -r linux-package "${pkgdir}"/usr

	# completions
	python __main__.py + complete setup bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/$_pkgbase"
	python __main__.py + complete setup fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/$_pkgbase.fish"
	python __main__.py + complete setup zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_$_pkgbase"

	install -Dm644 \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_pkgbase.png" \
		"${pkgdir}/usr/share/pixmaps/$_pkgbase.png"

	rm -r "$pkgdir"/usr/share/terminfo
	rm -r "$pkgdir/usr/lib/$_pkgbase/shell-integration"

	install -Dm644 docs/_build/html/_downloads/*/"$_pkgbase.conf" \
		"${pkgdir}/usr/share/doc/${pkgname}/$_pkgbase.conf"
}

package_kitty-terminfo-shade-transparency-patch() {
	provides=($_pkgbase-terminfo)
	conflicts=($_pkgbase-terminfo)
	pkgdesc='Terminfo for kitty, an OpenGL-based terminal emulator'
	depends=('ncurses')

	mkdir -p "$pkgdir/usr/share/terminfo"
	tic -x -o "$pkgdir/usr/share/terminfo" \
		"$srcdir/$_pkgbase_id/terminfo/$_pkgbase.terminfo"
}

package_kitty-shell-integration-shade-transparency-patch() {
	provides=($_pkgbase-shell-integration)
	conflicts=($_pkgbase-shell-integration)
	pkgdesc='Shell integration scripts for kitty, an OpenGL-based terminal emulator'

	mkdir -p "$pkgdir/usr/lib/$_pkgbase/"
	cp -r "$srcdir/$_pkgbase_id/shell-integration" \
		"$pkgdir/usr/lib/$_pkgbase/"
}
