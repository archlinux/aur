# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=ultra-flat-icons
pkgver=1.3.4
pkgrel=4
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
	'index_theme_fix.patch'
)
sha512sums=(
	'b39093e0ea3d79d01616058a8b03d2aa570e1728b642eac41bd0f0f1dbcd77416ac017fd1378c6118579463a018273cdfd5220712508336bc63b8c147eb5b1a2'
	'214a66945265b3cf304651514792f9f4a32959f2d9f18cfd9c2e2ea4ccf44264a5ccedb4f8790c1e3b6fe6b6b4caf981890759fce7538f003682f98fe5374213'
	'3ce42f27f494f8b4a715e646faeb611d4e573a2bc5960b7f340426bded98c85f2c3ea2a1a1c88256c861558c1f4a4e0408b5f3696ec60c87eb7bd5bf2bf8145c'
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
		
		# Get back to previous directory
		cd ..
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
	
	# Default dark
	mkdir ${_iconset}Dark
	cp -a ${srcdir}/${pkgname}/{status,index.theme} ${_iconset}Dark
	
	# Orange
	mkdir ${_iconset}Orange
	cp -a ${srcdir}/${pkgname}-orange/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ${_iconset}Orange
	
	# Orange dark
	mkdir ${_iconset}OrangeDark
	cp -a ${srcdir}/${pkgname}-orange/{status,index.theme} ${_iconset}OrangeDark
	
	# Green
	mkdir ${_iconset}Green
	cp -a ${srcdir}/${pkgname}-mint-green/{actions,apps,categories,devices,emblems,mimetypes,places,status,index.theme} ${_iconset}Green
	
	# Green dark
	mkdir ${_iconset}GreenDark
	cp -a ${srcdir}/${pkgname}-mint-green/{status,index.theme} ${_iconset}GreenDark
	
	# Fix
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}Dark true
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}Orange
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}OrangeDark true
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}Green
	icon_fix ${pkgdir}/usr/share/icons/${_iconset}GreenDark true
	
	# Patch index files
	patch -p1 < ${srcdir}/index_theme_fix.patch
	
	# License
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	cp ${srcdir}/${pkgname}/CREDITS ${pkgdir}/usr/share/licenses/${pkgname}
}