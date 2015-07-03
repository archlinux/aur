# Maintainer: Philip 'Chais' Abernethy <chais.z3r0@gmail.com>
pkgname=luftrausers
pkgver=1.0
pkgrel=1
epoch=1395159852
pkgdesc="Air combat game with many different planes and missions"
arch=('i686' 'x86_64')
url="http://www.luftrausers.com/"
license=('custom:commercial')
depends=('flac' 'freetype2' 'jsoncpp' 'libogg' 'sdl2' 'sfml' 'libsndfile' 'libvorbis' 'zlib')
if [[ "$CARCH" == 'x86_64' ]]; then
	depends+=('openal')
fi

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://LUFTRAUSER_LINUX_${epoch}.zip"
        'luftrausers.png')
sha512sums=('4961cc3f0e26c8f6792b1cbb39e1857acb538e20c2784867629b6dce3e9d7a70a547c6ed35813f09a7db25d86f74709185279f063cbae88f37117f9a0998f9bf'
            'fe169a7195d338c8fad524ea14b4e84b33f5b549e6bd40f6e8f1bb8cb4ac85854a6ce707ab82305337ee26ee1b89868f2e39fff6f7de75cd181306332cc845fe')

package() {
	install -Dm755 "${srcdir}/${pkgname}-nodrm/${CARCH/_/-}/${pkgname}" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"
	pushd "${srcdir}/${pkgname}-nodrm/"
	find data -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	find data -type f -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	popd
	install -dm755 "${pkgdir}"/usr/{bin,share/applications}
	echo "#!/usr/bin/sh
cd /opt/${pkgname}/bin
./${pkgname}" > "${pkgdir}/usr/bin/${pkgname}"
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${source[1]}" "${pkgdir}/usr/share/pixmaps/${source[1]}"
	echo "[Desktop Entry]
Type=Application
Name=${pkgname^}
GenericName=${pkgname^}
Comment=${pkgdesc}
Icon=${pkgname}
Exec=/usr/bin/${pkgname}
Categories=Game;
Path=/opt/${pkgname}" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
