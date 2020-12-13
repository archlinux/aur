# Maintainer: Fabian Bornschein <plusfabi-cat-gmail-dog-com>

pkgname=pokemon-revolution-online-bin
__LIN_DESKTOP_ASSET_VER=0.3.2
pkgver=20201201+${__LIN_DESKTOP_ASSET_VER}
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="https://pokemonrevolution.net"
license=('custom')
depends=('vulkan-driver' 'opengl-driver')
makedepends=('git')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
conflicts=('pokemon-revolution-online')
install="archlinux.install"
source=("git+https://gitlab.com/fabis_cafe/pro_assets_lin_desktop.git#tag=${__LIN_DESKTOP_ASSET_VER}"
	"PROClient_linux.zip::https://ddl.pokemonrevolution.net/PROClient_linux.zip"
)
sha256sums=('SKIP'
            '35143e4cc62cfde4d6f529afbf522ca8092e5b40d6bf77a484cb38865a99ff7b')

package() {
	#PROCLIENT PART
	###############
	
	# CREATE: directory structure
	/usr/bin/install -dm755 "${pkgdir}/opt/PROClient"
	
	## This uses "." as current dir, in order to not have the whole build path (for many /home/user/blabla)
	## in the install path. srcdir needs to be the starting point.
	cd "${srcdir}/PROClient"
	/usr/bin/find . \
		-type d \
		-exec \
			/usr/bin/install -dm755 "${pkgdir}/opt/PROClient/{}" \;
			
	# INSTALL: 
	/usr/bin/find . \
		-type f \
		! -name "PROClient.x86_64" \
		-exec \
			/usr/bin/install -m644 "{}" "${pkgdir}/opt/PROClient/{}" \;

	/usr/bin/install -m755 "${srcdir}/PROClient/PROClient.x86_64" "${pkgdir}/opt/PROClient/PROClient.x86_64"

	#_DATA PART
	###########
	
	#MOVE ICON
	## The original icon is proprietary with a license that don't allows changes to the overall content.
	## Don't use the original icon for the '.desktop entry because of this.
	/usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/net.pokemonrevolution.svg" \
		"${pkgdir}/usr/share/pixmaps/net.pokemonrevolution.svg"
	
	# DESKTOP FILE
	/usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/net.pokemonrevolution.desktop" \
		"${pkgdir}/usr/share/applications/net.pokemonrevolution.desktop"

	# START SCRIPT
	/usr/bin/install -D -m755 "${srcdir}/pro_assets_lin_desktop/PROClient" \
		"${pkgdir}/usr/bin/PROClient"

	# COPYRIGHT FILE
	/usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/pkg_copyright" \
		"${pkgdir}/usr/share/licenses/pokemon-revolution-online-bin/copyright"
}
