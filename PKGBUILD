# Maintainer: sansation <sansation.git@gmail.com>
pkgname=astrosound-redux
pkgver=0.0.5
pkgrel=4
pkgdesc="A modern music player made with Electron"
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/astrosound-redux'
license=('GPL')
makedepends=('tar' 'npm' 'gendesk')
source=("https://github.com/XNBlank/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('7f685a663d5ac0d9a6c57fdcc1f47eacb3e1007ec713af9d0978cb2b839585b5')

prepare() {
	gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}

	case $CARCH in
		'i686') _arch='ia32';;
		'x86_64') _arch='x64';;
	esac

	# Build package with electron
	npm install
	npm install electron-packager --save-dev
	./node_modules/.bin/electron-packager . astrosound-redux --appname=astrosound-redux \
	--version=1.2.6 --platform=linux --arch="${_arch}"

	# Install files
	install -d "${pkgdir}/opt/astrosound-redux"
	cp -a "${pkgname}-linux-${_arch}/." "${pkgdir}/opt/${pkgname}/"

	# Install desktop entry
	install -d "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

	# Symlink main binary
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Symlink icon
	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s "/opt/${pkgname}/resources/app/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# Install license file
	install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
	rm "${pkgdir}/opt/${pkgname}/LICENSE"
	rm "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html"
}
