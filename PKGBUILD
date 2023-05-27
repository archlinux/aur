# Maintainer: Manuel Hüsers <aur@huesers.de>

# Based off the discord_arch_electron_wayland PKGBUILD from Stick
# Based off the discord_arch_electron PKGBUILD from johnnyapol, huyizheng, Thaodan and Zoddo
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00)

pkgname=discord-electron-openasar
_pkgname=discord
_electron=22
pkgver=0.0.27+809
_pkgver=${pkgver%%+*}
pkgrel=2
pkgdesc="Discord packaged with OpenAsar using system provided electron (v${_electron}) for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
install="$pkgname.install"
depends=("electron${_electron}" 'libxss')
makedepends=('git' 'asar' 'nodejs' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'xdg-utils: Open files'
)
source=("https://dl.discordapp.net/apps/linux/${_pkgver}/discord-${_pkgver}.tar.gz"
	'discord-launcher.sh'
	"git+https://github.com/goosemod/openasar.git#commit=a8b07392808032f95ac3a7c5856e76d2619c91ae")
sha512sums=('285a0119b4740402a3fa94d3679a52bc8d883413ee32187e90087960a4d34aaf316788d2708bbccafe3f995c2b99767b45bc4b7c731704ef887a8de1b3d3926f'
            'd8c531d23014611b1e9dfa2d268747ba601f647c2cbfc26c15c9eebcec6f9feb454d10c6f603b9938e8da568da3080372b14309e966e0d00c0e1284a14591a83'
            'SKIP')

# just in case I get the version wrong
pkgver() {
	cd "${srcdir}/openasar"
	printf "%s+%s" "$_pkgver" "$(git rev-list --count HEAD)"
}

prepare() {
	# prepare launcher and install script
	sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" discord-launcher.sh

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

	cd "${srcdir}/openasar"

	# pack openasar
	sed -i -e "s/nightly/nightly-$(git rev-parse HEAD | cut -c 1-7)/" src/index.js
	node scripts/strip.js
	asar p src app.asar

	cd "${srcdir}/Discord"

	# copy relevant data
	cp -r resources/* "${pkgdir}"/usr/lib/$_pkgname/
	cp $_pkgname.png \
		"${pkgdir}"/usr/share/pixmaps/$_pkgname.png
	cp $_pkgname.desktop \
		"${pkgdir}"/usr/share/applications/$_pkgname.desktop

	cd "${srcdir}"

	# copy openasar
	install -Dm 644 openasar/app.asar "${pkgdir}"/usr/lib/$_pkgname/

	# install the launch script
	install -Dm 755 discord-launcher.sh "${pkgdir}"/usr/bin/$_pkgname

	# install licenses
	install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/$_pkgname/
	install -Dm 644 OSS-LICENSES.md "${pkgdir}"/usr/share/licenses/$_pkgname/
}
