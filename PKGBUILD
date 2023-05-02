# Maintainer: éclairevoyant

_buildid=$(curl "https://olivevideoeditor.org/nightly.php" | grep -Eao "<a[^h]+href='go.php\?id=([[:digit:]]+)'[^>]+>Download</a>" | head -1 | grep -Eo "[[:digit:]]+")
_url=$(curl --request POST --url 'https://www.olivevideoeditor.org/ghret.php' --header 'Content-Type: multipart/form-data' --form "id=$_buildid")
_artifactname=$(echo $_url | grep -Eo 'Olive.*?Linux-x86_64')
_hash=$(echo $_artifactname | sed -E 's|Olive-(.*?)-Linux-x86_64|\1|')

_pkgname=olive
pkgname=olive-nightly-bin
pkgver=$(curl "https://raw.githubusercontent.com/olive-editor/olive/$_hash/CMakeLists.txt" | grep -m1 'project(olive-editor' | sed -E 's|.*VERSION ([0-9.]+).*|\1|')_${_buildid}_$_hash
pkgrel=1
epoch=1
pkgdesc="Free non-linear video editor"
arch=(x86_64)
license=(GPL3)
url="https://www.olivevideoeditor.org/"
depends=(openexr ffmpeg openimageio opencolorio portaudio qt5-base opentimelineio)
provides=("olive")
conflicts=("olive")
options=('!strip')
source=("$pkgname-$pkgver.zip::$_url")
b2sums=('SKIP')

prepare() {
	chmod +x $_artifactname.AppImage
	./$_artifactname.AppImage --appimage-extract
}

package() {
	cd squashfs-root

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/olive-editor" <<eof
#!/usr/bin/env sh
LD_LIBRARY_PATH=/opt/olive/libs /opt/olive/olive-editor "$@"
eof
	install -Dm755 usr/bin/olive-{crashhandler,editor} -t "$pkgdir/opt/$_pkgname/"

	# directories have 700 perms by default
	find -type d -exec chmod 755 '{}' +
	cp -p -r usr/share "$pkgdir/usr/"

	local libraries=($(find . -type f \( -name '*.so*' ! -iname '*qt*' \)))
	for file in "${libraries[@]}"; do
		install -Dm755 $file -t "$pkgdir/opt/$_pkgname/libs/"
	done
}
