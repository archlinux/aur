# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>

pkgname=pokemon-revolution-online-bin
__DATA_VER=0.3.1
pkgver=0.98.5.20200913_${__DATA_VER}.megav2
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="https://pokemon-revolution-online.net"
license=('custom')
depends=('desktop-file-utils')
makedepends=('xdg-utils')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
conflicts=('pokemon-revolution-online')
install=$(/usr/bin/tail -n 1 /usr/lib/os-release | /usr/bin/cut -d= -f2).install
source=("https://gitlab.com/fabis_cafe/pokemon-revolution-online-data/-/archive/${__DATA_VER}/pokemon-revolution-online-data-${__DATA_VER}.zip"
	"PROClient_linux.7z::https://ddl.pokemonrevolution.net/PROClient_linux.7z"
)
sha256sums=('ab38844feddb7b3df18ad7149272b908c63ecc5c654005188cfaf9db5b05b3c4'
            '9b127ad358bf3f0fbe72271cb31b465a01d422a09f5715adaa7755e2adfd85a3')

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
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/net.pokemonrevolution.svg" \
		"${pkgdir}/usr/share/pixmaps/net.pokemonrevolution.svg"
	
	# DESKTOP FILE
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/net.pokemonrevolution.desktop" \
		"${pkgdir}/usr/share/applications/net.pokemonrevolution.desktop"

	# START SCRIPT
	/usr/bin/install -D -m755 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/PROClient" \
		"${pkgdir}/usr/bin/PROClient"

	# COPYRIGHT FILE
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pkg_copyright" \
		"${pkgdir}/usr/share/licenses/pokemon-revolution-online-bin/copyright"
}
