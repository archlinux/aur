# Maintainer: Antoine Martin <antoine.martin@protonmail.com>

pkgname="kindleforpc"
pkgver="1.16.44025"
pkgrel=1
pkgdesc="Kindle for PC using wine"
arch=(i686 x86_64)
url="amazon.ca"
license=('custom')
depends=(wine desktop-file-utils)
makedepends=(unarchiver)
source=(
	"https://s3.amazonaws.com/kindleforpc/$(echo ${pkgver} | cut -d "." -f 3)/KindleForPC-installer-${pkgver}.exe"
	"LICENSE"
	"kindleforpc.sh"
	"kindleforpc.desktop"
	"kindleforpc.png"
	)
sha256sums=(
	"2655fa8be7b8f4659276c46ef9f3fede847135bf6e5c1de136c9de7af6cac1e2"
	"de87f83a4c9b165ba1d225b28359fc9aaf0c8b449340a041ce75ae35776fbde7"
	"1d80da4ee0f78c37ebed19c2e0aff459eba3eac4bb80133170e029a6c831a1cd"
	"db8df5930d4a63ee1298450c8702d2ebba0f0794e1232abb9a69f79227c5eeac"
	"10520bcb15237f5def5c0866473c46bae392199710fb210f35a1a37fedd509d5"
	)

package() {
	#
	# Build kindle directory
	#

	# Extraction
	7z e -y -o"${srcdir}/kindleforpc/" ${srcdir}/KindleForPC-installer-${pkgver}.exe 

	# Extraction cleanup
	rm -R "${srcdir}/kindleforpc/\$R0"

	# Populating audio folder
	mkdir -p "${srcdir}/kindleforpc/audio"
	mv "${srcdir}/kindleforpc/qtaudio_windows.dll" "${srcdir}/kindleforpc/audio/qtaudio_windows.dll"

	# Populating fonts folder
	mkdir -p "${srcdir}/kindleforpc/fonts"
	
	# Populating Microsoft.VC90.CRT folder
	mkdir -p "${srcdir}/kindleforpc/Microsoft.VC90.CRT"
	mv "${srcdir}/kindleforpc/Microsoft.VC90.CRT.manifest" "${srcdir}/kindleforpc/Microsoft.VC90.CRT/Microsoft.VC90.CRT.manifest"
	mv "${srcdir}/kindleforpc/msvcm90.dll" "${srcdir}/kindleforpc/Microsoft.VC90.CRT/msvcm90.dll"
	mv "${srcdir}/kindleforpc/msvcp90.dll" "${srcdir}/kindleforpc/Microsoft.VC90.CRT/msvcp90.dll"
	mv "${srcdir}/kindleforpc/msvcr90.dll" "${srcdir}/kindleforpc/Microsoft.VC90.CRT/msvcr90.dll"

	# Populating platforms folder
	mkdir -p "${srcdir}/kindleforpc/platforms"
	mv "${srcdir}/kindleforpc/qwindows.dll" "${srcdir}/kindleforpc/platforms/qwindows.dll"
	
	# Populating plugins/imageformats
	mkdir -p "${srcdir}/kindleforpc/plugins/imageformats/"
	mv "${srcdir}/kindleforpc/qgif.dll" "${srcdir}/kindleforpc/plugins/imageformats/qgif.dll"
	mv "${srcdir}/kindleforpc/qjpeg.dll" "${srcdir}/kindleforpc/plugins/imageformats/qjpeg.dll"

	# Populating plugins/KRX/flashcardsplugin
	mkdir -p "${srcdir}/kindleforpc/plugins/KRX/flashcardsplugin/"
	mv "${srcdir}/kindleforpc/flashcardsplugin.dll" "${srcdir}/kindleforpc//plugins/KRX/flashcardsplugin/flashcardsplugin.dll"

	# Populating plugin/KRX/KeduFTUEPlugin
	mkdir -p "${srcdir}/kindleforpc/plugins/KRX/KeduFTUEPlugin/"
	mv "${srcdir}/kindleforpc/KeduFTUEPlugin.dll" "${srcdir}/kindleforpc/plugins/KRX/KeduFTUEPlugin/KeduFTUEPlugin.dll"

	# Populating plugin/KRX/kloplugin.dll
	mkdir -p "${srcdir}/kindleforpc/plugins/KRX/kloplugin/"
	mv "${srcdir}/kindleforpc/kloplugin.dll" "${srcdir}/kindleforpc/plugins/KRX/kloplugin/kloplugin.dll"

	# Populating plugin/KRX/notebookexportplugin
	mkdir -p "${srcdir}/kindleforpc/plugins/KRX/notebookexportplugin/"
	mv "${srcdir}/kindleforpc/notebookexportplugin.dll" "${srcdir}/kindleforpc/plugins/KRX/notebookexportplugin/notebookexportplugin.dll"

	# Populating plugins/sqldrivers folder
	mkdir -p "${srcdir}/kindleforpc/plugins/sqldrivers/"
	mv "${srcdir}/kindleforpc/SQLCipherPlugin.dll" "${srcdir}/kindleforpc/plugins/sqldrivers/SQLCipherPlugin.dll"


	#
	# Installation
	#

	# Kindle install
	mkdir -p "${pkgdir}/usr/share/kindleforpc"
	cp -R "${srcdir}/kindleforpc/"* "${pkgdir}/usr/share/kindleforpc/"

	# LICENSE install 
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# .desktop install
	install -Dm644 "${srcdir}/kindleforpc.desktop" "${pkgdir}/usr/share/applications/kindleforpc.desktop"

	# Icon installation
	install -Dm644 "${srcdir}/kindleforpc.png" "${pkgdir}/usr/share/pixmaps/kindleforpc.png"

	# Script installation
	install -Dm755 "${srcdir}/kindleforpc.sh" "${pkgdir}/usr/bin/kindleforpc"

	# Copywrite header
	for i in "${pkgdir}/usr/bin/kindleforpc"; do
	  	echo "#
	# Author Antoine Martin
	# Copyright (c) $(date +%Y) Antoine Martin <antoine.martin@protonmail.com>
	# Release v${pkgver}-${pkgrel} ${pkgname}
	#
	# Script forked from Mario Finelli's <mario.finelli@yahoo.com> foobar2000.sh script from the foobar2000 aur package
	#

	$(cat ${i})
	" > ${i}
	done

	}
