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
_electron=22
pkgver=0.0.27
pkgrel=7
pkgdesc="Discord using system provided electron (v${_electron}) for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
install="$pkgname.install"
depends=("electron${_electron}" 'libxss')
makedepends=('asar' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'libappindicator-gtk3: Systray indicator support'
	'xdg-utils: Open files'
	'rizin: Allow patching Krisp support'
)
source=("https://dl.discordapp.net/apps/linux/${pkgver}/discord-${pkgver}.tar.gz"
	'discord-launcher.sh')
sha512sums=('285a0119b4740402a3fa94d3679a52bc8d883413ee32187e90087960a4d34aaf316788d2708bbccafe3f995c2b99767b45bc4b7c731704ef887a8de1b3d3926f'
            '4bbe010c28926ca898ac33da15ce8373060af44e0583e6956671fa2ee8a2a379a88a6ff9b4f886806fc05117428834852ba2e81a9163381c678c240067b7abd0')

_krisp_b2sum='592f55259500afc0d7fd334a10d3c1991fae05db870bf12437edc43cf693988195341f2cb827aba333c0e65fb4cb40dccfcc5d6a84dea4a1645f9563505b6496'

prepare() {
	# prepare launcher script
	sed -i "s|@PKGNAME@|${_pkgname}|g;s|@PKGVER@|${pkgver}|g;s|@ELECTRON@|${_electron}|g;s|@KRISPB2@|${_krisp_b2sum}|g" discord-launcher.sh

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" Discord/$_pkgname.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"${srcdir}"/LICENSE.md
	curl https://discord.com/licenses | html2text >"${srcdir}"/OSS-LICENSES.md
}

package() {
	# create necessary directories
	install -d "${pkgdir}"/usr/{lib/$_pkgname,bin}
	install -d "${pkgdir}"/usr/share/{pixmaps,applications,licenses/$_pkgname}

	cd "${srcdir}/Discord"

	# use system electron
	asar e resources/app.asar resources/app
	rm resources/app.asar
	sed -i "s|process.resourcesPath|'/usr/lib/${_pkgname}'|" resources/app/app_bootstrap/buildInfo.js
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" resources/app/app_bootstrap/autoStart/linux.js
	asar p resources/app resources/app.asar
	rm -rf resources/app

	# copy relevant data
	cp -r resources/* "${pkgdir}"/usr/lib/$_pkgname/
	cp $_pkgname.png \
		"${pkgdir}"/usr/share/pixmaps/$_pkgname.png
	cp $_pkgname.desktop \
		"${pkgdir}"/usr/share/applications/$_pkgname.desktop

	cd "${srcdir}"

	# install the launch script
	install -Dm 755 discord-launcher.sh "${pkgdir}"/usr/bin/$_pkgname

	# install licenses
	install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/$_pkgname/
	install -Dm 644 OSS-LICENSES.md "${pkgdir}"/usr/share/licenses/$_pkgname/
}
