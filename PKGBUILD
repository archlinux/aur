# Maintainer: Kyza <kyzamizu at gmail dot com>

_pkgname=keyguard
pkgname=$_pkgname-git
pkgver=r642.557bf42
pkgver() {
	cd "$_pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=3
pkgdesc="Keyguard is an alternative client for the Bitwarden® platform, created to provide the best user experience possible."
arch=("x86_64")
license=("custom")
depends=()
makedepends=("jdk17-openjdk" "dpkg" "git")
url="https://github.com/AChep/keyguard-app"
source=("$_pkgname"::"git+$url.git")
options=("!strip" "!debug")

md5sums=('SKIP')

build() {
	_codesource="$srcdir/$_pkgname"
	cd "$_codesource" || exit

	# create gradle.properties
	echo -e "\nbuildkonfig.flavor=release" >> "$_codesource/gradle.properties"
	# build .deb file
	./gradlew :desktopApp:packageDeb
}

package() {
	_codesource="$srcdir/$_pkgname"

	# extract data from built .deb file
	mkdir -p "$srcdir/deb"
	cd "$srcdir/deb" || exit
	ar vx "$_codesource/desktopApp/build/compose/binaries/main/deb/$(ls "$_codesource"/desktopApp/build/compose/binaries/main/deb)"
	
	# extract data.tar.xz from .deb file
	mkdir -p "$srcdir/output"
	tar -xvf "$srcdir/deb/data.tar.xz" -C "$srcdir/output"

	# copy and install contents of data.tar.xz
	cp -r "$srcdir/output/"* "$pkgdir"
	install -d "$pkgdir"/opt/keyguard

	# create link to /usr/bin
	mkdir -p "$pkgdir"/usr/bin
	ln -s "$pkgdir/opt/keyguard/bin/Keyguard" "$pkgdir/usr/bin/keyguard"
	install -d "$pkgdir"/usr/bin

	# create .desktop file and install
	cat > "$srcdir/keyguard.desktop" << EOL
[Desktop Entry]
Type=Application
Name=Keyguard
Comment=$pkgdesc
Version=$pkgver
Path=/opt/keyguard/bin
Exec=/opt/keyguard/bin/Keyguard
Icon=keyguard
Terminal=false
Categories=Utility;
StartupWMClass=Keyguard;
Keywords=keyguard;bitwarden;
EOL

	mkdir -p "$pkgdir/usr/share/pixmaps"
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm0644 "$_codesource/desktopApp/icon.png" "$pkgdir/usr/share/pixmaps/keyguard.png"
	install -Dm0644 "$srcdir/keyguard.desktop" "$pkgdir/usr/share/applications/"
} 
