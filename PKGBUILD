# Maintainer: nous

pkgname=opera-116	# Set to "opera" or "opera-next" if you want to replace either of these
_bigrelease=11.62
_buildver=1347
pkgver=${_bigrelease}_${_buildver}
pkgrel=2
pkgdesc="The fastest browser on earth. Last 11-series version, if you find opera 12 unstable or bloated."
url="http://www.opera.com/browser/"
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext')
provides=('opera')
optdepends=('gstreamer0.10-base-plugins: HTML5 Video support' 'gstreamer0.10-good: HTML5 Video support')
install=opera-116.install
options=(!strip !zipman)
license=('custom:opera')
arch=('i686' 'x86_64')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=x86_64
source=(http://arc.opera.com/snapshot/linux-freebsd/opera-${_bigrelease}-${_buildver}.${_arch}.linux.tar.xz http://people.opera.com/ruario/opera-next-icons_20111107.tar.xz)
sha256sums=('0d5a8f88453637c5248628cf343e57ef4f130971c7fc65a2b4dcbef2c5ec057d' '4040aad19e11c6e32d3603467858bf58dd389b24a4314e7cbb8b86c9c7b689fd')
[ "$CARCH" = "x86_64" ] && sha256sums=('e13dba391ba4d76ea6d8f5b9d18cde0f312217c6c28f530f994812756b46bab4' '4040aad19e11c6e32d3603467858bf58dd389b24a4314e7cbb8b86c9c7b689fd')

# Uncomment the following line, if you want your User Agent to include Arch Linux.
#_opdistro="Arch Linux"

package() {
	opera-${_bigrelease}-${_buildver}.${_arch}.linux/install --prefix /usr --name ${pkgname} --repackage "${pkgdir}/usr"
	install -D -m 644 "${pkgdir}/usr/share/${pkgname}/defaults/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	
	# User Opera Next icon set if package name is set to Opera Next
	if [ "${pkgname}" = "opera-next" ]; then
		tar -xf opera-next-icons_20111107.tar.xz -C "${pkgdir}"
		sed -i "s/^\(Product=\)opera$/\1opera-next/" "${pkgdir}/usr/share/opera-next/package-id.ini"
	fi
	
	# Insert an Arch User Agent string if set
	if [ -n "${_opdistro}" ]
	then
		mkdir -p "${pkgdir}/usr/share/${pkgname}/custom/defaults"
		echo "[ISP]" > "${pkgdir}/usr/share/${pkgname}/custom/defaults/operaprefs.ini"
		echo "Id=${_opdistro}" >> "${pkgdir}/usr/share/${pkgname}/custom/defaults/operaprefs.ini"
		chmod 644 "${pkgdir}/usr/share/${pkgname}/custom/defaults/operaprefs.ini"
	fi
}
