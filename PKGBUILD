# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=duckstation-preview-latest-bin
#_url="$(curl -s "$(curl -s "https://api.github.com/repos/stenzek/duckstation/releases" | jq -r '.[] | select(.tag_name == "preview") | .url')" | awk -F'"' '/browser_download_url.*DuckStation.*AppImage/ {print $4}')"
_pkgname="duckstation-qt"
_fullname=org.duckstation.DuckStation
pkgver=0.1.9900
pkgrel=1
pkgdesc="Fast PlayStation 1 emulator for PC and Android"
arch=('x86_64')
url='https://github.com/stenzek/duckstation'
license=('CC BY-NC-ND 4.0')
makedepends=('yq')
provides=("$_pkgname" 'duckstation')
conflicts=('duckstation' 'duckstation-git' 'duckstation-qt-bin')
options=('!strip')
_appimage="DuckStation-x64.AppImage"
noextract=("${_appimage}")
source=("https://github.com/stenzek/duckstation/releases/download/preview/${_appimage}")
sha256sums=('SKIP')

prepare() {
	# Extract AppImage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

	# Update script
	sed -Ei \
    's@^this_dir=".*\breadlink\b.*\bdirname\b.*"$@this_dir="/opt/duckstation-qt"@' \
    "$srcdir/squashfs-root/AppRun"
}

pkgver() {
	xq -r '.component.releases.release["@version"]' < squashfs-root/usr/share/metainfo/org.duckstation.DuckStation.metainfo.xml | awk -F '[-]' -v OFS='.' '{print $1,$2}'
}

package() {
	#Icon
	install -Dm644 "squashfs-root/${_fullname}.png" -t "$pkgdir/usr/share/pixmaps"
	
	# Desktop file
	install -Dm644 "squashfs-root/${_fullname}.desktop" -t "$pkgdir/usr/share/applications"
	
	# Main files
	install -d "$pkgdir/opt"
	cp -avR squashfs-root/ "$pkgdir/opt/$_pkgname"
	
	# Linking the script to the executable
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/$_pkgname/AppRun" "$pkgdir/usr/bin/$_pkgname"
	
	# Permissions
	find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} +
}
