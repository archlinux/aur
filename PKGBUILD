# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# You'll need to download the package archive from
# https://www.blackmagicdesign.com/products/davinciresolve

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

pkgname=davinci-resolve
_pkgname=resolve
pkgver=15.2.2
pkgrel=1
pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
arch=('x86_64')
url="https://www.blackmagicdesign.com/"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'libpng12' 'lib32-libpng12' 'ocl-icd' 'openssl-1.0'
         'opencl-driver' 'qt4' 'qt5-base' 'qt5-svg' 'qt5-webkit'
         'qt5-webengine' 'qt5-websockets' 'xdg-user-dirs')
options=('!strip')
conflicts=('davinci-resolve-beta' 'davinci-resolve-studio' 'davinci-resolve-studio-beta')
DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`

if [ ! -f ${pkgdir}/DaVinci_Resolve_${pkgver}_Linux.zip ]; then
  if [ -f $DOWNLOADS_DIR/DaVinci_Resolve_${pkgver}_Linux.zip ]; then
    ln -sfn $DOWNLOADS_DIR/DaVinci_Resolve_${pkgver}_Linux.zip ${pkgdir}
  else
    msg2 "The package can be downloaded here: https://www.blackmagicdesign.com/products/davinciresolve/"
    msg2 "Please remember to put a downloaded package DaVinci_Resolve_${pkgver}_Linux.zip into the build directory or $DOWNLOADS_DIR"
    sleep 3
  fi
fi

source=("local://DaVinci_Resolve_${pkgver}_Linux.zip")
sha256sums=('4330673cbe62f1ce2292d0357e20503233124bbb5a1b7752ce83b4befcf29497')

package() {
#	msg2 "Did you download the archive manually? If not, this will fail."
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
	install -Dm666 rsf/default-config-linux.dat "${pkgdir}/opt/${_pkgname}/configs/config.dat"

	msg2 "Add lib symlinks..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	ln -s /usr/lib/libcrypto.so.1.0.0  libs/libcrypto.so.10
	ln -s /usr/lib/libssl.so.1.0.0     libs/libssl.so.10
	ln -s /usr/lib/libgstbase-1.0.so   libs/libgstbase-0.10.so.0
	ln -s /usr/lib/libgstreamer-1.0.so libs/libgstreamer-0.10.so.0

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
mkdir -p /tmp/${_pkgname}/{logs,GPUCache}
cd /opt/${_pkgname}
exec bin/resolve "\$@"
EOF
	install -Dm755 start-resolve "${pkgdir}/opt/${_pkgname}/bin/start-resolve"

	msg2 "Making sure file ownership is 'correct'..."
	chown -R root:root "${pkgdir}/opt"
	chmod 0777 "${pkgdir}/opt/${_pkgname}/configs"
	chmod 0777 "${pkgdir}/opt/${_pkgname}/Media"

	msg2 "Any final tweaks..."
	ln -s "/tmp/${_pkgname}/logs" "${pkgdir}/opt/${_pkgname}/logs"
	ln -s "/tmp/${_pkgname}/GPUCache" "${pkgdir}/opt/${_pkgname}/GPUCache"

	msg2 "Done!"
}

# vim: fileencoding=utf-8 sts=4 sw=4 noet
