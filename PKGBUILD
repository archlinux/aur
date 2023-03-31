# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=localsend
pkgver=1.8.0
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop.'
url='https://github.com/localsend/localsend'
arch=('x86_64')
license=('MIT')
depends=('zenity' 'xdg-user-dirs')
makedepends=('flutter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('23d604fddf7b6bbe458ee7a004bde94e81e97e0a59ecf79c919dab8812d77ccf')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	cd "${_srcdir}"
	
	sed -i -E \
		"s|collection: 1.16.0|collection: 1.17.0|" \
		"pubspec.yaml"
	
	flutter config --enable-linux-desktop
	flutter pub get
}

build() {
	cd "${_srcdir}"
	
	flutter pub run build_runner build
	flutter build linux --release
}

package() {
	# Make opt dir
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cd "${_srcdir}/build/linux/x64/release/bundle"

	# Executable install
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
Name=localsend
Exec=/usr/bin/localsend
Comment=An open source cross-platform alternative to AirDrop
EOF
	) "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
