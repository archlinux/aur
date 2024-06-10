# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=discord-electron-openasar
_pkgname=discord
pkgver=0.0.55+827
_pkgver=${pkgver%%+*}
pkgrel=3
_electronver=30
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
	'python-pyelftools: Required for Krisp patcher'
	'python-capstone: Required for Krisp patcher'
)
source=("https://dl.discordapp.net/apps/linux/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
	'discord-launcher.sh'
	'krisp-patcher.py' # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
	"git+https://github.com/goosemod/openasar.git#commit=4f264d860a5a6a32e1862ce26178b9cf6402335d")
sha512sums=('c12365109cb4db94033fda101073d2a3d6af7bdc9728e025494ee8d44ebf5f27623861879ec38bb7dd88d40de7cddede268e0f5e44bfeb586fc12713a3758c5b'
            '4497ff3df7e2c1e72eea09d6f36a80cabeabfd43bb03b0966795d45e10a02ea6b4c10407661092d057435e0d69d75e958a3dbb1dc5971a215ce09547ec56f666'
            '3c1021592fa856f3561072c76b5ee0b5a34a53bc230336e6d36827efb4866c9d801ef7abb24650d3a7210c61dd57f35e2812ae89226fc157cc8d9ffce032155f'
            '055bbe5fbc63a715ab8357db8aabacad282e3d176b48e322d7133a5887291577687456bbfaf7b832d19f13b1a5a373e2c0f6f82664887509feb3c193ee4f1849')

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
	sed -i -e "/config.setup = true/a\  config.autoupdate = false;" src/config/index.js
	sed -i -e "s|process.resourcesPath|'/usr/lib/${_pkgname}/resources'|" src/utils/buildInfo.js
	sed -i -e "s|^Exec=\${exec}$|Exec=/usr/bin/${_pkgname}|" \
		-e "s|^Name=\${basename(exec)}$|Name=${_pkgname^}|" src/autoStart.js
	node scripts/strip.js
	asar p src app.asar
}

package() {
	# create necessary directories
	install -d "${pkgdir}"/usr/lib/$_pkgname

	# copy relevant data
	cp -r ${_pkgname^}/resources "${pkgdir}"/usr/lib/$_pkgname/

	# intall icon and desktop file
	install -Dm 644 ${_pkgname^}/$_pkgname.png "${pkgdir}"/usr/share/pixmaps/$_pkgname.png
	install -Dm 644 ${_pkgname^}/$_pkgname.desktop "${pkgdir}"/usr/share/applications/$_pkgname.desktop

	# overwrite Discord asar
	install -Dm 644 openasar/app.asar "${pkgdir}"/usr/lib/$_pkgname/resources/

	# install the launch script
	install -Dm 755 discord-launcher.sh "${pkgdir}"/usr/bin/$_pkgname

	# install krisp patcher
	install -Dm 644 krisp-patcher.py "${pkgdir}"/usr/lib/${_pkgname}/

	# install licenses
	install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/$_pkgname/LICENSE.md
	install -Dm 644 OSS-LICENSES.md "${pkgdir}"/usr/share/licenses/$_pkgname/OSS-LICENSES.md
}
