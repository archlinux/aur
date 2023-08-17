# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=localsend
pkgver=1.10.0
pkgrel=1
_flutter_ver=3.7.12
pkgdesc='An open source cross-platform alternative to AirDrop.'
url='https://github.com/localsend/localsend'
arch=('x86_64')
license=('MIT')
depends=('zenity' 'xdg-user-dirs' 'libayatana-appindicator')
makedepends=('clang')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"flutter::git+https://github.com/flutter/flutter.git#tag=${_flutter_ver}")
sha256sums=('1efbae9b568c3c2486cbbfc13e59d109653ba93d5089d64e197218acf11e0631'
            'SKIP')

_srcdir="${pkgname}-${pkgver}"

_setpath() {
	export PATH="$srcdir/flutter/bin:$PATH"
}

prepare() {
	cd "${_srcdir}"
	
	_setpath
	
	flutter config --enable-linux-desktop
	flutter clean
	flutter pub get
}

build() {
	cd "${_srcdir}"
	
	_setpath
	
	flutter pub run build_runner build
	flutter build linux --release
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
