# Maintainer: xpufx <github@xpufx.com>
pkgname=nota-daw-bin
pkgver=0.56.1
_appimage_sha='ee931f7187ded392e602a07cef6b2ad90cb6c7255b4cec2d175299c680968eb5'
_license_sha='0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
pkgrel=1
pkgdesc="Modern digital audio workstation (DAW) (upstream binary)"
arch=('x86_64')
url="https://github.com/nota-daw/nota"
_github_url="https://github.com/nota-daw/nota"
_appimage_asset="Nota-${pkgver}-x86_64.AppImage"
license=('AGPL-3.0-only')
_publish_targets="aur"
provides=('nota' 'nota-daw')
conflicts=('nota' 'nota-daw')
options=('!strip' '!debug')
depends=('alsa-lib' 'freetype2' 'fontconfig' 'glibc' 'gcc-libs' 'libx11' 'libxcursor' 'libxext' 'libxinerama' 'libxrandr' 'libice' 'libsm' 'openssl' 'zlib' 'icu' 'hicolor-icon-theme')
optdepends=(
	'pulseaudio: PulseAudio audio backend support'
	'pipewire-pulse: PipeWire PulseAudio audio backend support'
)
source=(
	"${_appimage_asset}::${_github_url}/releases/download/v${pkgver}/${_appimage_asset}"
	"LICENSE::https://raw.githubusercontent.com/nota-daw/nota/v${pkgver}/LICENSE"
)
sha256sums=(
	"$_appimage_sha"
	"$_license_sha"
)

prepare() {
	cd "$srcdir"
	chmod +x "Nota-${pkgver}-x86_64.AppImage"
	rm -rf squashfs-root
	./Nota-${pkgver}-x86_64.AppImage --appimage-extract
}

package() {
	cd "$srcdir"

	# Install application files from extracted squashfs-root/usr/bin/ to /usr/lib/nota/
	install -d "${pkgdir}/usr/lib/nota"
	cp -a squashfs-root/usr/bin/* "${pkgdir}/usr/lib/nota/"

	# Fix directory and file permissions
	find "${pkgdir}/usr/lib/nota" -type d -exec chmod 755 {} +
	find "${pkgdir}/usr/lib/nota" -type f -exec chmod 644 {} +
	chmod 755 "${pkgdir}/usr/lib/nota/Nota.App"
	if [ -f "${pkgdir}/usr/lib/nota/nota-scanworker" ]; then
		chmod 755 "${pkgdir}/usr/lib/nota/nota-scanworker"
	fi
	find "${pkgdir}/usr/lib/nota" -type f -name "*.so*" -exec chmod 755 {} +

	# Remove LTTng tracepoint provider to avoid unnecessary dependency on liblttng-ust
	rm -f "${pkgdir}/usr/lib/nota/libcoreclrtraceptprovider.so"

	# Drop build-time artifacts that only bloat the package
	find "${pkgdir}/usr/lib/nota" -name "*.pdb" -delete
	find "${pkgdir}/usr/lib/nota" -name "*.xml" -delete

	# createdump is a development/crash-dump helper, not needed at runtime
	rm -f "${pkgdir}/usr/lib/nota/createdump"

	# Install launcher scripts
	install -d "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/nota" << 'EOF'
#!/bin/sh
exec /usr/lib/nota/Nota.App "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/nota"
	ln -s nota "${pkgdir}/usr/bin/nota-daw"

	# Desktop entry
	install -d "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/nota.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Nota
Comment=Modern digital audio workstation
Exec=/usr/bin/nota
Icon=nota
Terminal=false
Categories=AudioVideo;Audio;Music;
StartupWMClass=Nota.App
EOF

	# Application icons
	if [ -f "squashfs-root/usr/share/icons/hicolor/256x256/apps/nota.png" ]; then
		install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/nota.png" \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/nota.png"
	elif [ -f "squashfs-root/nota.png" ]; then
		install -Dm644 "squashfs-root/nota.png" \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/nota.png"
	fi

	# Upstream license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
