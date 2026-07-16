# Maintainer: Sam M <contact@s-mc.io>
pkgname=nuvio-desktop
_pkgname=nuvio
pkgver=0.1.13_alpha
pkgrel=1
pkgdesc="A modern media hub desktop application (Pre-compiled AppImage)"
arch=('x86_64')
url="https://github.com/aelrased/NuvioDesktop"
license=('GPL-3.0-or-later')
depends=('mpv' 'fuse2' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

_upstream_ver="${pkgver/_/-}"
source=("Nuvio-${pkgver}-x86_64.AppImage::${url}/releases/download/${_upstream_ver}/Nuvio-${_upstream_ver}-x86_64.AppImage")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}"
	chmod +x "Nuvio-${pkgver}-x86_64.AppImage"
	./Nuvio-${pkgver}-x86_64.AppImage --appimage-extract
}

package() {
	_extracted_dir="${srcdir}/squashfs-root"

	# 1. Install application directory structure into /opt/nuvio
	install -d "${pkgdir}/opt/${_pkgname}"

	# Copy the extracted AppImage root files (bin, lib, etc.) into /opt/nuvio
	cp -Rp "${_extracted_dir}/." "${pkgdir}/opt/${_pkgname}/"

	# Clean up AppImage-specific root files that aren't needed in /opt
	rm -f "${pkgdir}/opt/${_pkgname}/AppRun"
	rm -f "${pkgdir}/opt/${_pkgname}/Nuvio.desktop"
	rm -f "${pkgdir}/opt/${_pkgname}/Nuvio.png"
	rm -f "${pkgdir}/opt/${_pkgname}/.DirIcon"

	# 2. Setup the binary executable launcher in /usr/bin
	install -d "${pkgdir}/usr/bin"
	cat <<EOF >"${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
export LD_LIBRARY_PATH="/opt/${_pkgname}/lib:/opt/${_pkgname}/lib/runtime/lib:\${LD_LIBRARY_PATH}"
exec "/opt/${_pkgname}/bin/Nuvio" "\$@"
EOF
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	# 3. Create and install the Desktop Entry directly
	install -d "${pkgdir}/usr/share/applications"
	cat <<EOF >"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=Nuvio
Comment=${pkgdesc}
Exec=${_pkgname}
Icon=${_pkgname}
Type=Application
Categories=AudioVideo;Player;
Terminal=false
EOF

	# 4. Grab the Icon file extracted from the AppImage
	if [ -f "${_extracted_dir}/Nuvio.png" ]; then
		install -Dm644 "${_extracted_dir}/Nuvio.png" \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	fi
}
