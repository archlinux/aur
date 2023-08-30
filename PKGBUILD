# Maintainer: Manuel Hüsers <aur@huesers.de>

# Based off the discord_arch_electron_wayland PKGBUILD from Stick
# Based off the discord_arch_electron PKGBUILD from johnnyapol, huyizheng, Thaodan and Zoddo
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00)

pkgname=discord-electron-openasar
_pkgname=discord
_electron=24
pkgver=0.0.29+812
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
	'libappindicator-gtk3: Systray indicator support'
	'xdg-utils: Open files'
	'rizin: Allow patching Krisp support'
)
source=("https://dl.discordapp.net/apps/linux/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
	'discord-launcher.sh'
	"git+https://github.com/goosemod/openasar.git#commit=85220650bde84ff1b27f496da5d7a9cbc995874c")
sha512sums=('38e4c21872fdf7b7716680b70e6f677274be50fce04d16831ed180d894965ca2f8cc8814148e16ca540f8dcba2bb749788f6980180f51d8b1f1556e1a8a368e0'
            'b0961f546a4016e24d516c6d1125c1af0e8ca84ab960f6abe10ec98c2c18543da2168ffb2676189ed110e9abbdb889abfb2c610954019250041a0a89b0b03bab'
            'SKIP')

_krisp_b2sum='09db0a3b1e736049f39d8fb6c726b6468e725e503dc9109ebb17930d68007cc3818c7123ad836c36df704da9c803f944b77b3412a1b0418552c87be56ed11604'

# just in case I get the version wrong
pkgver() {
	cd "${srcdir}/openasar"
	printf "%s+%s" "$_pkgver" "$(git rev-list --count HEAD)"
}

prepare() {
	# prepare launcher script
	sed -i "s|@PKGNAME@|${_pkgname}|g;s|@PKGVER@|${_pkgver}|g;s|@ELECTRON@|${_electron}|g;s|@KRISPB2@|${_krisp_b2sum}|g" discord-launcher.sh

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"${srcdir}"/LICENSE.md
	curl https://discord.com/licenses | html2text >"${srcdir}"/OSS-LICENSES.md
}

build() {
	cd "${srcdir}"/openasar

	# pack openasar
	sed -i -e "s/nightly/nightly-$(git rev-parse HEAD | cut -c 1-7)/" src/index.js
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
