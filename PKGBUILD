# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>
# from: function __check_update

pkgname=whatpulse
pkgver=5.7
pkgrel=1

pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org

license=(custom:whatpulse_tos)
depends=(
	freetype2 xcb-util-image libxkbcommon libxkbcommon-x11 xcb-util-renderutil gcc-libs dbus krb5
	xcb-util-wm glib2 libx11 fontconfig libglvnd xcb-util-keysyms openssl-1.1 glibc libxcb zlib
	hicolor-icon-theme
)

makedepends=(
	imagemagick
	patchelf
)

optdepends=(
	'libpcap: for capturing network statistics'
)
source=(
	'whatpulse.desktop'
	'whatpulse.sh'
	LICENSE
)
source_x86_64=("${pkgname}-${pkgver}-amd64.AppImage::https://releases-dev.whatpulse.org/$pkgver/linux/whatpulse-linux-${pkgver}_amd64.AppImage")

sha256sums=('5a4a6676a6b513824eeac8a2accd6de9e8bd2bc11b3e2967fa2b2a18d29fa35d'
            'f3d16ee6e325a3c657e7af1ebc9f6e35d09ff5c03b0a8b0450611e610c5d6d32'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('da946a823976b9c1fc8558b3d94a6b9975de803345840c04720e91463246c085')

_extract() {
	./"${pkgname}-${pkgver}-amd64.AppImage" --appimage-extract "$1"
}

__check_update() {
	if ! curl --disable -Ls "$url/releasenotes/?beta=false" \
		| xmllint --nowarning --html \
			--xpath 'normalize-space(//div[@id="page-content"]//li[contains(concat(" ",normalize-space(@class)," ")," task-info ")][1]//h3/text()[1])' - 2> /dev/null
		then echo $pkgver
	fi
}

prepare() {
	chmod +x "${pkgname}-${pkgver}-amd64.AppImage"
	_extract usr/bin/whatpulse
	_extract usr/lib
	_extract usr/plugins
	_extract 'whatpulse.png'
	_extract 'usr/share/icons/hicolor/512x512/apps/whatpulse.png'
	ln -sf squashfs-root sfs

	find sfs/usr/lib -type f -not -name 'libQt6*.so.*' -not -name 'libicu*.so.*' -delete
	find sfs/usr/plugins -type f -name 'libqsql*.so' -not -name 'libqsqlite.so' -delete

	find sfs/usr/{bin,lib,plugins} -type f -not -name 'libicudata.so.*' \
		-exec patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib' '{}' +
}

package() {
	# whatpulse
	install -Dm755 whatpulse.sh "${pkgdir}/usr/bin/whatpulse"
	install -Dm755 sfs/usr/bin/whatpulse "${pkgdir}/usr/lib/whatpulse/whatpulse"
	# Qt6
	find sfs/usr/lib -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/whatpulse/lib" '{}' +
	# Qt6 plugins
	find sfs/usr/plugins -mindepth 1 -type d \
		-not \( -name imageformats -or -name xcbglintegrations \) -printf '%f\0' |
		xargs -0I '<>' find 'sfs/usr/plugins/<>' -type f \
			-exec install -Dm644 -t "${pkgdir}/usr/lib/whatpulse/plugins/<>" '{}' +

	install -Dm 644 whatpulse.desktop "${pkgdir}/usr/share/applications/whatpulse.desktop"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	# Set capabilities so that whatpulse can monitor network traffic
	# Disable network monitor caps to prevent segfaults
	# setcap    cap_net_raw,cap_net_admin=eip "${pkgdir}/usr/lib/whatpulse/whatpulse"

	# Generate and install icons
	for size in 16 20 22 24 28 32 36 44 48 64 72 96 128 150 192 256 310 384 512 1024; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		convert \
			+gravity -crop 615x680+0+0 +repage \
			-resize "${size}x${size}" -background none \
			-gravity center -extent "${size}x${size}" \
			sfs/whatpulse.png xc:"#656565" -channel RGB -clut \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/whatpulse.png"
	done
}
