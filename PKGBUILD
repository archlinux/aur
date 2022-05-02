# Maintainer: Ariejan de Vroom <ariejan[at]devroom[dot]io>
pkgname=txdx
pkgver=1.1.1
pkgrel=21
pkgdesc="Todo's like you've never seen before"
arch=('x86_64' 'aarch64')
url='https://www.txdx.eu'
license=('GPL2')
depends=('gtk3' 'zenity')
makedepends=('clang' 'ninja' 'cmake' 'git' 'unzip' 'flutter-beta' 'flutter-group-pacman-hook')

source=("txdx-${pkgver}.tar.gz::https://gitlab.devroom.io/ariejan/txdx/-/archive/${pkgver}/txdx-${pkgver}.tar.gz")
sha256sums=('5da8bcdae8a61e7d38a0e2068021d884737b7150323ea07d9d5407d0847144a6')

prepare() {
	cd ${pkgname}-${pkgver}
	flutter config --no-analytics
	flutter config --enable-linux-desktop
	flutter clean
}

build() {
	cd ${pkgname}-${pkgver}
	flutter pub get
	flutter build linux --release --verbose
}

package() {
	install -dm755 ${pkgdir}/opt
	mv ${pkgname}-${pkgver}/build/linux/x64/release/bundle ${pkgdir}/opt/${pkgname}
	
	install -dm755 ${pkgdir}/usr/bin
	ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

	install -Dm 644 ${pkgdir}/opt/${pkgname}/data/flutter_assets/assets/${pkgname}.png ${pkgdir}/usr/share/pixmaps/txdx.png

	install -dm 755 "${pkgdir}/usr/share/applications"
	cat > ${pkgdir}/usr/share/applications/txdx.desktop << EOF
[Desktop Entry]
Name=TxDx
Comment=Todo.txt for your desktop
Exec=${pkgname}
Version=${pkgver}
Type=Application
Icon=${pkgname}
Terminal=false
StartupNotify=false
Categories=Productivity;Utilities;
EOF
}
