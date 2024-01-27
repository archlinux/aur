# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

_pkgbase=kitty
_pkgver=0.32.1
_patchver=1
_patchname=shade-transparency
_suffix="${_patchname}-patch"

pkgbase="${_pkgbase}-${_suffix}"
pkgname=("${_pkgbase}-${_suffix}" "${_pkgbase}-terminfo-${_suffix}" "${_pkgbase}-shell-integration-${_suffix}")
pkgver="${_pkgver}.p${_patchver}"
pkgrel=1
pkgdesc='Kitty terminal emulator with a patch to make shade characters semitransparent'
arch=('x86_64')
url='https://github.com/kovidgoyal/kitty'
license=('GPL3')
depends=('python3' 'freetype2'  'fontconfig' 'wayland' 'libx11'
         'libxkbcommon-x11' 'libxi' 'hicolor-icon-theme' 'libgl' 'dbus' 'lcms2'
         'librsync' 'xxhash')
makedepends=('libxinerama' 'libxcursor' 'libxrandr' 'wayland-protocols' 'go')
source=("${_pkgbase}-${_pkgver}.tar.xz::https://github.com/kovidgoyal/${_pkgbase}/releases/download/v${_pkgver}/${_pkgbase}-${_pkgver}.tar.xz"
        "${_pkgbase}-${_pkgver}.tar.xz.sig::https://github.com/kovidgoyal/${_pkgbase}/releases/download/v${_pkgver}/${_pkgbase}-${_pkgver}.tar.xz.sig"
        "${_patchname}.patch")
sha512sums=('4be50093b2da7a6536548f8bf36ea86ab47238a1f346e10d4384a90d2d0d0e02f8d98dc6a463ffa7c7a93268202b5a4109f28e2b7ece1d9593f590691e5e1af8'
            'SKIP'
            '57fa7f4cd204dcbd6f0c91c0cd728d9a88c6f0bdeaef151e1b6392d5d6330af2ecf2a03a65cc6e58b3bd368bd88a1c0b5ddcad0445d165084f09cbe5a27b5295')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C')  # Kovid Goyal

prepare() {
	cd "$srcdir/$_pkgbase-$_pkgver"
	patch -p1 <"$srcdir/$_patchname.patch"
}

build() {
	cd "$srcdir/$_pkgbase-$_pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	python3 setup.py linux-package --update-check-interval=0
}

package_kitty-shade-transparency-patch() {
	depends+=("${_pkgbase}-terminfo-${_suffix}"
	          "${_pkgbase}-shell-integration-${_suffix}")
	optdepends=('imagemagick: viewing images with icat'
	            'python-pygments: syntax highlighting in kitty +kitten diff'
	            'libcanberra: playing "bell" sound on terminal bell')
	provides=("${pkgname%%-${_suffix}}")
	conflicts=("${pkgname%%-${_suffix}}")

	cd "$srcdir/$_pkgbase-$_pkgver"

	cp -r linux-package "${pkgdir}"/usr

	# completions
	linux-package/bin/kitten __complete__ setup bash |
		install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/kitty
	linux-package/bin/kitten __complete__ setup fish |
		install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/kitty.fish
	linux-package/bin/kitten __complete__ setup zsh |
		install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_kitty

	install -Dm644 \
		"${pkgdir}"/usr/share/icons/hicolor/256x256/apps/kitty.png \
		"${pkgdir}"/usr/share/pixmaps/kitty.png

	rm -r "$pkgdir"/usr/share/terminfo
	rm -r "$pkgdir"/usr/lib/kitty/shell-integration

	install -Dm644 docs/_build/html/_downloads/*/kitty.conf \
		"${pkgdir}"/usr/share/doc/${pkgname}/kitty.conf
}

package_kitty-terminfo-shade-transparency-patch() {
	pkgdesc='Terminfo for kitty, an OpenGL-based terminal emulator'
	depends=('ncurses')
	provides=("${pkgname%%-${_suffix}}")
	conflicts=("${pkgname%%-${_suffix}}")

	mkdir -p "$pkgdir/usr/share/terminfo"
	tic -x -o "$pkgdir/usr/share/terminfo" \
		"$_pkgbase-$_pkgver/terminfo/kitty.terminfo"
}

package_kitty-shell-integration-shade-transparency-patch() {
	pkgdesc='Shell integration scripts for kitty, an OpenGL-based terminal emulator'
	provides=("${pkgname%%-${_suffix}}")
	conflicts=("${pkgname%%-${_suffix}}")

	mkdir -p "$pkgdir/usr/lib/kitty/"
	cp -r "$srcdir/$_pkgbase-$_pkgver/shell-integration" \
		"$pkgdir/usr/lib/kitty/"
}
