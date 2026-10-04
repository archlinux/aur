# Maintainer: Julian Hofmann <aur at julianh dot de>

## links
# https://crossonic.org
# https://github.com/juho05/crossonic

_pkgname="crossonic"
pkgname="$_pkgname"
pkgver=0.5.2
pkgrel=1
pkgdesc="An OpenSubsonic compatible cross-platform music client"
arch=('x86_64')
url="https://github.com/juho05/crossonic"
license=("MPL-2.0")

depends=(
	'gtk3'
	'mpv'
	'fontconfig'
	'cairo'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'libgcc'
	'libstdc++'
	'libx11'
	'libxi'
	'at-spi2-core'
	'pango'
	'libepoxy'
	'hicolor-icon-theme'
)
makedepends=(
	'clang'
	'cmake'
	'fvm'
	'git'
	'ninja'
	'patchelf'
)

options=('!lto')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
	"$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=(
	'bbfb590ccef71a76906a66b1851890429ee5d83b42d98f78968034863bc98313'
)

_setup_env() {
	# keep flutter, dart and pub from writing into the real home directory
	export HOME="$srcdir/home"
	export XDG_CONFIG_HOME="$HOME/.config"
	export FVM_CACHE_PATH="$SRCDEST/fvm-cache"
	export PUB_CACHE="$SRCDEST/pub-cache"
	mkdir -p "$HOME"
}

prepare() {
	cd "$_pkgsrc"
	_setup_env

	: ${_fvm_version=$(grep 'FLUTTER_VERSION: ' .github/workflows/release.yml | cut -d'"' -f2)}

	fvm install "$_fvm_version"
	fvm use "$_fvm_version" --force
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get --enforce-lockfile
	fvm dart run build_runner build
}

build() {
	export CFLAGS CXXFLAGS
	CFLAGS+=" -Wno-deprecated-declarations"
	CXXFLAGS+=" -Wno-deprecated-declarations"
	_setup_env

	cd "$_pkgsrc"
	fvm flutter build linux --no-pub --release --dart-define=VERSION_CHECK=false
}

package() {
	cd "$_pkgsrc"

	install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/bin"
	cp -a build/linux/x64/release/bundle/. "$pkgdir/usr/lib/$_pkgname/"

	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/$_pkgname/lib"/*.so

	ln -s "/usr/lib/$_pkgname/Crossonic" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	local _appid="org.crossonic.app"
	local _size
	for _size in 32 64 128 256 512; do
		install -Dm644 "assets/icon/desktop/crossonic-$_size.png" \
			"$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_appid.png"
	done
	install -Dm644 "assets/icon/desktop/crossonic.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"

	install -Dm644 "scripts/appimage/$_appid.desktop" -t "$pkgdir/usr/share/applications/"
	sed -i "s/^Exec=.*/Exec=$_pkgname/" "$pkgdir/usr/share/applications/$_appid.desktop"

	install -Dm644 "scripts/appimage/$_appid.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
	sed -i "s|<binary>.*</binary>|<binary>$_pkgname</binary>|" "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"
}
