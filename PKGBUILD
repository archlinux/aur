# Maintainer: Philip 'Chais' Abernethy <chais.z3r0@gmail.com>
pkgname=hammerwatch
pkgver=1.3
pkgrel=1
epoch=1411423200
pkgdesc="A hack and slash action adventure, set in a fantasy pixel art environment"
arch=('i686' 'x86_64')
url="http://www.hammerwatch.com/"
license=('custom:commercial')
depends=('proot')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://${pkgname}_linux_v${pkgver}.zip"
        "${pkgname}.png")
sha512sums=('a6f1c1432a24e933326d74910a05468b7f5261d445602604ad0015b53edd38cdd132fd8d44947da8e33196e27e82fdc3d8733c50ad85dcca9b264b088ce6bd94'
            'da116253e3a828ee365da992be96a88acbe64f6cf32fdf77cb935fe74ed14f49e0bc33fe2fe8edf7dead7bc72d6a97b9a46e7220e92cf474e295298b017b1540')

package() {
	install -dm755 "${pkgdir}"/usr/{bin,share/applications}
	install -Dm644 "${srcdir}/${source[1]}" "${pkgdir}/usr/share/pixmaps/${source[1]}"
	echo "[Desktop Entry]
Type=Application
Version=${pkgver}
Name=${pkgname^}
GenericName=${pkgname^}
Comment=${pkgdesc}
Categories=Game;
Icon=${pkgname}
Exec=/usr/bin/${pkgname}
Path=/opt/${pkgname}" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	pushd "${srcdir}/${pkgname^}"
	echo "#!/bin/sh
# Check for storage location
if [[ -n \${XDG_DATA_HOME} ]]; then
	SAVEDIR=\"\${XDG_DATA_HOME}/${pkgname^}\"
else
	SAVEDIR=\"\${HOME}/.local/share/${pkgname^}\"
fi
if [[ ! -d \${SAVEDIR} ]]; then
	mkdir -p \${SAVEDIR}/saves
fi
# Make some preparations
ln -s \${SAVEDIR} /tmp/${pkgname}
cp -r /opt/${pkgname}/levels /tmp/hwlevels
# Start the game
proot -b /tmp/hwlevels:/opt/${pkgname}/levels /usr/bin/bash -c /opt/${pkgname}/hwrun" > "${pkgdir}/usr/bin/${pkgname}"
	if [[ "$CARCH" == 'i686' ]]; then
		install -Dm755 "${srcdir}/${pkgname^}/${pkgname^}.bin.x86" "${pkgdir}/opt/${pkgname}/${pkgname^}.bin.x86"
		echo "#!/bin/sh
cd \$(dirname \$0)
./${pkgname^}.bin.x86" > "${pkgdir}/opt/${pkgname}/hwrun"
		install -dm755 "${pkgdir}/opt/${pkgname}/lib"
		find lib -type f -exec install "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	else
		install -Dm755 "${srcdir}/${pkgname^}/${pkgname^}.bin.x86_64" "${pkgdir}/opt/${pkgname}/${pkgname^}.bin.x86_64"
		echo "#!/bin/sh
cd \$(dirname \$0)
./${pkgname^}.bin.x86_64" > "${pkgdir}/opt/${pkgname}/hwrun"
		install -dm755 "${pkgdir}/opt/${pkgname}/lib64"
		find lib64 -type f -exec install "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	fi
	chmod 755 "${pkgdir}/opt/${pkgname}/hwrun"
	echo "# Clean up
rm /tmp/${pkgname}
rm -r /tmp/hwlevels" >> "${pkgdir}/usr/bin/${pkgname}"
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
	ln -s /tmp/${pkgname}/game.log "${pkgdir}/opt/${pkgname}/game.log"
	ln -s /tmp/${pkgname}/error.txt "${pkgdir}/opt/${pkgname}/error.txt"
	ln -s /tmp/${pkgname}/config.xml "${pkgdir}/opt/${pkgname}/config.xml"
	ln -s /tmp/${pkgname}/saves "${pkgdir}/opt/${pkgname}/saves"
	install -m644 "Hammerwatch.exe" -t "${pkgdir}/opt/${pkgname}/"
	install -m644 "assets.bin" -t "${pkgdir}/opt/${pkgname}/"
	find editor -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	find levels -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	find mono -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	find mono -type f -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	find levels -type f -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	find editor -type f -name "*dll*" -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	find editor -type f -name "*exe" -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	find -type f -name "*dll*" -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
}
