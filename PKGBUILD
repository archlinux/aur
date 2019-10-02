#! /bin/bash

Name="QSyncthingTray"
LowercaseName=$(echo "${Name,,}")
pkgname="${LowercaseName}-git"

pkgver=r421.11936bc
pkgrel=2
arch=("i686" "x86_64")

pkgdesc="Syncs files among devices, and shows the sync status on a tray icon. Version with the latest unreleased improvements."
license=("LGPL3")

url="https://github.com/sieren/QSyncthingTray"
source=("git+${url}.git" "${LowercaseName}.desktop")
md5sums=("SKIP" "SKIP")

makedepends=("cmake" "git")
depends=("qt5-location" "qt5-webengine" "startup-settings-git" "syncthing")
provides=("${LowercaseName}")
conflicts=("${LowercaseName}")


pkgver() {
	cd "${Name}"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "${srcdir}/${Name}"

	mkdir "build"
	cd "build"

	cmake ".."
	make
}


package() {
	mkdir --parents "${pkgdir}/usr/bin"
	mkdir --parents "${pkgdir}/usr/share/pixmaps"
	mkdir --parents "${pkgdir}/usr/share/applications"

	mv "${srcdir}/${Name}/build/${Name}" "${pkgdir}/usr/bin/${LowercaseName}"
	cp "${srcdir}/${Name}/resources/images/Icon1024.png" "${pkgdir}/usr/share/pixmaps/${LowercaseName}.png"
	cp "${srcdir}/${LowercaseName}.desktop" "${pkgdir}/usr/share/applications/${LowercaseName}.desktop"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod +x "${pkgdir}/usr/bin/${LowercaseName}"
}

