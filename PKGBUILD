# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: pressh <pressh funnysymbol gmail dot com>
# Contributor: vantu5z <vantu5z@mail.ru>

_pkgname='convertall'
pkgname=${_pkgname}
_pkgreponame='ConvertAll'
_tag='v1.0.1'
pkgver="${_tag/v/}"
pkgrel=3
pkgdesc='Convert between units.'
url='https://github.com/doug-101/ConvertAll'
arch=('x86_64')
license=(GPL2)
depends=(
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs')
makedepends=('flutter-engine' 'git' 'yq' 'patchelf')
source=(
	"git+${url}.git#tag=${_tag}"
	'flutter::git+https://github.com/flutter/flutter.git'
	'flutter-engine::git+https://github.com/flutter/engine.git'
	'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git')
sha256sums=('22cd74809e42e20b4fd9c3cacced9024a80ad1235553e9b18b81b5f44ef1f6c3'
            'SKIP'
            'SKIP'
            'SKIP')

_srcdir="${_pkgreponame}"
_engine_version=3.19.6

prepare() {
	cd "${_srcdir}"
	source '/opt/flutter-engine/pkgbuild-prepare.sh'
}

build() {
	cd "${_srcdir}"
	source '/opt/flutter-engine/pkgbuild-build.sh'

	local dartpkg="$(yq -er .name 'pubspec.yaml')"
	flutter create --project-name="${dartpkg}" --platforms=linux --no-pub --no-overwrite .

	flutter clean
	flutter pub get

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

	# Fix runpath
	patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/opt/$_pkgname/${execfile}"
	for i in "$pkgdir/opt/$_pkgname/lib"/*.so; do
		[ -z "$(patchelf --print-rpath "$i")" ] && continue
		patchelf --set-rpath '$ORIGIN' "$i"
	done

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
