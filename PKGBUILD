# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=localsend
pkgver=1.11.1
pkgrel=5
pkgdesc='An open source cross-platform alternative to AirDrop.'
url='https://localsend.org/'
arch=('x86_64')
license=('MIT')
depends=('xdg-user-dirs' 'libayatana-appindicator')
makedepends=('flutter-engine' 'git' 'yq')
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
	
	local dartpkg="$(yq -er .name 'pubspec.yaml')"
	flutter create $flutter_select_engine --project-name="${dartpkg}" --platforms=linux --no-pub --no-overwrite .
	
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
	local execfile="$(find . -mindepth 1 -maxdepth 1 -type f -perm /111)"
	install -Dm755 \
		"${execfile}" \
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
		"${pkgdir}/usr/share/icons/${pkgname}.png"

	# .desktop file
	install -Dm644 <(cat << EOF
[Desktop Entry]
Type=Application
Icon=${pkgname}
Name=LocalSend
Exec=/usr/bin/${pkgname}
Comment=${pkgdesc}
Categories=Utility;Network;
EOF
	) "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
