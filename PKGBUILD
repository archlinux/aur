# Maintainer: solsTiCe d'Hiver <solsticedhiver@gmail.com>
pkgname=opennow
_pkgname=OpenNOW
pkgver=0.3.9
pkgrel=1
pkgdesc="custom GeForce Now client"
url="https://opennow.zortos.me/"
license=('MIT')
depends=('gtk3' 'cairo' 'pango' 'mesa' 'dbus' 'libx11' 'at-spi2-core' 'hicolor-icon-theme' 'nss' 'nspr' 'alsa-lib')
# TODO: use system electron once the version 41 is available
makedepends=('npm' 'imagemagick' 'libxcrypt-compat')
provides=('opennow')
conflicts=('opennow-appimage')
arch=('x86_64')
source=(opennow-${pkgver}.tar.gz::https://github.com/OpenCloudGaming/OpenNOW/archive/refs/tags/v${pkgver}.tar.gz
	opennow.desktop)
sha256sums=('c5b9dbd3e500e5b7c0cb874f6acf2bae4367c36630661222305732cf3c0aca12'
            'f088c04aff865e71937579c3b56e09e454e31acb7fb5301af217d695947029fd')

prepare() {
	cd "$_pkgname-$pkgver"
	cd opennow-stable
	npm install --cache "${srcdir}/npm/cache"
}

build() {
	cd "$_pkgname-$pkgver"
	npm run dist
	mkdir hicolor || :
	# create a set of icons from huge logo.png
	for i in 8x8 16x16 20x20 22x22 24x24 32x32 36x36 40x40 42x42 48x48 64x64 72x72 80x80 96x96 128x128 192x192 256x256 384x384 512x512 1024x1024; do
		_dir="hicolor/${i}/apps"
		mkdir -p "${_dir}"
	 	magick logo.png -resize "${i}" "${_dir}/opennow.png"
	done
}

package() {
	cd "$_pkgname-$pkgver"
	# TODO: install in /usr/lib/opennow when electron latest is available
	mkdir -p "${pkgdir}/opt/opennow"
	cp -a opennow-stable/dist-release/linux-unpacked/* ${pkgdir}/opt/opennow
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -m 644 -D -t "${pkgdir}/usr/share/applications/" "${srcdir}/opennow.desktop"
	mkdir -p "${pkgdir}/usr/share/icons"
	cp -a hicolor "${pkgdir}/usr/share/icons"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s ../../opt/opennow/opennow-stable ${pkgdir}/usr/bin/opennow
}
