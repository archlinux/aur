# Maintainer: Ash <xash at riseup d0t net>
# Contributor: kryksyh <kryksyh@gmail.com>
pkgname=audacity4-bin
pkgver=4.0.0_beta.4
pkgrel=3
pkgdesc="Audacity 4, the next generation of the popular multi-track audio editor"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
options=('!strip' '!debug')
provides=('audacity4')
_tag_ver="${pkgver/_beta./-beta-}"
_appimage_ver="${pkgver/_beta./-beta}"
_appimage="Audacity-${_appimage_ver}-$CARCH.AppImage"
source=("${_appimage}::https://github.com/audacity/audacity/releases/download/Audacity-${_tag_ver}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('50d73009bcb59511f58ea047f7a99c58ecc9086c9747dd9b54e83019c014ae96')

prepare() {
	cd "$srcdir"
	chmod +x "${_appimage}"
	"./${_appimage}" --appimage-extract >/dev/null

	# Quick fix for ffmpeg9
	rm -f "$srcdir/squashfs-root/usr/lib/libsystemd.so.0"
}

package() {
	cd "$srcdir/squashfs-root"

	# Install AppImage content
	install -dm755 "$pkgdir/opt/$pkgname"
	cp -a . "$pkgdir/opt/$pkgname/"

	# Remove symlinks
	rm -f "$pkgdir/opt/$pkgname/usr" \
	      "$pkgdir/opt/$pkgname/audacity4portable.png" \
	      "$pkgdir/opt/$pkgname/aup4.svg" \
	      "$pkgdir/opt/$pkgname/org.audacityteam.Audacity4portable.desktop"

	# Create /usr/bin symlink
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/AppRun" "$pkgdir/usr/bin/audacity4"

	# Fix-up the desktop file from AppImage
	install -dm755 "$pkgdir/usr/share/applications"
	sed -e 's|^Exec=.*|Exec=audacity4 %U|' \
	    -e 's|^Name=Audacity 4 Portable$|Name=Audacity 4|' \
		share/applications/org.audacityteam.Audacity4portable.desktop \
		> "$pkgdir/usr/share/applications/org.audacityteam.Audacity4portable.desktop"
	chmod 644 "$pkgdir/usr/share/applications/org.audacityteam.Audacity4portable.desktop"

	# Install app icons
	local _size
	for _size in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 512x512; do
		install -dm755 "$pkgdir/usr/share/icons/hicolor/$_size/apps"
		ln -s "/opt/$pkgname/share/icons/hicolor/$_size/apps/audacity4portable.png" \
		      "$pkgdir/usr/share/icons/hicolor/$_size/apps/audacity4portable.png"
	done

	# MIME type icons
	install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/mimetypes"
	ln -s "/opt/$pkgname/share/icons/hicolor/512x512/mimetypes/application-x-audacity4portable.png" \
	      "$pkgdir/usr/share/icons/hicolor/512x512/mimetypes/application-x-audacity4portable.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes"
	ln -s "/opt/$pkgname/share/icons/hicolor/scalable/mimetypes/application-x-audacity4portable.svg" \
	      "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes/application-x-audacity4portable.svg"

	# MIME types
	install -dm755 "$pkgdir/usr/share/mime/packages"
	ln -s "/opt/$pkgname/share/mime/packages/audacity4portable.xml" \
	      "$pkgdir/usr/share/mime/packages/audacity4portable.xml"
}
