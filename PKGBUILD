# Maintainer: Harms <thotro at lyse dot net>

pkgname=tome4-beta
pkgver='1.3.0b1'
pkgrel='1'
pkgdesc="An open-source, single-player, role-playing roguelike game set in the world of Eyal."
arch=('i686' 'x86_64')
url="http://tome.te4.org/"
license=('custom' 'GPL3')
depends=('glu' 'openal' 'libvorbis' 'sdl2_ttf>=2.0.12' 'sdl2_image>=2.0.0' )
makedepends=('premake' 'zip' 'unzip')
options=(!makeflags emptydirs)
source=("http://te4.org/dl/t-engine/t-engine4-src-${pkgver}.tar.bz2"
	"aur-tome4-${pkgver}-${pkgrel}.patch"
	tome4
	tome4.desktop)
conflicts=('tome4' 'tome4-git' 'tome4-nomusic')
sha256sums=(
	'94fae112702729829e3918dd6b3590befc7156c99fa3ab069ae5fbe6a404f496'
	'ead12adf4c2321d3e7bfd157189975145ed0b7f681b628b82f0171ebaf628d34'
	'3a1e4901337f91697bcfaf095f488c447c27ccc2484a543e31f024d5aefb61a0'
	'80e663d9eb2d41c6d9c0a6b4b5b52eb33b0872c3412a617530777fd137c0baa1'
)

###############################################################################
# 1. Patch the game.
###############################################################################
prepare() {
	cd "$srcdir"/t-engine4-src-${pkgver}
	patch -p1 < "${srcdir}/aur-tome4-${pkgver}-${pkgrel}.patch"
}

###############################################################################
# 2. Build the game engine from source.
###############################################################################
build() {
	cd t-engine4-src-${pkgver}
	premake4 gmake
	make config=release
}

###############################################################################
# 3. Create the package. Copy all that shall be installed into the package dir.
###############################################################################
package() {
	# Extract and install the icon.
	unzip -oj -qq "${srcdir}/t-engine4-src-${pkgver}/game/engines/te4-1.3.0.teae" \
		"data/gfx/te4-icon.png" -d "${srcdir}"
	install -Dm644 "${srcdir}/te4-icon.png" "${pkgdir}/usr/share/pixmaps/tome4.png"
	
	# Install the documents.
	install -Dm644 "${srcdir}/t-engine4-src-${pkgver}/CONTRIBUTING" "${pkgdir}/usr/share/doc/tome4/CONTRIBUTING"
	install -Dm644 "${srcdir}/t-engine4-src-${pkgver}/CREDITS" "${pkgdir}/usr/share/doc/tome4/CREDITS"
	
	# Install the custom license into standard location.
	install -Dm644 "${srcdir}/t-engine4-src-${pkgver}/COPYING-MEDIA" "${pkgdir}/usr/share/licenses/tome4/COPYING-MEDIA"

	# Install the game executable, and the launcher.
	install -Dm755 "${srcdir}/t-engine4-src-${pkgver}/t-engine" "${pkgdir}/opt/tome4/t-engine"
	install -Dm755 "${srcdir}/tome4" "${pkgdir}/usr/bin/tome4"
	install -Dm644 "${srcdir}/tome4.desktop" "${pkgdir}/usr/share/applications/tome4.desktop"
	
	# Install the game data.
	cp -r "${srcdir}/t-engine4-src-${pkgver}/bootstrap" "${pkgdir}/opt/tome4/"
	cp -r "${srcdir}/t-engine4-src-${pkgver}/game" "${pkgdir}/opt/tome4/"
	
	# Delete built-in fonts from the game.
	zip -d -qq "${pkgdir}/opt/tome4/game/engines/te4-1.3.0.teae" \
		data/font/Vera.ttf \
		data/font/VeraBd.ttf \
		data/font/VeraIt.ttf \
		data/font/VeraMono.ttf \
		data/font/VeraMoBd.ttf \
		data/font/DroidSans.ttf \
		data/font/DroidSansMono.ttf \
		data/font/DroidSans-Bold.ttf \
		data/font/DroidSerif.ttf \
		data/font/DroidSerif-Bold.ttf \
		data/font/DroidSerif-Italic.ttf \
		data/font/DroidSerif-BoldItalic.ttf
}
