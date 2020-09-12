# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>

pkgname=pokemon-revolution-online-bin
pkgver=0.98.5.20200912.megav2
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
__DATA_VER=0.2
source=("https://gitlab.com/fabis_cafe/pokemon-revolution-online-data/-/archive/${__DATA_VER}/pokemon-revolution-online-data-${__DATA_VER}.zip"
	"PROClient_linux.7z::https://ddl.pokemonrevolution.net/PROClient_linux.7z"
)
sha256sums=('1bf2b078c4f226bd8716e1b6c680e9545dc6491e0de067ecf5105553aa90ba46'
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
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/proclient.svg" \
		"${pkgdir}/usr/share/pixmaps/proclient.svg"
	
	# DESKTOP FILE
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/net.pokemon-revolution-online.desktop" \
		"${pkgdir}/usr/share/applications/net.pokemon-revolution-online.desktop"

	# START SCRIPT
	/usr/bin/install -D -m755 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/PROClient" \
		"${pkgdir}/usr/bin/PROClient"

	# COPYRIGHT FILE
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pkg_copyright" \
		"${pkgdir}/usr/share/licenses/pokemon-revolution-online-bin/copyright"
}
