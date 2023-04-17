# Maintainer: Manuel Hüsers <aur@huesers.de>

# Based off the discord_arch_electron_wayland PKGBUILD from Stick
# Based off the discord_arch_electron PKGBUILD from johnnyapol and huyizheng
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00)

pkgname=discord-electron-openasar
_pkgname=discord
_electron=22
pkgver=0.0.26+803
_pkgver=${pkgver%%+*}
pkgrel=2
pkgdesc="Discord packaged with OpenAsar using system provided electron (v${_electron}) for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
depends=("electron${_electron}")
makedepends=('git' 'asar' 'nodejs' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'xdg-utils: Open files'
)
source=("https://dl.discordapp.net/apps/linux/${_pkgver}/discord-${_pkgver}.tar.gz"
	"git+https://github.com/goosemod/openasar.git#commit=20b5fa3165ca5c83629075a059a050e83130eb89")
sha512sums=('65477c2c033f30850a699706a6502ff4f4af8838185716d968d641fdab3033555139b04bf91a111a847aca14113e33ba6248d49ba317fd43cbacb099e974117b'
            'SKIP')

# just in case I get the version wrong
pkgver() {
	cd "${srcdir}/openasar"
	printf "%s+%s" "$_pkgver" "$(git rev-list --count HEAD)"
}

prepare() {
	# create launcher script
	cat >> "${srcdir}"/discord-launcher.sh <<EOF
#!/bin/sh

if [ "\$XDG_SESSION_TYPE" = wayland ]; then
	# Using wayland
	exec electron${_electron} \\
		--enable-features=UseOzonePlatform \\
		--ozone-platform=wayland \\
		--enable-accelerated-mjpeg-decode \\
		--enable-accelerated-video \\
		--ignore-gpu-blacklist \\
		--enable-native-gpu-memory-buffers \\
		--enable-gpu-rasterization \\
		--enable-gpu \\
		--enable-features=WebRTCPipeWireCapturer \\
		/usr/lib/discord/app.asar \$@
else
	# Using x11
	exec electron${_electron} \\
		--enable-accelerated-mjpeg-decode \\
		--enable-accelerated-video \\
		--ignore-gpu-blacklist \\
		--enable-native-gpu-memory-buffers \\
		--enable-gpu-rasterization \\
		--enable-gpu \\
		/usr/lib/discord/app.asar \$@
fi
EOF

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" Discord/$_pkgname.desktop
	echo 'Path=/usr/bin' >> Discord/$_pkgname.desktop

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
