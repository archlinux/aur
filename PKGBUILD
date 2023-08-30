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
_electron=24
pkgver=0.0.29
pkgrel=2
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
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	'discord-launcher.sh')
sha512sums=('38e4c21872fdf7b7716680b70e6f677274be50fce04d16831ed180d894965ca2f8cc8814148e16ca540f8dcba2bb749788f6980180f51d8b1f1556e1a8a368e0'
            'b0961f546a4016e24d516c6d1125c1af0e8ca84ab960f6abe10ec98c2c18543da2168ffb2676189ed110e9abbdb889abfb2c610954019250041a0a89b0b03bab')

_krisp_b2sum='09db0a3b1e736049f39d8fb6c726b6468e725e503dc9109ebb17930d68007cc3818c7123ad836c36df704da9c803f944b77b3412a1b0418552c87be56ed11604'

prepare() {
	# prepare launcher script
	sed -i "s|@PKGNAME@|${_pkgname}|g;s|@PKGVER@|${pkgver}|g;s|@ELECTRON@|${_electron}|g;s|@KRISPB2@|${_krisp_b2sum}|g" discord-launcher.sh

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"${srcdir}"/LICENSE.md
	curl https://discord.com/licenses | html2text >"${srcdir}"/OSS-LICENSES.md
}

build() {
	cd "${srcdir}"/${_pkgname^}

	# use system electron
	asar e resources/app.asar resources/app
	rm resources/app.asar
	sed -i "s|process.resourcesPath|'/usr/lib/${_pkgname}'|" resources/app/app_bootstrap/buildInfo.js
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" resources/app/app_bootstrap/autoStart/linux.js
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
