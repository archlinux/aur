# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=localsend
pkgver=1.11.1
pkgrel=4
pkgdesc='An open source cross-platform alternative to AirDrop.'
url='https://github.com/localsend/localsend'
arch=('x86_64')
license=('MIT')
depends=('xdg-user-dirs' 'libayatana-appindicator')
makedepends=('flutter-engine' 'git')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"flutter::git+https://github.com/flutter/flutter.git"
	"flutter-engine::git+https://github.com/flutter/engine.git")
sha256sums=('e47fa53dcc1ff49c24fd06320ff240730f270fda1d0e944a7f5d69d103ae4ad4'
            'SKIP'
            'SKIP')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	source '/opt/flutter-engine/pkgbuild-prepare.sh'
	cd "${_srcdir}"
	
	flutter clean $flutter_select_engine
	flutter pub $flutter_select_engine get
}

build() {
	source '/opt/flutter-engine/pkgbuild-build.sh'
	cd "${_srcdir}"
	
	flutter pub $flutter_select_engine run build_runner build --release --delete-conflicting-outputs
	flutter build linux --release $flutter_select_engine
}

package() {
	# Make opt dir
	install -dm755 "${pkgdir}/opt/${pkgname}/"

	# Executable install
	cd "${_srcdir}/build/linux/x64/release/bundle"
	install -Dm755 \
		"localsend_app" \
		"${pkgdir}/opt/${pkgname}/${pkgname}"

	# Folders install
	cp -r 'lib/' "${pkgdir}/opt/${pkgname}/"
	cp -r 'data/' "${pkgdir}/opt/${pkgname}/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${pkgname}/${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
	
	# Icon for .desktop 
	install -Dm644 \
		"${srcdir}/${_srcdir}/build/flutter_assets/assets/img/logo-512.png" \
		"${pkgdir}/usr/share/icons/localsend.png"

	# .desktop file
	install -Dm644 <(cat << EOF
[Desktop Entry]
Type=Application
Icon=localsend
Name=LocalSend
Exec=/usr/bin/localsend
Comment=An open source cross-platform alternative to AirDrop
Categories=Utility;Network;
EOF
	) "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
