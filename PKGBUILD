# Maintainer: Nmlgc <arch@nmlgc.net>

# I'm not happy with the font situation:
#
# • Preferably you'd want to install MS Gothic because that's what the original
#   game used. But it's nonfree and you'd either have to copy it from a real
#   Windows system or use one of the various semi-automated AUR packages that
#   download the font from somewhere:
#
#   	https://aur.archlinux.org/packages?O=0&SeB=nd&K=ttf+win+japanese&outdated=&SB=p&SO=d&PP=250&submit=Go
#
# • If you don't want to go to these lengths, you'd want `ttf-ipa-mona` from
#   the AUR. This font is a free metric-compatible alternative to MS Gothic and
#   contains the 7×14 and 8×16 bitmap fonts that are essential for the game's
#   text rendering to look at all acceptable.
#
# You do want to install one or the other, but probably not both at the same
# time. PKGBUILDs can't express such a relation, and especially not if both
# solutions are part of the AUR. So I've put both of them into the `optdepends`
# list, and only made the package depend on the bare minimum `ttf-font`
# meta-package so that it would render *any* text at all.

pkgname=seihou-shuusou-gyoku
pkgver=P0326
pkgrel=1
pkgdesc='First game of the Seihou project; ReC98 source port, engine only'
arch=('x86_64' 'i686')
url='https://github.com/nmlgc/ssg'
license=('MIT')
makedepends=(
	'git'
	'jq'
	'pkg-config'
	'tup'
)
depends=(
	'cairo'
	'fontconfig'
	'hicolor-icon-theme'
	'libblake3'
	'libvorbis'
	'libwebp'
	'pango'
	'sdl3'
	'ttf-font'
)
optdepends=(
	"ttf-ipa-mona: Free Japanese bitmap font, metric-compatible with the original game's MS Gothic"
	"ttf-ms-win11-auto-japanese: Extracts MS Gothic from a Windows 11 ISO"
)
source=("git+https://github.com/nmlgc/ssg.git#tag=P0326")
b2sums=('SKIP')
_skel=/usr/share/$pkgname/skel

build() {
	cd "$srcdir/ssg"
	export PATH_SKELETON="$_skel"
	export APP_ID="$pkgname"

	# Unconditionally updating without a preceding `git submodule init` does
	# the right thing in all cases:
	# • For the initial package build, it does nothing, leaving shallow and
	#   sparse submodule initialization to `build.sh`.
	# • On subsequent package builds, it checks out the correct commits of all
	#   registered submodules. This bypasses the warning in `build.sh`, but
	#   matches `makepkg`'s unconditional checkout of the main repo.
	git submodule update

	# `-Wp,-D_FORTIFY_SOURCE=3` currently clashes with the std.compat module:
	#
	# 	https://github.com/llvm/llvm-project/issues/121709
	CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}" LFLAGS=$LDFLAGS ./build_linux.sh "bin/GIAN07"
}

package() {
	cd "$srcdir/ssg"
	ROOT="$pkgdir/usr" PATH_SKELETON="$pkgdir$_skel" ./install_linux.sh "$pkgname"
}
