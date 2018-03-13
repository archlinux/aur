# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Jameson Pugh <imntreal AT gmail DOT com>

pkgname='skype'
pkgdesc='P2P software for high-quality voice communication'
pkgver='8.17.0.2'
pkgrel=1
_pkgbranch='skypeforlinux'
arch=('x86_64')
url='http://www.skype.com'
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring: for credentials storage')
source=("https://repo.skype.com/deb/pool/main/s/${_pkgbranch}/${_pkgbranch}_${pkgver}_amd64.deb")
sha256sums=('379b4007af8817a213d374040fb80b4b5ca58fc7ffde3909941e699ec8d26853')

package() {

	tar -xJC "${pkgdir}" -f data.tar.xz
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	rm -rf "${pkgdir}/opt"

	# install the program as ${pkgname} instead of ${_pkgbranch} in order to avoid conflicts

	mv "${pkgdir}/usr/share/${_pkgbranch}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"

	for _filefound in `find "${pkgdir}" -type d -name "${_pkgbranch}"` ; do
		mv "${_filefound}" "${_filefound%${_pkgbranch}}${pkgname}"
	done

	for _filefound in `find "${pkgdir}" -type f \( -name "${_pkgbranch}" -o -name "${_pkgbranch}.*" \)` ; do
		mv "${_filefound}" $([[ "${_filefound}" == *"${_pkgbranch}" ]] && echo "${_filefound%${_pkgbranch}}${pkgname}" || echo "${_filefound%${_pkgbranch}.*}${pkgname}.${_filefound##*.}")
	done

	sed -i "s/${_pkgbranch}/${pkgname}/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	sed -i "s/${_pkgbranch}/${pkgname}/g" "${pkgdir}/usr/bin/${pkgname}"

}
