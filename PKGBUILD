# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Stick <stick@stma.is>
# Contributor: johnnyapol <arch@johnnyapol.me>
# Contributor: huyizheng <huyizheng@hotmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>

# Based off the discord_arch_electron_wayland PKGBUILD from Stick
# Based off the discord_arch_electron PKGBUILD from johnnyapol, huyizheng, Thaodan and Zoddo
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00)

pkgname=discord-electron
_pkgname=discord
pkgver=0.0.45
pkgrel=1
_electronver=28
_electronname="electron${_electronver}"
pkgdesc="Discord using system provided electron (v${_electronver}) for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
install="$pkgname.install"
depends=("${_electronname}" 'libxss')
makedepends=('asar' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'libappindicator-gtk3: Systray indicator support'
	'xdg-utils: Open files'
	'rizin: Allow patching Krisp support'
)
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	'discord-launcher.sh')
sha512sums=('e2a64eed20267e40b1bc068166a8bfcb76211da12381ff43dfddcb250050901f0a4dd1db2f4c9ed4fc5618fcddef02a13d3cefc452801d7c8f674cf029dd7422'
            'ceaeb357a84df0695fe65867f81d2fa35a65a6f47f47a29022e09fa15cc816b3e250f63eee1025388f51665e6bc39262de7cb7a137f25caf1d922bbacd217566')

_krisp_b2sum='8b2f34f116c35eaa417bf2585f7d80bd394791c01ffc4a5761670fe3c6323c9560e6357d787f29adb56c20342b5b400e1103bc28257fb0a70e207e1d2070f2d4'

prepare() {
	# prepare launcher script
	sed -i -e "s|@PKGNAME@|${_pkgname}|g" \
		-e "s|@PKGVER@|${pkgver}|g" \
		-e "s|@ELECTRON@|${_electronname}|g" \
		-e "s|@KRISPB2@|${_krisp_b2sum}|g" \
		discord-launcher.sh

	# fix the .desktop file
	sed -i -e "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"${srcdir}"/LICENSE.md
	curl https://discord.com/licenses | html2text >"${srcdir}"/OSS-LICENSES.md
}

build() {
	cd "${srcdir}"/${_pkgname^}

	# use system electron
	asar e resources/app.asar resources/app
	rm resources/app.asar
	sed -i -e "/resourcesPath = .*;$/d" -e "s|return resourcesPath|return '/usr/lib/${_pkgname}'|" resources/app/common/paths.js
	sed -i -e "s|process.resourcesPath|'/usr/lib/${_pkgname}'|" resources/app/app_bootstrap/buildInfo.js
	sed -i -e "/^const appName/d" -e "/^const exePath/d" -e "/^const exeDir/d" -e "/^const iconPath/d" \
		-e "s|^Exec=\${exePath}$|Exec=/usr/bin/${_pkgname}|" \
		-e "s|^Name=\${appName}$|Name=${_pkgname^}|" \
		-e "s|^Icon=\${iconPath}$|Icon=/usr/share/pixmaps/${_pkgname}.png|" \
		resources/app/app_bootstrap/autoStart/linux.js
	asar p resources/app resources/app.asar
	rm -rf resources/app
}

package() {
	# create necessary directories
	install -d "${pkgdir}"/usr/{lib/$_pkgname,bin}
	install -d "${pkgdir}"/usr/share/{pixmaps,applications,licenses/$_pkgname}

	# copy relevant data
	cp -r ${_pkgname^}/resources/* "${pkgdir}"/usr/lib/$_pkgname/
	cp ${_pkgname^}/$_pkgname.png \
		"${pkgdir}"/usr/share/pixmaps/$_pkgname.png
	cp ${_pkgname^}/$_pkgname.desktop \
		"${pkgdir}"/usr/share/applications/$_pkgname.desktop

	# install the launch script
	install -Dm 755 discord-launcher.sh "${pkgdir}"/usr/bin/$_pkgname

	# install licenses
	install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/$_pkgname/
	install -Dm 644 OSS-LICENSES.md "${pkgdir}"/usr/share/licenses/$_pkgname/
}
