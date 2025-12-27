# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname="sklauncher"
pkgname="${_pkgname}-bin"

pkgdesc="Secure and modern Minecraft Launcher"

pkgver=3.2.18
pkgrel=1

arch=(any)

url="https://skmedix.pl"
license=(Apache-2.0 LicenseRef-SKlauncher)

depends=("java-runtime>=17")
makedepends=(unzip gendesk)
provides=("${_pkgname}=${pkgver}")

install="${_pkgname}.install"

source=("${url}/binaries/skl/${pkgver}/SKlauncher-${pkgver}.jar" "${_pkgname}" "LICENSE.${_pkgname}")
md5sums=("8a65e7d4f9fe599486d06199495671b7" "b2df5498d1c951307ed1d5618445c2ee" "edd0f7efa3df3a5cadaa2ecebf9eb57d")

noextract=("SKlauncher-${pkgver}.jar")

prepare() {
	# extract the logo out of the JAR file
	unzip -o -j "SKlauncher-${pkgver}.jar" logo.png -d .

	# generate a .desktop file
	gendesk -f -n \
		--pkgname SKlauncher \
		--pkgdesc "${pkgdesc}" \
		--exec "${_pkgname}" \
		--icon "${_pkgname}" \
		--categories "Game;Simulation"
}

package() {
	# copy the JAR file
	install -Dm755 "SKlauncher-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/SKlauncher.jar"

	# copy the executable script
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 SKlauncher.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# copy the terms of service
	install -Dm644 "LICENSE.${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
