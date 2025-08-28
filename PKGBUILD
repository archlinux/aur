# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=sikulixide-bin
pkgver=2.0.5
pkgrel=1
pkgdesc='Automates anything you see on the screen of your desktop computer'
arch=('any')
url='http://sikulix.com'
license=('MIT')
depends=(
	'java-environment>=8'
	'opencv'
	'tesseract'
	'jython'
	'jruby')
makedepends=('unzip' 'gendesk')
provides=('sikulixide' 'sikulix')
source=(
	"${pkgname}-${pkgver}.jar::https://launchpad.net/sikuli/sikulix/${pkgver}/+download/sikulixide-${pkgver}.jar"
	"sikulixide-bin_LICENSE::https://github.com/RaiMan/SikuliX1/raw/master/LICENSE")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=(
	'f4b0b50c8e413094e78cd1d8fed02ae65f62f8c53ed00da0562fdedf4acff729'
	'cea4b6292d59625e14968ec666faa7ae6e237b510d846a96875bd6a282677f3a')

package() {
	if [[ -d icons ]]; then
		rm -rf icons
	fi
	unzip ${pkgname}-${pkgver}.jar icons/sikulix.png
	install -Dm644 "${pkgname}-${pkgver}.jar" \
		"${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}-${pkgver}.jar"
	echo "#!/bin/sh
	exec /usr/bin/java -jar '/usr/share/java/${pkgname%-bin}/${pkgname%-bin}-${pkgver}.jar' "\$@"" > "${pkgname%-bin}"
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 sikulixide-bin_LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 icons/sikulix.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
	gendesk -f -n \
		--pkgname "${pkgname%-bin}" \
		--pkgdesc "$pkgdesc" \
		--name "SikuliX IDE" \
		--comment "$pkgdesc" \
		--exec "${pkgname%-bin}" \
		--categories 'Utility' \
		--icon "${pkgname%-bin}"
	install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
