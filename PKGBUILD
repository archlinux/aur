# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_pkgname="fluent-reader"
pkgname="$_pkgname-bin"
pkgver=1.0.2
pkgrel=1

pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI."
arch=('x86_64')
# url="https://github.com/yang991178/fluent-reader"
url="https://hyliu.me/fluent-reader/"
license=('custom:BSD3')

depends=("gtk3" "nss")
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
# options=(debug !strip emptydirs zipman)
options=(strip emptydirs zipman)
install="$pkgname.install"
changelog="changelog.md"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/yang991178/fluent-reader/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage"
	"LICENSE::https://raw.githubusercontent.com/yang991178/fluent-reader/master/LICENSE")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('5d1fda961ec2aceb39165dc449776a8f857297f4a404beb42b33d9a63c5f956fa1441839d77ed20e606b1d80b3db1de4b4f0eb6fbbc647dc35aaa944d7e74b7e'
	'0a8e04b682d991c30efd88ff67147b221eaf09e12c7234a776a90897bbedeb8379f73c5d853121f1b37d54bb510ea1bf223b8ef0f480ad3156c4159cbd78f0ac')

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
	log "Copying app files too /opt/${pkgname}"
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
	log "linking /usr/bin/${_pkgname} with /opt/${pkgname}/${_pkgname}"
	install -dm0755 "${pkgdir}/usr/bin"
	ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
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
	rm -rf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so.1}
	rm -rf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}
	log_status $?
}
