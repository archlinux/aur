# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_pkgname="betterdiscord-installer"
pkgname="$_pkgname-bin"
pkgver=1.1.1
pkgrel=1

pkgdesc="A simple standalone program which automates the installation, removal and maintenance of BetterDiscord."
arch=('x86_64')
url="https://github.com/BetterDiscord/Installer"
#url="https://betterdiscord.app/"
license=('MIT')

depends=("nss" "gtk3" "libxss")
provides=("betterdiscord" "$_pkgname")
conflicts=("betterdiscord" "$_pkgname")
replaces=("betterdiscord" "$_pkgname")
options=(debug !strip emptydirs zipman)
options=(strip emptydirs zipman)
install="$pkgname.install"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/BetterDiscord/Installer/releases/download/v${pkgver}/BetterDiscord-Linux.AppImage"
	"LICENSE::https://raw.githubusercontent.com/BetterDiscord/Installer/main/LICENSE"
	"file://usr--SLASH--bin--SLASH--betterdiscord-installer")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('c194f60370a02c40b9513aea01c9faf5a9066215b9d624169ba294084434e2bb60f176a9c2b4c6c2f59413e37c63ef7dfbeedfe416ccacb9ffee5ebdec054989'
	'9efca07a8806137067825ffa7e285950d4bbd1ed3c5a252af83d9408d51fc6530f9be7e1a467e28e73374b9057f52646fff419545a9d2fa466412ee2043ac56d'
	'b31d61be03a20c315a0fbcf2b2a75da5fe442d7de7951a9c75c31e34ed0c91c9f15b585bc82fa9634e913c774b3f932cf3d476b981eacfb8707f6db7503494c7')

log() {
	echo -e "    $1...\c"
}
log_status() {
	BGreen='\033[1;32m' # Bold Green
	BRed='\033[1;31m'   # Bold Red
	Reset='\033[0m'     # Reset

	if [ $1 == 0 ]; then
		echo -e "$BGreen\c"
		echo -e "done.$Reset"
	else
		echo -e "$BRed\c"
		echo -e "failed.$Reset"
	fi
}

prepare() {
	#
	# making .AppImage file executable
	log "making \"${pkgname}-${pkgver}.${CARCH}.AppImage\" file executable"
	chmod +x "${pkgname}-${pkgver}.${CARCH}.AppImage"
	log_status $?

	#
	# extract .AppImage file
	log "extracting \"${pkgname}-${pkgver}.${CARCH}.AppImage\" file"
	"./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract >/dev/null
	log_status $?
}

build() {
	#
	# modifying .desktop file
	log "modifying \"${_pkgname}.desktop\" file"
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
	log_status $?
}

package() {
	#
	# Copy app files
	log "copying app files too /opt/${pkgname}"
	install -dm0755 "${pkgdir}/opt/${pkgname}"
	cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}"
	log_status $?

	#
	# Fix permissions
	log "fixing permissions"
	for d in locales resources; do
		chmod 0755 "${pkgdir}/opt/${pkgname}/$d"
		find "${pkgdir}/opt/${pkgname}/$d" -type d -exec chmod 0755 {} +
	done
	log_status $?

	#
	# Link entry point
	log "copying usr--SLASH--bin--SLASH--betterdiscord-installer to /usr/bin/${_pkgname}"
	install -dm0755 "${pkgdir}/usr/bin"
	cp "usr--SLASH--bin--SLASH--betterdiscord-installer" "${pkgdir}/usr/bin/${_pkgname}"
	log_status $?

	#
	# Copy icons files
	log "copying all icons files to /usr/share/icons/"
	install -dm0755 "${pkgdir}/usr/share/icons"
	find squashfs-root/usr/share/icons -type d -exec chmod 0755 {} +
	cp -a squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"
	log_status $?

	#
	# Copy desktop file
	log "copying desktop file to /usr/share/applications/${_pkgname}.desktop"
	install -Dm0644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	log_status $?

	#
	# Install LICENSE file
	log "copying LICENSE file to /usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	log_status $?

	#
	# Remove unused files
	log "removing unused files"
	rm -rf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${_pkgname}.{desktop,png}}
	rm -rf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so}
	rm -rf "${pkgdir}/opt/${pkgname}"/LICENSE*
	log_status $?
}
