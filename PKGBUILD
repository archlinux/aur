# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=ultra-flat-icons
pkgver=1.3.4
pkgrel=1
pkgdesc='A simple flat icon theme, derived from Flattr icon theme.'
arch=('any')
url='http://gnome-look.org/content/show.php?content=167477'
license=('CCPL:cc-by-nc-sa-4.0')

depends=('xdg-utils')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

options=(!strip !emptydirs)
install=${pkgname}.install

# Original source
# https://www.dropbox.com/s/dktl70lh4lnhp0a/ultra-flat-icons.tar.gz
source=(
	"https://www.dropbox.com/s/35k1ckffe17ba8r/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.install"
	'default_theme.patch'
	'default_dark_theme.patch'
	'orange_theme.patch'
	'orange_dark_theme.patch'
	'green_theme.patch'
	'green_dark_theme.patch'
)
sha512sums=(
	'b39093e0ea3d79d01616058a8b03d2aa570e1728b642eac41bd0f0f1dbcd77416ac017fd1378c6118579463a018273cdfd5220712508336bc63b8c147eb5b1a2'
	'214a66945265b3cf304651514792f9f4a32959f2d9f18cfd9c2e2ea4ccf44264a5ccedb4f8790c1e3b6fe6b6b4caf981890759fce7538f003682f98fe5374213'
	'7ddc033e356e8db98075d7e6043ceffb9399af1588ef0ac0db4131a0196ba1ac344abb30b8cc80fd08cbc7a65d50c1f3a80dbd92853ad04c914a5f157afc8467'
	'3a8c48e3255aef9c60ee24b3b0a17c6ec22eb2862b87036b68304c1b6106cd6f956d74d9f9bcc7a336cac602a565fd52d2cdb270cdb62d99b9b4b869ef722c8b'
	'177c1450088637ff5436f5c5825c14aa49a51aaa4cc7c6a884bd4fb21916d2a154cc48cdc8493d87d4be1babbf3b400c5f287331717ef704da19358d16095c46'
	'147a395229893925dc242aec34254e5c98658fca94ac081bf43b6a109abb48772b75f398ea993f16182b4e6a95b34d5f600c8b3b9f35ba14065c447fee58e2cc'
	'9135d2109fc9fb634cd8ea6f5c7bdbe9448bf456b97d15685612259fecf768dc35f2308fc5ead2885d1d4d61f5219b50fda22148a4c6d32c002afc68c0bb9122'
	'ad5f4edeaae0e7d2ffbee81b933f72c4b38f934eb9782cce00e0170d7f90ad09432d98110247bd7a5e4d835badafd81f4b8a51434b3ec906819639a20c0471ac'
)

_iconset=UltraFlatIcons

icon_fix() {
	# Check if dir exists
	if [[ ! -d ${1} ]]; then
		warning "${1} doesn't exist"
	else
		# Change current working directory
		cd ${1}
		
		# App icons fix
		if [[ -d ./apps ]]; then
			# AMD Catalyst icons fix
			ln -fsr ./apps/scalable/amd.svg ./apps/scalable/ccc_large.svg
			
			# Wicd icon fix
			mkdir -p ./extras/pixmaps/wicd
			ln -fsr ./apps/scalable/wicd.svg ./extras/pixmaps/wicd/wicd.svg
			ln -fsr ./apps/scalable/wicd-qt.svg ./extras/pixmaps/wicd/wicd-qt.svg
			ln -fsr ./apps/scalable/wicd-gtk.svg ./extras/pixmaps/wicd/wicd-gtk.svg
		fi
		
		# Categories icons fix
		if [[ -d ./categories ]]; then
			# System tools category fix
			ln -fsr ./categories/scalable/preferences-other.svg ./categories/scalable/applications-system.svg
		fi
		
		# Places icons fix
		if [[ -d ./places ]]; then
			# Symbolic links fix
			ln -fsr ./places/scalable/folder-music.svg ./places/scalable/library-music.svg
			ln -fsr ./places/scalable/folder-favorites.svg ./places/scalable/folder-important.svg
		fi
		
		# Status icons fix
		if [[ -d ./status ]]; then
			# Volume icons fix
			ln -fsr ./status/scalable/audio-volume-muted-panel.svg ./status/scalable/audio-volume-muted.svg
			ln -fsr ./status/scalable/audio-output-none-panel.svg ./status/scalable/audio-output-none.svg
			ln -fsr ./status/scalable/audio-volume-low-panel.svg ./status/scalable/audio-volume-low.svg
			ln -fsr ./status/scalable/audio-volume-medium-panel.svg ./status/scalable/audio-volume-medium.svg
			ln -fsr ./status/scalable/audio-volume-high-panel.svg ./status/scalable/audio-volume-high.svg
		fi
	fi
}

package() {
	# Base directory 
	mkdir -p ${pkgdir}/usr/share/icons
	cd ${pkgdir}/usr/share/icons
	
	msg2 'Installing default icon theme...'
	mkdir ${_iconset}
	cp -a ${srcdir}/${pkgname}/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ./${_iconset}
	rm -fR ./${_iconset}/status/scalable\ white\ panel status
	patch ./${_iconset}/index.theme < ${srcdir}/default_theme.patch
	
	msg2 'Installing default dark icon theme...'
	mkdir ${_iconset}Dark
	cp -a ${srcdir}/${pkgname}/{status,index.theme} ./${_iconset}Dark
	rm -fR ./${_iconset}Dark/status/scalable
	mv ./${_iconset}Dark/status/scalable\ white\ panel ./${_iconset}Dark/status/scalable
	patch ./${_iconset}Dark/index.theme < ${srcdir}/default_dark_theme.patch
	
	msg2 'Installing icon theme folders...'
	mkdir ${_iconset}Orange
	cp -a ${srcdir}/${pkgname}-orange/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ./${_iconset}Orange
	rm -fR ./${_iconset}Orange/status/scalable\ white\ panel status
	patch ./${_iconset}Orange/index.theme < ${srcdir}/orange_theme.patch
	
	msg2 'Installing dark icon theme orange folders...'
	mkdir ${_iconset}OrangeDark
	cp -a ${srcdir}/${pkgname}-orange/{status,index.theme} ./${_iconset}OrangeDark
	rm -fR ./${_iconset}OrangeDark/status/scalable
	mv ./${_iconset}OrangeDark/status/scalable\ white\ panel ./${_iconset}OrangeDark/status/scalable
	patch ./${_iconset}OrangeDark/index.theme < ${srcdir}/orange_dark_theme.patch
	
	msg2 'Installing icon theme green folders...'
	mkdir ${_iconset}Green
	cp -a ${srcdir}/${pkgname}-mint-green/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ./${_iconset}Green
	rm -fR ./${_iconset}Green/status/scalable\ white\ panel status
	patch ./${_iconset}Green/index.theme < ${srcdir}/green_theme.patch
	
	msg2 'Installing dark icon theme green folders...'
	mkdir ${_iconset}GreenDark
	cp -a ${srcdir}/${pkgname}-mint-green/{status,index.theme} ./${_iconset}GreenDark
	rm -fR ./${_iconset}GreenDark/status/scalable
	mv ./${_iconset}GreenDark/status/scalable\ white\ panel ./${_iconset}GreenDark/status/scalable
	patch ./${_iconset}GreenDark/index.theme < ${srcdir}/green_dark_theme.patch
	
	msg2 'Fixing icons...'
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}{,Dark,Orange,OrangeDark,Green,GreenDark}
	
	msg2 'Installing license...'
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}