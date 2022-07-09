# Maintainer: DashCruft dashcruft@gmail.com
pkgname=lazap
pkgver=0.3.0
pkgrel=1
pkgdesc="Lazap, All your games at one library with a modernish look and experience."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/Lazap-Development/lazap.git"
license=('CC')
makedepends=(git npm nodejs)
optdepends=()
provides=(lazap)
conflicts=(lazap)
source=("git+$url" "lazap.desktop")
sha256sums=('SKIP'
    'c5c66e36202836f10e22e419cf129f01fef570ab458a04aadb49e1ea325c3465')

build() {
	cd lazap
	
    npm install
    
	if [[ ${CARCH} == "armv7h" ]]; then
        npm run build:armv7h
    elif [[ ${CARCH} == "i686" ]]; then
        npm run build:i686
    elif [[ ${CARCH} == "x86_64" ]]; then
        npm run build:x86_64
    fi

	echo "Building Complete!"
}

package() {
    cd lazap

    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/lazap/img/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"

    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"
    cd ${srcdir}/lazap/dist/linux-unpacked
    mkdir "${pkgdir}/opt/${pkgname%-git}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"

    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/lazap/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/lazap/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    echo "Packaging Complete!"
}