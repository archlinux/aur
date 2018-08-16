# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>

pkgname=pokemon-revolution-online-bin
pkgver=0.98.4.2.rootsedition
pkgrel=2
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="https://pokemon-revolution-online.net"
license=('custom')
depends=('gcc-libs' 'desktop-file-utils')
makedepends=('unzip' 'xdg-utils')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
conflicts=('pokemon-revolution-online')
install="INSTALL"
__DATA_VER=0.1.1
source=("https://gitlab.com/Fabish/pokemon-revolution-online-data/-/archive/${__DATA_VER}/pokemon-revolution-online-data-${__DATA_VER}.zip")
sha256sums=('533d250127b85054f4aa087857b130e7a21525ce6382aefd63adb564f4125212')


package() {
	cd "${srcdir}"

	# Variables
	## directory files naming is usually VNAMING_Data, binary VNAMING.x86_64
	__VNAMING="PRO" ##like PROLinux95_45_data, PROLinux95_45.x86_64

	__DLDIR=$(xdg-user-dir DOWNLOAD)	##download directory
	__DDLA="https://tiny.cc/PROLinux"	##download link
	__DDLFN="PROLINUX.zip"		##filename
	__DDLFSHA256="2e506cfb5bbe70695eeac4ca52b57b6668cc8ac0a502de08fac976780be4b038"	#sha256sum

	## Check for the download file
	if [ ! -f ${__DLDIR}/${__DDLFN} ]; then
	{
		printf "${__DLDIR}/${__DDLFN} not found, please download it\n"
		printf "Download: ${__DDLA}\n"
		exit 1
	}
	fi
	## sha256sum check
	if [ "$(sha256sum ${__DLDIR}/${__DDLFN} | awk '{printf $1}')" != "${__DDLFSHA256}" ]; then
	{
		printf "${__DLDIR}/${__DDLFN} SHA256 MISMATCH, please remove the old file before downloading\n"
		printf "rm \"${__DLDIR}/${__DDLFN}\"\n"
		printf "Download: ${__DDLA}\n\n"
		printf "maybe this pkgbuild is out-of-date. please report this:\n"
		printf "https://aur.archlinux.org/packages/pokemon-revolution-online-bin/\n"
		exit 1
	}
	fi

	#bsdtar -x -p -f "${__DLDIR}/${__DDLFN}"
	## we're using unzip for now, since bsdtar cant handle the zip file
	## bsdtar: Invalid central directory signature
	## bsdtar: Error exit delayed from previous errors.
	/usr/bin/unzip "${__DLDIR}/${__DDLFN}"

	# CREATE FOLDERS
	## copy the folderstructure of the original without content.
	/usr/bin/find "." -type d -exec \
	/usr/bin/install -d -m755 "${pkgdir}/opt/Pokemon Revolution/{}" \;

	# MOVE CONTENT
	## minimize memory usage by using mv instead of install
	## this also fits more in our "permissions" to use it hashtag copyright, hashtag do NOT modify anything
	/usr/bin/find "./${__VNAMING}_Data" \
		-type f \
		-exec /usr/bin/mv "{}" "${pkgdir}/opt/Pokemon Revolution/{}" \; \
		-exec /usr/bin/chmod 644 "${pkgdir}/opt/Pokemon Revolution/{}" \;
	## move to new position
	/usr/bin/mv "${srcdir}/${__VNAMING}.x86_64" "${pkgdir}/opt/Pokemon Revolution/${__VNAMING}.x86_64"
	## set permission
	/usr/bin/chmod 755 "${pkgdir}/opt/Pokemon Revolution/${__VNAMING}.x86_64"

	#MOVE ICON
	## cause we can not use the iroginal icon, we use a *.svg version.
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pokemonrevolution.svg" \
	"${pkgdir}/usr/share/pixmaps/pokemonrevolution.svg"

	# DESKTOP FILE
	## Set the path to our pokemon scriptfile
	/usr/bin/sed -i "s/GAMEEXECPATHSETBYPKGBUILD/\/usr\/bin\/pokemonrevolution/" "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/net.pokemon-revolution-online.desktop"
	## let's Install the *.desktop file
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/net.pokemon-revolution-online.desktop" \
	"${pkgdir}/usr/share/applications/net.pokemon-revolution-online.desktop"

	# START SCRIPT
	## set the correct directory
	/usr/bin/sed -i "s/GAMEDIRNAMESETBYPKGBUILD/\/opt\/Pokemon\ Revolution/" "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pokemonrevolution"
	## set the correct filename
	/usr/bin/sed -i "s/GAMEBINARYNAMESETBYPKGBUILD/${__VNAMING}.x86_64/" "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pokemonrevolution"

	## move it!
	/usr/bin/install -D -m755 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pokemonrevolution" \
	"${pkgdir}/usr/bin/pokemonrevolution"

	# COPYRIGHT FILE
	## move the copyright text
	/usr/bin/install -D -m644 "${srcdir}/pokemon-revolution-online-data-${__DATA_VER}/pkg_copyright" \
	"${pkgdir}/usr/share/licenses/pokemon-revolution-online-bin/copyright"
}
