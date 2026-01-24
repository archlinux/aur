# Maintainer: manganeese <mangoiscute95@gmail.com>
# Contributor: Carson Rueter <swurl at swurl dot x y z>
# Contributor: Isaac Ruben <isaac at rubenfamily dot com>
pkgname='pathplanner-bin'
_pkgver="2026.1.2"
# git commit of version for license file
_git_commit=e02bbf3176588166e8fe5192ab8dea85f6d62f7a
pkgver="v$_pkgver"
pkgrel=2
pkgdesc="A simple yet powerful motion profile generator for FRC robots"
arch=("x86_64")
url="https://github.com/mjansen4857/pathplanner"
license=('MIT')
provides=("pathplanner")
depends=(
	util-linux-libs
	glib2
	glibc
	gcc-libs
	xz
)
source=(
	"$pkgname-$pkgver.zip::https://github.com/mjansen4857/pathplanner/releases/download/$pkgver/PathPlanner-Linux-$pkgver.zip"
	"https://raw.githubusercontent.com/mjansen4857/pathplanner/$_git_commit/LICENSE"
)
sha256sums=(
	'9f41e49d9ba2a3c445c1a32dbc13c49489e3013c74eefced1bd963eb50ad8b55'
	'dcf88615ff3ae092f867a6dc975d9dfb61faf71a29f51bf11d01cdfa718d4c92'
)

prepare() {
	{
		echo "[Desktop Entry]"
		echo "Version=1.5"
		echo "Type=Application"
		echo "Name=PathPlanner"
		echo "Exec=/usr/bin/pathplanner"
		echo "Categories=Development"
		echo "Keywords=FRC;Motion Profile;Path Planning"
		echo "Icon=/opt/$pkgname/data/flutter_assets/images/icon.png"
	} >> PathPlanner.desktop
}

package() {
	cd "$srcdir"
	# make the needed directories
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	# copy over program files to opt
	cp -r "$srcdir/data" "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/lib" "$pkgdir/opt/$pkgname"
	cp "$srcdir/pathplanner" "$pkgdir/opt/$pkgname"

	# copy over license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# make file executable
	chmod +x "$pkgdir/opt/$pkgname/pathplanner"

	# create symlink to executable
	ln -s "/opt/$pkgname/pathplanner" "$pkgdir/usr/bin/pathplanner"

	# copy over desktop file
	cp "$srcdir/PathPlanner.desktop" "$pkgdir/usr/share/applications/PathPlanner.desktop"
}
