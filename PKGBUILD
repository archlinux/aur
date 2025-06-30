# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_install_path:=opt}

_pkgname='hacki'
pkgname=${_pkgname}
_pkgreponame='Hacki'
pkgver=2.11.0
pkgrel=1
pkgdesc='A Hacker News reader.'
url='https://github.com/Livinglist/Hacki'
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
	'gtk3'
	'gstreamer'
	'gst-plugins-base-libs'
	'libsecret')
makedepends=('fvm' 'git' 'patchelf' 'cmake' 'ninja' 'clang')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('55b946af1296a6866811f751952add305fe40b87a280cb076bec713cfb10af19')

_srcdir="${_pkgreponame}"
_engine_version=3.32.5

prepare() {
	cd "${_srcdir}"
	#sed -i \
	#	-e 's/flutter_slidable: ^3.0.0/flutter_slidable: ^3.1.2/' \
	#	-e 's/flutter_secure_storage: ^9.2.2/flutter_secure_storage: ^9.2.4/' \
	#	'pubspec.yaml'
}

build() {
	export FVM_CACHE_PATH="$SRCDEST/fvm-cache"
	export CXXFLAGS+=' -Wno-error=deprecated-literal-operator'

	cd "${_srcdir}"
	fvm install "$_engine_version"
	fvm use -f "$_engine_version"

	fvm flutter create --project-name='hacki' --platforms='linux' --no-pub --no-overwrite .

	fvm flutter --disable-analytics

	fvm flutter --no-version-check pub get
	fvm flutter build linux --release
}

package() {
	# Make install dir
	install -dm755 "${pkgdir}/${_install_path}/${_pkgname}/"

	# License
	cd "${_srcdir}"
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"

	# Executable install
	cd 'build/linux/x64/release/bundle'
	local execfile="$(find . -mindepth 1 -maxdepth 1 -type f -perm /111)"
	install -Dm755 \
		"${execfile}" \
		"${pkgdir}/${_install_path}/${_pkgname}/${_pkgname}"

	# Folders install
	cp -r 'lib/' "${pkgdir}/${_install_path}/${_pkgname}/"
	cp -r 'data/' "${pkgdir}/${_install_path}/${_pkgname}/"

	# Fix runpath
	patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/${_install_path}/$_pkgname/${execfile}"
	for i in "$pkgdir/${_install_path}/$_pkgname/lib"/*.so; do
		[ -z "$(patchelf --print-rpath "$i")" ] && continue
		patchelf --set-rpath '$ORIGIN' "$i"
	done

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/${_install_path}/${_pkgname}/${_pkgname}" \
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
