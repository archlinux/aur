# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: pressh <pressh funnysymbol gmail dot com>
# Contributor: vantu5z <vantu5z@mail.ru>

_pkgname='convertall'
pkgname=${_pkgname}
_pkgreponame='ConvertAll'
_tag='v1.0.2'
pkgver="${_tag/v/}"
pkgrel=1
pkgdesc='Convert between units.'
url='https://github.com/doug-101/ConvertAll'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs')
makedepends=('fvm' 'git' 'patchelf' 'cmake' 'ninja' 'clang')
source=("git+${url}.git#tag=${_tag}")
sha256sums=('7851fa79178731fd1affad0167772409780f719b8f8dcdc3ce0e6a9136465941')

_srcdir="${_pkgreponame}"
#_engine_version=3.19.6
_engine_version=3.32.5

build() {
	export FVM_CACHE_PATH="$SRCDEST/fvm-cache"

	cd "${_srcdir}"
	fvm install "$_engine_version"
	fvm use -f "$_engine_version"

	fvm flutter clean
	fvm flutter --no-version-check pub get

	fvm flutter build linux --release
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
