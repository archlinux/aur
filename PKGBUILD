# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=openhardwaremonitor-git
pkgver=0.8.0.r8.ge199e0c
pkgrel=4
pkgdesc="An open source program that monitors temperature sensors, fan speeds, voltages, load and clock speeds of a computer."
arch=('any')
url="http://openhardwaremonitor.org/"
license=('custom')
depends=('mono')
makedepends=('unzip')
optdepends=()
provides=('openhardwaremonitor')
conflicts=('openhardwaremonitor')
source=("${pkgname}::git+https://github.com/openhardwaremonitor/openhardwaremonitor.git"
		"fix-copy-commands.patch"
		"LICENSE"
		"openhardwaremonitor.desktop"
		"openhardwaremonitor.png")
sha256sums=('SKIP'
            '31bcfc30d137158244766d52431c0f454f3508c258cd7baa34bffe4781579d42'
            'ff9c551e5f175a751ac49a0dbb591a213f9180adf88da88cd777bb110aa2241f'
            '182a37eb59edb4f4578a6db2a06c4796b50102ab30e762223ebbe049088a8958'
            '7b4a03c97797fe5b10475a2b01f434085175bf9599c00c30beb310206b97c92a')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "${srcdir}/${pkgname}"

	patch -Np1 -i "${srcdir}/fix-copy-commands.patch"
}

build() {
	cd "${srcdir}/${pkgname}"

	xbuild OpenHardwareMonitor.sln /p:Configuration=Release "/p:Platform=Any CPU"
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d -m755 "${pkgdir}/opt"
	cp -a "${srcdir}/${pkgname}/Bin/Release" "${pkgdir}/opt/${pkgname}"
	touch "${pkgdir}/opt/${pkgname}/OpenHardwareMonitor.config"
	chmod 666 "${pkgdir}/opt/${pkgname}/OpenHardwareMonitor.config"

	# The license should be in /usr/share/licenses.
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# Desktop file
	install -D -m644 "${srcdir}/${pkgname%%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%%-git}.desktop"
	install -D -m644 "${srcdir}/${pkgname%%-git}.png" "${pkgdir}/opt/${pkgname}/${pkgname%%-git}.png"
}
