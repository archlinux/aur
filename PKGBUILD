# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname="symphony-nomusic"
pkgver=2014.07.15
pkgrel=1
epoch=1405375200
pkgdesc="A musical top down shooter (without included music)"
arch=('x86_64' 'i686')
url="http://www.symphonygame.com/"
license=('custom:commercial')
makedepends=('unzip')
depends=('sdl2' 'libfmod')
provides=('symphony')
conflicts=('symphony')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://Symphony-Linux-${pkgver//./-}.sh")
sha512sums=("c8e193db4fa7d1976f5bf40753320e733ab2b17473b9d3d980edd0533fe88fecaf1d36d35f4ff58aa223409fc86fc2f3f86a1f4137a91d32a3648d86e739b09b")

package() {
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm 755 "${srcdir}/data/x86_64/Symphony.bin.x86_64" "${pkgdir}/opt/${provides[0]}/${provides[0]}"
		mkdir "${pkgdir}/opt/${provides[0]}/lib64"
		ln -s /usr/lib/libfmodex.so "${pkgdir}/opt/${provides[0]}/lib64/libfmodex-4.44.20.so"
	else
		install -Dm 755 "${srcdir}/data/x86/Symphony.bin.x86" "${pkgdir}/opt/${provides[0]}/${provides[0]}"
		mkdir "${pkgdir}/opt/${provides[0]}/lib"
		ln -s /usr/lib/libfmodex.so "${pkgdir}/opt/${provides[0]}/lib/libfmodex-4.44.20.so"
	fi
	mv "${srcdir}"/data/noarch/* ${pkgdir}/opt/${provides[0]}/
	rm "${pkgdir}/opt/${provides[0]}/README.linux"
	rm -r "${pkgdir}/opt/${provides[0]}/Symphony soundtrack"
	mkdir -p "${pkgdir}"/usr/{bin,share/applications}
	ln -s "/opt/${provides[0]}/${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
	echo "[Desktop Entry]
Type=Application
Name=Symphony
GenericName=Symphony
Comment=$pkgdesc
Icon=/opt/${provides[0]}/Symphony.png
Exec=/usr/bin/${provides[0]}
Categories=Game;
Path=/opt/${provides[0]}" > "$pkgdir/usr/share/applications/${provides[0]}.desktop"
}
