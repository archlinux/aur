# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: claymorwan <claymorwan@fembois.dev>

_pkgname="shijima-qt"

pkgname='shijima-qt-bin'
pkgver='0.2.0alpha1'
_pkgver='0.2.0-alpha1'
pkgrel='3'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=(x86_64 aarch64)
url='https://github.com/pixelomer/Shijima-Qt'
license=('GPL-3.0-only')
depends=(
	'libunarr'
	'qt6-base'
	'qt6-multimedia'
)
makedepends=('imagemagick')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip" "!debug")
source=(
	"$_pkgname.ico::https://raw.githubusercontent.com/pixelomer/Shijima-Qt/refs/heads/main/$_pkgname.ico"
	"LICENSE::$url/blob/main/LICENSE"
)
source_x86_64=("$_pkgname.zip::$url/releases/download/v$_pkgver/release-linux-x86_64.zip")
source_aarch64=("$_pkgname.zip::$url/releases/download/v$_pkgver/release-linux-arm64.zip")

sha256sums=('a142a1a0802c5209a9fc306781c48a8e96b9c2dab5b6f50a9c7080d634c3c188'
            'dafa14cd15da311293e3fab60528703ded28ea2eff30dc304c7a716ee5793e81')
sha256sums_x86_64=('7a372f7dbd81103338f0faaba80f3b91e80b154db19c2fc4a11f0361852fe784')
sha256sums_aarch64=('7a372f7dbd81103338f0faaba80f3b91e80b154db19c2fc4a11f0361852fe784')

build() {
	cd "$srcdir"

	# Convert image
	magick "$_pkgname.ico" "$_pkgname.png"
}

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin/"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Icon
	install -D "$_pkgname.png" "$pkgdir/usr/share/icons/$_pkgname.png"

	# Licences
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	cd licenses
	for _file in *; do
		if [ -f "$_file" ]; then
			install -Dm644 $_file "$pkgdir/usr/share/licenses/$_pkgname/$_file"
		fi
	done

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=Shijima-Qt
Exec=/usr/bin/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Cross-platform shimeji simulation for desktop
EOF
}
