# Maintainer: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=145.969.10
_pkgver=2016.1.3
_eap="True"
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
epoch=1
pkgdesc="Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition."
arch=('any')
options=('!strip')
url="https://confluence.jetbrains.com/pages/viewpage.action?pageId=23004355"
license=("custom")
makedepends=("wget")
provides=("pycharm-professional" "pycharm-pro-eap")
conflicts=("pycharm-professional" "pycharm-pro-eap")
groups=("development" "IDE" "editor" "jetbrains")

if [[ "True" = "${_eap}" ]]; then
	_srcfile="pycharm-professional-${_buildver}.tar.gz"
	source=("http://download.jetbrains.com/python/${_srcfile}"
			"${pkgname}.desktop")
	sha256sums=($(wget -q "${source}.sha256" && cat "${_srcfile}.sha256" | cut -f1 -d" ")
				"aa9573c177f5d4d3092b9dff2aef5b4c7d25ff9c2b044be222a0512dff759731")
else
	_srcfile="pycharm-professional-${_pkgver}.tar.gz"
	source=("http://download.jetbrains.com/python/${_srcfile}"
			"${pkgname}.desktop")
	sha256sums=($(wget -q "${source}.sha256" && cat "${_srcfile}.sha256" | cut -f1 -d" ")
				"aa9573c177f5d4d3092b9dff2aef5b4c7d25ff9c2b044be222a0512dff759731")
fi


package() {
	cd "${srcdir}"
	install -dm 755 \
		"${pkgdir}/opt/${pkgname}" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/licenses/${pkgname}/" \
		"${pkgdir}/usr/share/applications/"

	if [[ "True" = "${_eap}" ]]; then
		cp -R --no-preserve=ownership "${srcdir}/pycharm-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
	else
		cp -R --no-preserve=ownership "${srcdir}/pycharm-${_pkgver}/"* "${pkgdir}/opt/${pkgname}"
	fi
	
	if [[ "i686" = "${CARCH}" ]]; then
		rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
		rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
	fi

	sed -i "s/Version=/Version=${pkgver}/g" "${pkgname}.desktop"
	install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	
	ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-eap"
}