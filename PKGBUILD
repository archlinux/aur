# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=ultra-flat-icons
pkgver=1.3.4
pkgrel=3
pkgdesc='A simple flat icon theme, derived from Flattr icon theme.'
arch=('any')
url='http://gnome-look.org/content/show.php?content=167477'
license=('CCPL:cc-by-nc-sa-4.0')

depends=('xdg-utils')
provides=("${pkgname}=${pkgver}")

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
	'79a9f3dfb469b162a2248c10ff94cc0808ce75b1d820da95caccca3a0a42ee2faf3287837a8bd539e6d27216b4654e6f1b1f39382483ed9526967ed9a2a0ccf7'
	'bae589e7ec2852616c68a52b34eaa2828f59d5d00a3ed11d61023b76b1f62fe394e524a750ab01f7c7a917177b45b6f158357d9977d2908bb9cd3bf0d5e70ceb'
	'495decc86cd72bb3ee5f9c4ebb8c186fd5b8512cff649aa625a03aae53c5ee2ce6f8d8f9677d2bc13030ffa007472d22b6cde4780f9339639c4c5e6742c324da'
	'37cf0a5aa99f90893674bfcb5c69439bdda87db6c3e4909524ff65f7ae28a4085c8afee53288af0f1a3349056334fb7384005e5c32883aee27692bcbba401cd8'
	'514bf182cf37c89c97e019eb06f9485cc10255fbaa6d21bc3700cdc853b19663bafe19e408f43924fb34d27cf59b3936144bb07f086ccde105a3d670b8e49223'
	'06dd441588c7cc0dc2c6982c75d23121e89f0ef7c905a5a91cfaba33957fc02eec39ac930377d93e1ae484f2da1eee802b2869ca3b374654fe8e5f759bbb5d56'
)

icon_fix() {
	# Check if dir exists
	if [[ ! -d ${1} ]]; then
		warning "${1} doesn't exist"
	else
		# Change current working directory
		cd ${1}
		
		# Apps
		if [[ -d apps ]]; then
			# AMD Catalyst
			ln -fsr apps/scalable/amd.svg apps/scalable/ccc_large.svg
			
			# Wicd
			mkdir -p extras/pixmaps/wicd
			ln -fsr apps/scalable/wicd.svg extras/pixmaps/wicd/wicd.svg
			ln -fsr apps/scalable/wicd-qt.svg extras/pixmaps/wicd/wicd-qt.svg
			ln -fsr apps/scalable/wicd-gtk.svg extras/pixmaps/wicd/wicd-gtk.svg
			
			# Qt Designer
			ln -fsr apps/scalable/qt.svg apps/scalable/QtProject-designer.svg
		fi
		
		# Categories
		if [[ -d categories ]]; then
			# System tools category
			ln -fsr categories/scalable/preferences-other.svg categories/scalable/applications-system.svg
		fi
		
		# Places
		if [[ -d places ]]; then
			# Folders
			ln -fsr places/scalable/folder-music.svg places/scalable/library-music.svg
			ln -fsr places/scalable/folder-favorites.svg places/scalable/folder-important.svg
		fi
		
		# Status
		if [[ -d status ]]; then
			# Volume icons
			ln -fsr status/scalable/audio-volume-muted-panel.svg status/scalable/audio-volume-muted.svg
			ln -fsr status/scalable/audio-output-none-panel.svg status/scalable/audio-output-none.svg
			ln -fsr status/scalable/audio-volume-low-panel.svg status/scalable/audio-volume-low.svg
			ln -fsr status/scalable/audio-volume-medium-panel.svg status/scalable/audio-volume-medium.svg
			ln -fsr status/scalable/audio-volume-high-panel.svg status/scalable/audio-volume-high.svg
			
			# Dark theme
			if [[ ${2} == true ]]; then
				# Replace folder
				rm -fR status/scalable
				mv status/scalable\ white\ panel status/scalable
			else
				rm -fR status/scalable\ white\ panel
			fi
		fi
	fi
}

package() {
	# Base directory 
	mkdir -p ${pkgdir}/usr/share/icons
	cd ${pkgdir}/usr/share/icons
	
	# Icon base name
	local _iconset=UltraFlatIcons
	
	# Default
	mkdir ${_iconset}
	cp -a ${srcdir}/${pkgname}/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ${_iconset}
	patch ${_iconset}/index.theme < ${srcdir}/default_theme.patch
	
	# Default dark
	mkdir ${_iconset}Dark
	cp -a ${srcdir}/${pkgname}/{status,index.theme} ${_iconset}Dark
	patch ${_iconset}Dark/index.theme < ${srcdir}/default_dark_theme.patch
	
	# Orange
	mkdir ${_iconset}Orange
	cp -a ${srcdir}/${pkgname}-orange/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ${_iconset}Orange
	patch ${_iconset}Orange/index.theme < ${srcdir}/orange_theme.patch
	
	# Orange dark
	mkdir ${_iconset}OrangeDark
	cp -a ${srcdir}/${pkgname}-orange/{status,index.theme} ${_iconset}OrangeDark
	patch ${_iconset}OrangeDark/index.theme < ${srcdir}/orange_dark_theme.patch
	
	# Green
	mkdir ${_iconset}Green
	cp -a ${srcdir}/${pkgname}-mint-green/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ${_iconset}Green
	patch ${_iconset}Green/index.theme < ${srcdir}/green_theme.patch
	
	# Green dark
	mkdir ${_iconset}GreenDark
	cp -a ${srcdir}/${pkgname}-mint-green/{status,index.theme} ${_iconset}GreenDark
	patch ${_iconset}GreenDark/index.theme < ${srcdir}/green_dark_theme.patch
	
	# Fix
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}Dark true
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}Orange
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}OrangeDark true
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}Green
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}GreenDark true
	
	# License
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	cp ${srcdir}/${pkgname}/CREDITS ${pkgdir}/usr/share/licenses/${pkgname}
}