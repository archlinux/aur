# Maintainer: SuperNinja_4965
# Contributor: FabioLolix
# Contributor: netroy

pkgname=arduino-ide-src
pkgver=2.3.2
pkgrel=2
pkgdesc="Arduino prototyping platform IDE, rewrite based on the Theia IDE framework. Source Package"
arch=(x86_64)
url="https://github.com/arduino/arduino-ide"
license=(AGPL3)
depends=(libxkbfile libxss nss libsecret git)
makedepends=(electron27 nodejs-lts-hydrogen yarn python go npm)
optdepends=('libusb: Needed for some libraries or boards'
            'usbutils: Needed for stm32 boards using st-link'
            'libusb-compat: Needed for the `micronucleus` cli utility'
            'python-pyserial: Needed for esptool')
provides=(arduino-ide)
conflicts=(arduino-ide arduino-ide-bin)
replaces=(arduino-ide-beta-bin)
options=(!strip)
source=("https://github.com/arduino/arduino-ide/archive/refs/tags/${pkgver}.zip"
        "https://www.arduino.cc/wiki/370832ed4114dd35d498f2f449b4781e/arduino.svg"
        "${pkgname}.sh")
sha256sums=('b6efddd014beb19cade2fe160d9e06a756063474cedf52aea3e0df36cbec38ee'
            '4137981bcb4057c2e0092f22faea287767f102e0b48497d22cd55e8d6988e4ac'
            'c02f0c40b92e50f46b09339d1ccfb0cb7cd7caa1e5d386ee9b85938810bfda34')

prepare() {
	echo -e "[Desktop Entry]\nType=Application\nName=Arduino IDE v2\nGenericName=Arduino IDE v2\nComment=Open-source electronics prototyping platform\nExec=arduino-ide %U\nIcon=arduino-ide-v2\nTerminal=false\nMimeType=text/x-arduino;\nCategories=Development;IDE;Electronics;\nKeywords=embedded electronics;avr;microcontroller;\nStartupWMClass=Arduino IDE" > arduino-ide-v2.desktop
	export IS_RELEASE=true
	export IS_NIGHTLY=false
	cd ${srcdir}/arduino-ide-${pkgver}
	npx node-gyp install
	yarn install --immutable
	yarn --cwd arduino-ide-extension build
	yarn test
	yarn --cwd arduino-ide-extension test:slow
	yarn --cwd arduino-ide-extension lint
	yarn --cwd electron-app rebuild
	yarn --cwd electron-app build
	yarn --cwd electron-app package
}

package() {
	install -dm755 "$pkgdir/opt/"
	mv "${srcdir}/arduino-ide-${pkgver}/electron-app/dist/linux-unpacked" "arduino-ide"
	chmod -R 755 "arduino-ide"
	cp -r "arduino-ide" "$pkgdir/opt/arduino-ide"
	install -dm755 "$pkgdir/usr/bin"
	install -Dm644 "arduino-ide-v2.desktop" "$pkgdir/usr/share/applications/arduino-ide-v2.desktop"
	install -Dm644 "arduino.svg" "$pkgdir/usr/share/pixmaps/arduino-ide-v2.svg"
	install -m755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/arduino-ide"
}
