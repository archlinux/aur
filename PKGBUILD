# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Adapted from https://github.com/wasta-linux/lameta-snap
pkgname=lameta
pkgver=2.2.2_alpha
pkgrel=1
pkgdesc="The Metadata Editor for Transparent Archiving of language document materials"
arch=('x86_64')
url="https://github.com/onset/lameta"
license=('MIT')
depends=(
	alsa-lib
	at-spi2-core
	cairo
	dbus
	expat
	gcc-libs
	glib2
	glibc
	gtk3
	libcups
	libdrm
	libx11
	libxcb
	libxcomposite
	libxdamage
	libxext
	libxfixes
	libxkbcommon
	libxrandr
	mesa
	nspr
	nss
	pango
	wayland
)
makedepends=('nvm')
source=("https://github.com/onset/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
	      'lameta.desktop')
sha256sums=('0a78434a685575ffea81f9dee8b6c7b4435f65bf061c0aa31cf048db290ec369'
            '375f8c3eeb54bd79468d728b6d3520e2f9ca6085cda7776e7eded18b006d55e3')

build() {
	cd "${pkgname}-${pkgver//_/-}"
	source "/usr/share/nvm/init-nvm.sh"
	nvm install 16
	echo "Silencing yarn message about needed dependencies"
	echo -e 'logFilters:\n  - code: "YN0013"\n    level: "discard"' >> .yarnrc.yml
	nvm exec 16 npm install --global yarn
	nvm exec 16 yarn
	nvm exec 16 npm run build
	nvm exec 16 "./node_modules/.bin/electron-builder" --linux dir
}

package() {
	mkdir "${pkgdir}/opt"
	cp -r "${pkgname}-${pkgver//_/-}/release/linux-unpacked" "${pkgdir}/opt/lameta"
	install -Dm644 lameta.desktop -t "${pkgdir}/usr/share/applications/"
	install -d "${pkgdir}/usr/bin/"
	ln -s /opt/lameta/lameta "${pkgdir}/usr/bin/lameta"
	echo "=> NOTE: this build dir is huge, so you might want to clean it up:"
    cd ../ && du -h -d0 "$(pwd)"
}
