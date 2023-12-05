# Maintainer: Manuel Hüsers <aur@huesers.de>

# Based off the discord_arch_electron_wayland PKGBUILD from Stick
# Based off the discord_arch_electron PKGBUILD from johnnyapol, huyizheng, Thaodan and Zoddo
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00)

pkgname=discord-electron-openasar
_pkgname=discord
pkgver=0.0.37+824
_pkgver=${pkgver%%+*}
pkgrel=1
_electronver=24
_electronname="electron${_electronver}"
pkgdesc="Discord packaged with OpenAsar using system provided electron (v${_electronver}) for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
install="$pkgname.install"
depends=("${_electronname}" 'libxss' 'unzip')
makedepends=('git' 'asar' 'nodejs' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'libappindicator-gtk3: Systray indicator support'
	'xdg-utils: Open files'
	'rizin: Allow patching Krisp support'
)
source=("https://dl.discordapp.net/apps/linux/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
	'discord-launcher.sh'
	"git+https://github.com/goosemod/openasar.git#commit=9f68f8dcb61a5c0c469930aab504dd03aa05f060")
sha512sums=('495969155a99364a22fef5d830adec5c03c25ac118d560b1e346fa9190866f9a038c07664124f8f835b77ba4e4d2a268a8eab86dea54274de4904ec374a2c005'
            '723250b70c7f5367701675c6581e9eac2143263910c4ffc35957a6ab858492c5febe89ea0d46fce19ac1416c23d9ca3953e48b9db5aa174b4a401fb6efa5daf5'
            'SKIP')

_krisp_b2sum='189a812d6947da0cc1998de9f4e7f9ed98f145dd0b53261d0cc6c2a9c463a8b978eed0ea92b7c01a861d5ee1a0e503dde7b637b35859b041536f7f2820f11da7'

# just in case I get the version wrong
pkgver() {
	cd "${srcdir}/openasar"
	printf "%s+%s" "$_pkgver" "$(git rev-list --count HEAD)"
}

prepare() {
	# prepare launcher script
	sed -i -e "s|@PKGNAME@|${_pkgname}|g" \
		-e "s|@PKGVER@|${_pkgver}|g" \
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
	cd "${srcdir}"/openasar

	# pack openasar
	sed -i -e "s|nightly|nightly-$(git rev-parse HEAD | cut -c 1-7)|" src/index.js
	sed -i -e "s|^Exec=\${exec}$|Exec=/usr/bin/${_pkgname}|" \
		-e "s|^Name=\${basename(exec)}$|Name=${_pkgname^}|" src/autoStart.js
	node scripts/strip.js
	asar p src app.asar
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

	# overwrite Discord asar
	install -Dm 644 openasar/app.asar "${pkgdir}"/usr/lib/$_pkgname/

	# install the launch script
	install -Dm 755 discord-launcher.sh "${pkgdir}"/usr/bin/$_pkgname

	# install licenses
	install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/$_pkgname/
	install -Dm 644 OSS-LICENSES.md "${pkgdir}"/usr/share/licenses/$_pkgname/
}
