# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='hacki'
pkgname=${_pkgname}
_pkgreponame='Hacki'
pkgver=2.5.0
pkgrel=1
pkgdesc='A Hacker News reader.'
url='https://github.com/Livinglist/Hacki'
arch=('x86_64')
license=('GPL3')
depends=(
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs'
	'libsecret')
makedepends=('flutter-engine' 'git' 'yq')
source=(
	"git+${url}.git#tag=v${pkgver}"
	"flutter::git+https://github.com/flutter/flutter.git"
	"flutter-engine::git+https://github.com/flutter/engine.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

_srcdir="${_pkgreponame}"
_engine_version=3.16.2

prepare() {
	cd "${_srcdir}"
	source '/opt/flutter-engine/pkgbuild-prepare.sh'

	local dartpkg="$(yq -er .name 'pubspec.yaml')"
	flutter create --project-name="${dartpkg}" --platforms=linux --no-pub --no-overwrite .

	flutter clean
	flutter pub get
}

build() {
	cd "${_srcdir}"
	source '/opt/flutter-engine/pkgbuild-build.sh'

	flutter build linux --release
}

package() {
	# Make opt dir
	install -dm755 "${pkgdir}/opt/${_pkgname}/"

	# License
	cd "${_srcdir}"
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"

	# Executable install
	cd "build/linux/x64/release/bundle"
	local execfile="$(find . -mindepth 1 -maxdepth 1 -type f -perm /111)"
	install -Dm755 \
		"${execfile}" \
		"${pkgdir}/opt/${_pkgname}/${_pkgname}"

	# Folders install
	cp -r 'lib/' "${pkgdir}/opt/${_pkgname}/"
	cp -r 'data/' "${pkgdir}/opt/${_pkgname}/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_pkgname}" \
		"${pkgdir}/usr/bin/${_pkgname}"

	# Icon for .desktop
	install -Dm644 \
		"${srcdir}/${_srcdir}/build/flutter_assets/assets/images/hacki_icon.png" \
		"${pkgdir}/usr/share/icons/${_pkgname}.png"

	# .desktop file
	install -Dm644 <(cat << EOF
[Desktop Entry]
Type=Application
Name=Hacki
Exec=/usr/bin/${_pkgname}
Comment=${pkgdesc}
Categories=Internet
Icon=${_pkgname}
EOF
	) "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
