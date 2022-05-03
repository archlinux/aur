# Maintainer: Ariejan de Vroom <ariejan[at]devroom[dot]io>
pkgname=txdx
pkgver=1.1.2
pkgrel=1
pkgdesc="Todo's like you've never seen before"
arch=('x86_64')
url='https://www.txdx.eu'
license=('GPL2')
depends=('gtk3' 'zenity')
makedepends=('clang' 'ninja' 'cmake' 'git' 'unzip' 'flutter')

source=("https://gitlab.devroom.io/ariejan/txdx/-/archive/1.1.2/txdx-1.1.2.tar.gz")
sha256sums=('bbd42b7f034c84715a2d4fe42dc9f4de08d03f1021c8f3c0e84690f674824397')

prepare() {
	_flutter_dir="${srcdir}/flutter"
	PATH="${_flutter_dir}/bin:${PATH}"
	export PATH

	msg2 "Copying '/opt/flutter' to '${_flutter_dir}' ..."
	cp -af /opt/flutter "${_flutter_dir}"

	flutter config --no-analytics
	flutter config --enable-linux-desktop

	cd ${pkgname}-${pkgver}

	flutter clean
	flutter pub get
}

build() {
	_flutter_dir="${srcdir}/flutter"
	PATH="${_flutter_dir}/bin:${PATH}"
	export PATH

	cd ${pkgname}-${pkgver}
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
