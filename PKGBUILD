# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Coolen
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Mark Coolen <mark d_t coolen _t gmail d_t com>

_pkgname="TIM2"
pkgname="the-incredible-machine-2"
pkgver="1.0"
pkgrel=6
pkgdesc="A classic puzzle game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/395/Incredible+Machine+2,+The.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
depends=('dosbox' 'unionfs-fuse')
source=('The_Incredible_Machine_2.zip::http://files.abandonia.com/download.php?game=Incredible+Machine+2%2C+The&secure=98ddb7b4cd755918180065de92319f8f&td=1297665430' 'TIM2.png')
sha256sums=('560b0db9d9d10a2aad14b9c3ea22676efe2ac377b41b12df3ae0b4f1a202c21c'
            '8eaaf9611c9ef77105288be1190b176e04beab6d0513f39dfa5a06dadb0e2ace')

package() {
	install -d -m755 "${pkgdir}/opt/abandonia/${_pkgname}"
	cp -ar "${srcdir}/the incredible machine 2"/* "${pkgdir}/opt/abandonia/${_pkgname}" 
	# Install the icon to pixmaps directory
	install -D -m644 "${srcdir}"/TIM2.png "${pkgdir}"/usr/share/pixmaps/TIM2.png

	# Create a script to start the game
	install -d -m755 "${pkgdir}"/usr/bin/ 
	cat <<- __EOF__ > "${pkgdir}/usr/bin/${_pkgname}"
		#!/bin/sh
		if whereis unionfs-fuse>/dev/null 2>&1 ; then
			if whereis dosbox>/dev/null 2>&1 ; then
				mkdir -p ~/.abandonia/${_pkgname}/temp
				mkdir -p ~/.abandonia/${_pkgname}/persistent
				unionfs -o cow -o umask=000 ~/.abandonia/${_pkgname}/persistent=RW:/opt/abandonia/${_pkgname}=RO ~/.abandonia/${_pkgname}/temp
				dosbox ~/.abandonia/${_pkgname}/temp/TIM2.EXE
				fusermount -u ~/.abandonia/${_pkgname}/temp
			else
				echo '==> Please be sure to have dosbox installed and in your PATH.'
			fi
    	else
 			echo '==> Please be sure to have unionfs-fuse installed and in your PATH.'
		fi
	__EOF__
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	# Create a .desktop file
	install -d -m755 "$pkgdir/usr/share/applications/" 
	cat <<- __EOF__ > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=${pkgname}
		Comment=${pkgdesc}
		Exec=/usr/bin/${_pkgname}
		Icon=${_pkgname}
		Categories=Game;
		Terminal=false
		StartupNotify=false
	__EOF__
} 
