# Maintainer: LycheeSlicer
# Contributor: LycheeSlicer
pkgname=lycheeslicer
pkgver=8.0.0
pkgrel=1
pkgdesc="Lychee Slicer"
arch=('x86_64')
url="http://mango3d.io"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'libcups'
	'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
	'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-utils')
makedepends=('squashfs-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
_appimage="LycheeSlicer-${pkgver}-x86_64.GLIBC-235.AppImage"
noextract=("${_appimage}")
source_x86_64=(
	"https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/${_appimage}"
	"local://lycheeslicer.xml"
)
sha512sums_x86_64=(
	'1392fa403726a51aa2964cc4ba19cb029167552be9019c6fbb4c529aebef0e59305573ad0291fde6d2e3cb1164dfe5a763e51f4b811cb4f44cde9e03178fc369'
	'aba52d9bd76619f66fac0688c1c04846e630f5b8acba6032c61f46a4bcf9ff9d5aa1eb11a3901e85bce33e179d4ccc1f574b06c9ad3f415a692ff4ad39c77f49'
)

prepare() {
	# AppImage runtime can't extract its own payload, so unpack squashfs directly
	chmod +x "${_appimage}"
	local offset
	offset=$("./${_appimage}" --appimage-offset)
	rm -rf squashfs-root
	unsquashfs -q -n -o "${offset}" -d squashfs-root "${_appimage}"
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp -a squashfs-root/opt/Lychee "${pkgdir}/opt/LycheeSlicer"
	# Static libraries are build leftovers, not needed at runtime
	rm -f "${pkgdir}"/opt/LycheeSlicer/*.a

	# Launcher (symlinked to /usr/bin/lycheeslicer in lycheeslicer.install), mirrors upstream AppRun
	install -Dm755 /dev/stdin "${pkgdir}/opt/LycheeSlicer/lycheeslicer" <<-'EOF'
		#!/bin/sh
		cd /opt/LycheeSlicer || exit 1
		exec ./LycheeSlicer --no-sandbox "$@"
	EOF

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/lycheeslicer.desktop" <<-'EOF'
		[Desktop Entry]
		Name=Lychee Slicer
		GenericName=3D Printing Slicer
		Exec=lycheeslicer %u
		Icon=lycheeslicer
		Terminal=false
		Type=Application
		Categories=Graphics;3DGraphics;
		Keywords=3d;slicer;printing;
		MimeType=x-scheme-handler/lycheeslicer;
	EOF

	install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/LycheeSlicer.svg \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/lycheeslicer.svg"
	install -Dm644 lycheeslicer.xml "${pkgdir}/usr/share/mime/packages/lycheeslicer.xml"
}
