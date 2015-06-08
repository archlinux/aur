# Contributor: Tamaasz

# Před odesláním je nutné upravit proměnnou pkgname v .SRCINFO v tarballu.

pkgbase=openttd-bin
pkgver=1.5.1
pkgrel=0
pkgdesc='OpenTTD is an open source simulation game based upon the popular Microprose game "Transport Tycoon Deluxe". This package lets you have installed more versions simultaneously (simply change pkgver).'
arch=('i686' 'x86_64')
url="http://www.openttd.org"
license=('GPL')
depends=(libpng sdl fontconfig icu)
makedepends=(coreutils)
conflicts=()
optdepends=('openttd-opengfx: free graphics' 'openttd-opensfx: free soundset' 'openttd-openmsx: free musicset')

if [ "${CARCH}" = 'x86_64' ] ; then
	_arch='amd64'
else
	_arch="i686"
fi

pkgname="openttd-bin-$pkgver"

if [[ "$pkgver" =~ ^r ]]; then
	src_slozka="openttd-trunk-${pkgver}-linux-generic-${_arch}"
	
	nazev="openttd-trunk-${pkgver}-linux-generic-${_arch}.tar.xz"
	adresa="http://binaries.openttd.org/nightlies/trunk/${pkgver}/${nazev}" #r25748/openttd-trunk-r25748-linux-generic-amd64.tar.xz
else
	src_slozka="openttd-${pkgver}-linux-generic-${_arch}"
	
	nazev="openttd-${pkgver}-linux-generic-${_arch}.tar.xz" #for old versions (< 1.1.0) change ".tar.xz" to ".tar.gz"
	adresa="http://binaries.openttd.org/releases/${pkgver}/${nazev}"
fi
source=("${adresa}")

md5sums=(SKIP)

package()
{
	cd "${srcdir}/${src_slozka}"
	name="openttd-${pkgver}"
	
	mkdir -p "${pkgdir}/usr/share/applications/"
	mv "./media/openttd.desktop" "${pkgdir}/usr/share/applications/${name}.desktop"
	sed -i "s#Name=OpenTTD#Name=OpenTTD - ${pkgver}#;s#Exec=openttd#Exec=${name}#;s#Categories=Game;#Categories=Game;Simulation;#" "${pkgdir}/usr/share/applications/${name}.desktop"
	
	mkdir -p "${pkgdir}/usr/share/doc/${name}/"
	mv "./docs/"* "${pkgdir}/usr/share/doc/${name}/"
	
	mkdir -p "${pkgdir}/usr/share/man/man6/"
	mv "./man/openttd.6.gz" "${pkgdir}/usr/share/man/man6/${name}.6.gz"
	
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
	mv "./media/openttd.32.xpm" "${pkgdir}/usr/share/pixmaps/${name}.32.xpm"
	
	for isize in 16 32 48 64 128 256; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${isize}x${isize}/apps/"
		mv "./media/openttd.${isize}.png" "${pkgdir}/usr/share/icons/hicolor/${isize}x${isize}/apps/${name}.png"
	done
	
	mkdir -p "${pkgdir}/usr/share/${name}"
	for d in ./*; do
		mv "$d" "${pkgdir}/usr/share/${name}/"
	done
	
	mkdir -p "${pkgdir}/usr/bin/"
	echo -e "#/bin/sh\ncd /usr/share/${name} && ./openttd \$@" > "${pkgdir}/usr/bin/${name}"
	
	chmod +xr "${pkgdir}/usr/bin/${name}"
	cd "${pkgdir}/usr/share/${name}"
	chmod +x `dir`
	chmod +r `find`
}
