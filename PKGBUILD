# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

pkgname="mymonero"
pkgver=1.2.0
pkgrel=2

pkgdesc="The simplest way to use the next-generation private digital currency Monero, at the sweet spot between security, convenience, and features."
arch=('x86_64')
# url="https://github.com/mymonero/mymonero-app-js"
url="https://www.mymonero.com/"
license=('custom:MyMonero')

depends=("libxss" "nss" "gtk3")
provides=("$pkgname")
# options=(debug !strip emptydirs zipman)
options=(strip emptydirs zipman)
install="$pkgname.install"
changelog="changelog.md"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/mymonero/mymonero-app-js/releases/download/v${pkgver}/MyMonero-${pkgver}.AppImage"
	"LICENSE::https://raw.githubusercontent.com/mymonero/mymonero-app-js/master/LICENSE.txt")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('e6185fd550ff6e28e5e65665b957a1fcb706183f7b285ce98149dfd4be680e7bfa9bf4bda7f32032fddf238f9cee83a763bcf5a962ea92894a827df537d8cf3e'
	'e15003acc9be63fd7b76a1021d86045f82fe19a63551c0f2ab1478d4e3e3be8a9bb7dc7f4f06b79fa1005995cebd73807259c3c5c36861f085ca7ad7959eef52')

log() {
	echo -e "    $1...\c"
}
log_status() {
	BGreen='\033[1;32m' # Bold Green
	BRed='\033[1;31m'   # Bold Red
	Reset='\033[0m'     # Reset

	if [ "$1" == 0 ]; then
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
	log "modifying \"${pkgname}.desktop\" file"
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" "squashfs-root/${pkgname}.desktop"
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
	log "linking /usr/bin/${pkgname} with /opt/${pkgname}/${pkgname}"
	install -dm0755 "${pkgdir}/usr/bin"
	rm "${pkgdir}/opt/${pkgname}/${pkgname}"
	mv "${pkgdir}/opt/${pkgname}/${pkgname}.bin" "${pkgdir}/opt/${pkgname}/${pkgname}"
	ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
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
	log "copying desktop file to /usr/share/applications/${pkgname}.desktop"
	install -Dm0644 "squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	log_status $?

	#
	# Install LICENSE file
	log "copying LICENSE file to /usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	log_status $?

	#
	# Remove unused files
	log "removing unused files"
	rm -rf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${pkgname}.{desktop,png}}
	rm -rf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so}
	rm -rf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}
	log_status $?
}
