# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=discord-electron-openasar
_pkgname=discord
pkgver=0.0.65+828
_pkgver=${pkgver%%+*}
pkgrel=1
_electronver=32
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
makedepends=('git' 'asar' 'nodejs' 'curl')
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
	"git+https://github.com/goosemod/openasar.git#commit=5c875eb048e96543f1ec711fae522ace5e4a836c")
sha512sums=('48a6d9d4939babe7b7243ae465e592baac357ed6a79513be3e78a78bbc7c5ce4b22bdb6edae31d43f2adb3e578d9a7ecb9b4fb62aed63da84d20e1daede4fc8e'
            '4497ff3df7e2c1e72eea09d6f36a80cabeabfd43bb03b0966795d45e10a02ea6b4c10407661092d057435e0d69d75e958a3dbb1dc5971a215ce09547ec56f666'
            'e5b4d549b29b41a71b2d871d69ef6c622bd1daefb52104165ca2f33e82a3ef02cd697bf48ff12d29895bec2da15b6fe603b0b3c93bf503b3169edf2e812038ff'
            '36b7747ec2dad8ddcc84533dbe2013eae7166affd9fdaa3b5c8571faf4e1361fda2aadde719df4d4d18a7da513be51fe8e0726dbf589ebe545a0abc12960bb22')

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
	curl -o LICENSE.html https://discord.com/terms
	curl -o OSS-LICENSES.html https://discord.com/licenses
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
	install -Dm 644 krisp-patcher.py "${pkgdir}"/usr/lib/$_pkgname/

	# install licenses
	install -Dm 644 LICENSE.html "${pkgdir}"/usr/share/licenses/$_pkgname/LICENSE.html
	install -Dm 644 OSS-LICENSES.html "${pkgdir}"/usr/share/licenses/$_pkgname/OSS-LICENSES.html
}
