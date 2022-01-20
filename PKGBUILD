# Maintainer: Steven Lemaire <steven.lemaire@zii.aero>

pkgname=ringcentral-community-app-git
pkgver=0.0.4.r3.g751b79b
pkgrel=1
pkgdesc="RingCentral Community client for Linux using Electron"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/ringcentral/ringcentral-community-app"
license=('MIT')
depends=("gtk3" "nss")
makedepends=("git" "nodejs>=14" "yarn")
provides=("ringcentral-community-app")
conflicts=("ringcentral-community-app")
source=(
	"git+https://github.com/ringcentral/${pkgname%-git}#branch=master"
	"${pkgname%-git}.desktop"
)
sha256sums=(
	"SKIP"
	"9ddf83488430c508ed95e2f20297f75be165b1a6284fc06f15b3d18f5345f8d2")

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"
	if [[ ${CARCH} == "aarch64" ]]; then
		yarn electron-builder build --arm64 --linux dir
	elif [[ ${CARCH} == "armv7h" ]]; then
		yarn electron-builder build --armv7l --linux dir
	elif [[ ${CARCH} == "i686" ]]; then
		yarn electron-builder build --ia32 --linux dir
	elif [[ ${CARCH} == "x86_64" ]]; then
		yarn electron-builder build --x64 --linux dir
	fi
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"

	if [[ ${CARCH} == "aarch64" ]]; then
		_unpacked_dirname="linux-arm64-unpacked"
	elif [[ ${CARCH} == "armv7h" ]]; then
		_unpacked_dirname="linux-armv7l-unpacked"
	elif [[ ${CARCH} == "i686" ]]; then
		_unpacked_dirname="linux-ia32-unpacked"
	elif [[ ${CARCH} == "x86_64" ]]; then
		_unpacked_dirname="linux-unpacked"
	fi

	cp -r --preserve=mode "${srcdir}/${pkgname%-git}/release/${_unpacked_dirname}" "${pkgdir}/opt/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

	for _file in "${srcdir}/${pkgname%-git}/icons/"*.png
	do
		_filename="$(basename ${_file})"
		install -Dm644 "${_file}" "${pkgdir}/usr/share/icons/hicolor/${_filename%.png}/apps/${pkgname%-git}.png"
	done

	ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
