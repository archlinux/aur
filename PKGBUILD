# Maintainer: Julian Hofmann <aur at julianh dot de>

## links
# https://crossonic.org
# https://github.com/juho05/crossonic

_pkgname="crossonic"
pkgname="$_pkgname"
pkgver=0.2.2
pkgrel=1
pkgdesc="An OpenSubsonic compatible cross-platform music client"
arch=('x86_64')
url="https://github.com/juho05/crossonic"
license=("AGPL-3.0-or-later")

depends=(
	'gtk3'
	'mpv'
	'libayatana-appindicator'
	'fontconfig'
	'cairo'
	'glib2'
	'glibc'
	'gcc-libs'
	'at-spi2-core'
	'pango'
	'libepoxy'
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
	'e0a7eeeea6dc6bf3b2d801fcd620bce97826f261906dfc3ff27b85ec8ec26db7'
)

prepare() {
	cd "$_pkgsrc"
	export FVM_CACHE_PATH="$SRCDEST/fvm-cache"

	: ${_fvm_version=$(grep 'FLUTTER_VERSION: ' .github/workflows/release.yml | cut -d'"' -f2)}

	fvm install "$_fvm_version"
	fvm use "$_fvm_version" --force
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
	fvm dart run build_runner build
}

build() {
	export CFLAGS CXXFLAGS
	CFLAGS+=" -Wno-deprecated-declarations"
	CXXFLAGS+=" -Wno-deprecated-declarations"
	export FVM_CACHE_PATH="$SRCDEST/fvm-cache"

	cd "$_pkgsrc"
	fvm flutter build linux --no-pub --release --dart-define=VERSION_CHECK=false
}

package() {
	cd "$_pkgsrc"

	pushd build/linux/x64/release
	install -Dm755 "bundle/Crossonic" "${pkgdir}/usr/lib/${_pkgname}/crossonic"
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib/${_pkgname}" .
	cmake -P cmake_install.cmake
  popd

	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/$_pkgname/lib"/*.so

	install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm644 "assets/icon/desktop/crossonic-512.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/org.crossonic.app.desktop" << END
[Desktop Entry]
Type=Application
Name=Crossonic
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
SingleMainWindow=true
StartupWMClass=org.crossonic.app
Terminal=false
Categories=Multimedia
END
}
