# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Special thanks to jonathon https://aur.archlinux.org/account/jonathon

# You'll need to download the package archive from
# https://www.blackmagicdesign.com/products/davinciresolve

pkgname=davinci-resolve-beta
_pkgname=resolve
pkgver=14.0b4
pkgrel=0
pkgdesc='Professional A/V post-production software suite'
arch=('x86_64')
url="https://www.blackmagicdesign.com/"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'ocl-icd' 'libpng12' 'log4cxx'
         'opencl-driver' 'qt4' 'qt5-base' 'qt5-svg' 'qt5-webkit' 'qt5-webengine' 'qt5-websockets')
options=('!strip')
conflicts=('davinci-resolve')
source=("local://DaVinci_Resolve_${pkgver}_Linux.zip")
sha256sums=('1756c12c94af08a2b7a9d502aa63ab429ed756d47cdd0f1834f92add2f945191')

package() {
	mkdir -p "${pkgdir}/opt/${_pkgname}/"{bin,configs,Media}

	msg2 "Extracting from bundle..."
	cd "${srcdir}" || exit
	./DaVinci_Resolve_${pkgver}_Linux.sh --tar xf -C "${pkgdir}/opt/${_pkgname}"

	msg2 "Extracting library archives..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	gunzip -f LUT/trim_lut0.dpx.gz
	for archive in libs/*tgz; do
		tar xf "${archive}" -C libs/
		rm -f "${archive}"
	done

	msg2 "Relocate binaries and config..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	local _binaries=(
		BMDPanelFirmware
		DPDecoder
		ShowDpxHeader
		TestIO
		bandwidthTest
		bmdpaneld
		deviceQuery
		oclBandwidthTest
		oclDeviceQuery
		qt.conf
	)
	for binary in "${_binaries[@]}"; do
		mv "rsf/${binary}" "bin/${binary}"
	done
	mv resolve bin/resolve
	mv rsf/Control Control
	cp rsf/default-config-linux.dat configs/config.dat

	msg2 "Add lib symlinks..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	ln -s /usr/lib/libcrypto-compat.so.1.0.0 libs/libcrypto.so.10
	ln -s /usr/lib/libssl-compat.so.1.0.0    libs/libssl.so.10
	ln -s /usr/lib/libgstbase-1.0.so         libs/libgstbase-0.10.so.0
	ln -s /usr/lib/libgstreamer-1.0.so       libs/libgstreamer-0.10.so.0

	msg2 "Creating launchers..."
	cd "${srcdir}" || exit
	cat > "${srcdir}/DaVinci Resolve.desktop" << EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=DaVinci Resolve
Comment=Professional non-linear editing
Exec=/opt/${_pkgname}/bin/start-resolve
Icon=/opt/${_pkgname}/rsf/DV_Resolve.png
Terminal=false
Categories=Multimedia;AudioVideo;Application;
EOF
	install -Dm644 DaVinci\ Resolve.desktop "${pkgdir}/usr/share/applications/DaVinci Resolve.desktop"

	cat > "${srcdir}/start-resolve" << EOF
#!/bin/sh
export LD_LIBRARY_PATH=/opt/${_pkgname}/libs
exec /opt/${_pkgname}/bin/resolve "\$@"
EOF
	install -Dm755 start-resolve "${pkgdir}/opt/${_pkgname}/bin/start-resolve"

	msg2 "Making sure file ownership is correct..."
	chown -R root:root "${pkgdir}/opt"
	chmod 0777 "${pkgdir}/opt/${_pkgname}/Media"

	msg2 "Any final tweaks..."
	ln -s /tmp "${pkgdir}/opt/${_pkgname}/logs"

	msg2 "Done!"
}
