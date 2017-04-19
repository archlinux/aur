# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# You'll need to download the package archive from
# https://www.blackmagicdesign.com/products/davinciresolve

pkgname=davinci-resolve
_pkgname=resolve
pkgver=12.5.5
pkgrel=1
arch=('x86_64')
url="https://www.blackmagicdesign.com/"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'ocl-icd' 'openssl' 'qt4'
         'qt5-base' 'qt5-svg' 'qt5-webkit' 'qt5-webengine' 'qt5-websockets')
options=('!strip')
source=("local://DaVinci_Resolve_${pkgver}_Linux.zip")
sha256sums=('d0235480f400f531729ceec2e5daf5334191d1a59d3c32c5e0d8b32c69f88b38')

package() {
	mkdir -p ${pkgdir}/opt/${_pkgname}/configs

	msg2 "Extracting from bundle..."
	cd ${srcdir}
	./DaVinci_Resolve_${pkgver}_Linux.sh --tar xf -C ${pkgdir}/opt/${_pkgname}

	msg2 "Extracting library archives..."
	cd ${pkgdir}/opt/${_pkgname}/
	gunzip -f LUT/trim_lut0.dpx.gz
	for archive in libs/*tgz; do
		tar xf ${archive} -C libs/
		rm ${archive}
	done

	msg2 "Relocate binaries and config..."
	cd ${pkgdir}/opt/${_pkgname}/
	mkdir -p bin
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
		mv rsf/${binary} bin/${binary}
	done
	mv resolve bin/resolve
	mv rsf/Control Control
	cp rsf/default-config-linux.dat configs/config.dat

	msg2 "Add lib symlinks..."
	cd ${pkgdir}/opt/${_pkgname}/
	ln -s /usr/lib/libcrypto.so libs/libcrypto.so.10
	ln -s /usr/lib/libssl.so    libs/libssl.so.10
	ln -s /usr/lib/libgstbase-1.0.so   libs/libgstbase-0.10.so.0
	ln -s /usr/lib/libgstreamer-1.0.so libs/libgstreamer-0.10.so.0

	msg2 "Creating launchers..."
	cd ${srcdir}
	cat > ${srcdir}/DaVinci\ Resolve.desktop << EOF
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
	install -Dm644 DaVinci\ Resolve.desktop ${pkgdir}/usr/share/applications/DaVinci\ Resolve.desktop

	cat > ${srcdir}/start-resolve << EOF
#!/bin/sh
export LD_LIBRARY_PATH=/opt/${_pkgname}/libs
exec /opt/${_pkgname}/bin/resolve "\$@"
EOF
	install -Dm755 start-resolve ${pkgdir}/opt/${_pkgname}/bin/start-resolve

	msg2 "Making sure file ownership is correct..."
	chown -R root:root ${pkgdir}/opt

	msg2 "Any final tweaks..."
	ln -s /tmp ${pkgdir}/opt/${_pkgname}/logs

	msg2 "Done!"
}
