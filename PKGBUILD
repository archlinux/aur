# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: pressh <pressh funnysymbol gmail dot com>
# Contributor: vantu5z <vantu5z@mail.ru>

_pkgname='convertall'
pkgname=${_pkgname}
_pkgreponame='ConvertAll'
_tag='v1.0.0'
pkgver="${_tag/v/}"
pkgrel=1
pkgdesc='Convert between units.'
url='https://github.com/doug-101/ConvertAll'
arch=('x86_64')
license=(GPL2)
depends=(
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs')
makedepends=('flutter-engine' 'git' 'yq')
source=(
	"git+${url}.git#tag=${_tag}"
	"flutter::git+https://github.com/flutter/flutter.git"
	"flutter-engine::git+https://github.com/flutter/engine.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

_srcdir="${_pkgreponame}"
_engine_version=3.19.3

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

	# Executable install
	cd "${_srcdir}/build/linux/x64/release/bundle"
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
		"${srcdir}/${_srcdir}/assets/launcher/convertall_icon.svg" \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

	# .desktop file
	install -Dm644 <(cat <<- EOF
		[Desktop Entry]
		Type=Application
		Name=ConvertAll
		Icon=${_pkgname}
		Exec=/usr/bin/${_pkgname}
		Comment=${pkgdesc}
		Categories=Utilities
		
		EOF
	) "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
