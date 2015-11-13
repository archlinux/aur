# Maintainer: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=143.595
_pkgver=5.0.1
_eap="False"
pkgver="${_pkgver}.${_buildver}"
pkgrel=2
pkgdesc="Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition."
arch=('any')
options=('!strip')
url="http://www.jetbrains.com/pycharm/"
license=("custom")
depends=("java-environment>=6")
makedepends=("wget")
provides=("pycharm-professional")
conflicts=("pycharm-professional" "pycharm-pro-eap")

if [[ "True" = "${_eap}" ]]; then
	_srcfile="pycharm-professional-${_buildver}.tar.gz"
	source=("http://download.jetbrains.com/python/${_srcfile}"
			"${pkgname}.desktop")
	sha256sums=$(wget -q "${source}.sha256" && cat "${_srcfile}.sha256" | cut -f1 -d" ")
else
	_srcfile="pycharm-professional-${_pkgver}.tar.gz"
	source=("http://download.jetbrains.com/python/${_srcfile}"
			"${pkgname}.desktop")
	sha256sums=$(wget -q "${source}.sha256" && cat "${_srcfile}.sha256" | cut -f1 -d" ")
fi


package() {
	cd "${srcdir}"
	install -dm 755 \
		"${pkgdir}/opt/${pkgname}" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"

	wget "https://www.jetbrains.com/pycharm/buy/license.pdf"
	install -Dm644 license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/PyCharm_license.txt"

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
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	
	ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-eap"
}

