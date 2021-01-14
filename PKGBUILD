# Maintainer: Nover <novares.x@gmail.com>
# Maintainer: agentcobra <agentcobra@free.fr>

# Creator Blade <contact@blade-group.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta

# Import parse_yaml script
. parse_yaml.sh

# Get the info from the yaml
info() {
	if [ ! -f info.yml ]; then
		curl -s "https://storage.googleapis.com/shadow-update/launcher/${basename}/linux/ubuntu_18.04/latest-linux.yml" -o info.yml
	fi

	eval $(parse_yaml info.yml "shadow_")
}

# Get the package version
pkgver() {
	info

  echo "$shadow_version"
}

# Get the SHA512 checksum
sha512sum() {
	info

	echo "$shadow_sha512" | base64 -d | xxd -ps -c 512
}

file() {
	echo "$pkgname-$pkgver-$pkgrel.AppImage"
}

# Extract the zip file and prepare for the build
prepare() {
	# Give execution rights
	chmod +x $(file)

	# Extract AppImage
	./$(file) --appimage-extract
}

# Build the package
package() {
	# Make the directories
	mkdir -p "${pkgdir}/opt"

	# Move directories
	mv "${srcdir}/squashfs-root/usr" "${pkgdir}"
	mv "${srcdir}/squashfs-root" "${pkgdir}/opt/${pkgname}"

	# Move de icons
	mv "${pkgdir}/usr/share/icons/hicolor/0x0/" "${pkgdir}/usr/share/icons/hicolor/1024x1024/"

	# Make a copy of the icons
	cp "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/shadow.png" "${pkgdir}/usr/share/icons/"

	# Fix rights
	chmod -R g-w "${pkgdir}/usr"
	chmod -R g-w "${pkgdir}/opt"

	# Create shortcut folder
	mkdir "${pkgdir}/usr/share/applications"

	# Move to shortcut directory
	cd "${pkgdir}/usr/share/applications"

	mv "${pkgdir}/opt/${pkgname}/shadow.desktop" "${pkgname}.desktop"
	sed -i -e 's/^Categories=.*$/Categories=Games;Game;Utility;Virtualization/g' ${pkgname}.desktop
	sed -i -e "s/^Exec=.*$/Exec=\/opt\/${pkgname}\/shadow --no-sandbox/g" ${pkgname}.desktop

	chmod g-w ${pkgname}.desktop

	# Create shortcut
	mkdir -p "${pkgdir}/usr/bin"
	ln -srf "/opt/${pkgname}/shadow" "${pkgdir}/usr/bin/${pkgname}"

	# Remove AppImage related files
	rm "${pkgdir}/opt/${pkgname}/AppRun"

	# Remove embedded libraries to avoid conflicts
	rm -R "${pkgdir}/usr/lib"

	# Fix rights
	chmod 755 -R "${pkgdir}"
}

_commit=9add3366d25530d51d168608c54b5339b64d2a4e
pkgname=shadow-tech
basename=prod
pkgver="$(pkgver)"
pkgrel=1
pkgdesc="Shadow application"
arch=('x86_64')
url="https://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'libuv' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu' 'libxss' 'libsndio-61-compat' 'gnome-keyring')
optdepends=('libva-vdpau-driver-shadow-nvidia: Patch for recent Nvidia GPU' 'nouveau-fw: Driver for old Nvidia GPU' 'libva-intel-driver: Driver for Intel GPU')
provides=(shadow-tech)
source=("$(file)::https://update.shadow.tech/launcher/${basename}/linux/ubuntu_18.04/Shadow.AppImage")
# sha512sums=("$(sha512sum))
sha512sums=('SKIP')
install=$pkgname.install
