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
pkgver=0.0.52
pkgrel=1
_electronver=30
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
sha512sums=('42ff4b59a0dd846f06a297a1a8b5a1e28f37daa6951b4ce597d103492458c5ae90f69545908cd41238c5ed91b249ad2dd9b9cec3ef4feeb9ad22245c692eaa72'
            '9d00f9d2e05c2ba31c930c066f247954700bb0f96f2fc605e61c3973d7dacf962bf372659b71e05e5d8d4e152cc884bf12ec1fb5ecbfc4da55d22ab2591c4c40')

_krisp_b2sum='ef14b1dc86613fdac87e3cd975f020192d9fd4dd5a88e685c3edbb245e343924c75179acb7724d81ae3e5b0b7b5f52d208f3f1a9b1ccd73a7fe06e96662c4e81'

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
	sed -i -e "/resourcesPath = .*;$/d" -e "s|return resourcesPath|return '/usr/lib/${_pkgname}/resources'|" resources/app/common/paths.js
	sed -i -e "s|process.resourcesPath|'/usr/lib/${_pkgname}/resources'|" resources/app/app_bootstrap/buildInfo.js
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
	cp -r ${_pkgname^}/resources "${pkgdir}"/usr/lib/$_pkgname/
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
