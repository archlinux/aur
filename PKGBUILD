# Maintainer: uberben <ben at benbergman dot ca>

pkgname="orca-slicer-nightly-bin"
pkgver=2025.05.16.171331Z
pkgrel=1
pkgdesc="G-code generator for 3D printers (nightly builds)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'webkit2gtk-4.1' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-plugins-base' 'gst-libav')
provides=("orca-slicer")
conflicts=("orca-slicer")

src() {
    curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SoftFever/OrcaSlicer/releases/tags/nightly-builds \
  | jq --raw-output ".assets | map({ name: .name, date: .created_at, url: .browser_download_url }) | map(select(.name | test(\"AppImage\")))[0].url"
}

source=($(src))
sha512sums=('SKIP')

appimage=${source[0]##*/}

pkgver() {
	tag_object_sha_line=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SoftFever/OrcaSlicer/git/refs/tags/nightly-builds | grep "/git/tags")
	tag_date_line=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  ${tag_object_sha_line:12:-1} | grep "date")
	echo ${tag_date_line:13:-1} | sed 's/[-T]/./g; s/://g'
}

prepare() {
	chmod +x ${appimage}
	./${appimage} --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/orca-slicer-nightly/bin/orca-slicer|g' \
		"squashfs-root/OrcaSlicer.desktop"
}

package() {
	find squashfs-root/{resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}/"
	cp -av squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
	rm "$pkgdir/opt/${pkgname%-bin}"/{OrcaSlicer.desktop,AppRun,OrcaSlicer.png,OrcaSlicer-x86_64.AppImage}

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-bin}/bin/orca-slicer" "$pkgdir/usr/bin/"

	install -Dm644 "squashfs-root/OrcaSlicer.desktop" -t \
		"$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}

