# Maintainer: metamacro <metamacro@tuta.com>
# Contributor: hendy643 <hendy643@hotmail.com>
# SPDX-License-Identifier: 0BSD
#
# Build instructions:
#
# The installer is behind NXP's login/license wall and cannot be fetched by makepkg.
#
# 1. Log in to nxp.com and open the URL in $url below
# 2. Download "Config Tools for i.MX, Linux DEB package" (BIN, version matching pkgver)
#    and accept the license terms
# 3. Place config-tools-for-imx-<pkgver>-1_amd64.deb.bin next to this PKGBUILD
#    (when using an AUR helper, place in e.g. ~/.cache/<aur-helper>/clone/config-tools-for-imx/)
# 4. makepkg -si

pkgname=config-tools-for-imx
pkgver=26.09
pkgrel=1
pkgdesc="NXP i.MX pin, DDR, SerDes, TEE and System Manager configuration tools"
arch=('x86_64')
url="https://www.nxp.com/design/design-center/software/development-software/config-tools-for-i-mx-applications-processors:CONFIG-TOOLS-IMX"
license=('LicenseRef-NXP-LA-OPT-NXP-Software-License')
depends=('glibc' 'libstdc++' 'libgcc' 'zlib' 'expat' 'freetype2' 'alsa-lib'
         'gtk3' 'glib2' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
optdepends=('webkit2gtk-4.1: embedded browser views (documentation, online update site)')
install="${pkgname}.install"
options=('!strip' '!debug')

# NXP's Debian package revision, independent from pkgrel.
_debrel=1
_installdir="i.MX_CFG_${pkgver}"
_bin="${pkgname}-${pkgver}-${_debrel}_amd64.deb.bin"
_deb="${pkgname}-${pkgver}-${_debrel}_amd64.deb"

source=("local://${_bin}")
noextract=("${_bin}")
b2sums=('5c6bcf9c01ed3ac39ed228eede4c6f76720ead342695549f27ea38ad605d575320fcf4774b6979b4db3ce7fc9aa3170f31ba71fd1fb734a40311d57ef4007991')

prepare() {
	sh "${_bin}" --noexec --keep --nox11 --target "${srcdir}/extracted"

	mkdir -p deb
	bsdtar -xOf "extracted/${_deb}" 'data.tar.*' | bsdtar -x -C deb -f -
}

package() {
	cd deb

	install -d "${pkgdir}/opt/nxp"
	cp -a "opt/nxp/${_installdir}" "${pkgdir}/opt/nxp/"

	# Bundled SPSDK CLI shebangs still point at NXP's Jenkins build host (Not affecting GUI App)
	find "${pkgdir}/opt/nxp/${_installdir}/bin/python3/bin" -maxdepth 1 -type f \
		-exec sed -i "s|#!/home/build/jenkins/workspace/config_build_python_package_linux/python3/bin/python|#!/opt/nxp/${_installdir}/bin/python3/bin/python|" {} +

	install -Dm644 "usr/share/applications/com.nxp.${pkgname}-${pkgver}.desktop" \
		-t "${pkgdir}/usr/share/applications/"

	# Debian ships these in /etc/udev/rules.d; Arch packages use /usr/lib/udev/rules.d
	install -Dm644 etc/udev/rules.d/85-config-tools.rules \
		-t "${pkgdir}/usr/lib/udev/rules.d/"

	install -Dm644 "${srcdir}/extracted/ProductLicense.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
