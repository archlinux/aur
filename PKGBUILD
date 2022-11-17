# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Stick <stick@stma.is>
# Contributor: johnnyapol <arch@johnnyapol.me>
# Contributor: huyizheng <huyizheng@hotmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>

# Based off the discord_arch_electron_wayland PKGBUILD from Stick
# Based off the discord_arch_electron PKGBUILD from johnnyapol and huyizheng
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00)

pkgname=discord-electron-bin
_pkgname=discord
_electron=13
#_electron=19
pkgver=0.0.21
pkgrel=2
pkgdesc="Discord using system provided electron (v${_electron}) for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
depends=("electron${_electron}")
makedepends=('asar' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'xdg-utils: Open files'
)
source=("https://dl.discordapp.net/apps/linux/${pkgver}/discord-${pkgver}.tar.gz")
sha512sums=('149ae5b8b7d92549e12eca52e45d3f5761ef022ae321cf33fadc3b56c4cee0616a5166380faea038256213713a7aa90e1befc4caa3e6a4de8e15c1cb1d8f925d')

_tarname='Discord'

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
	sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" $_tarname/$_pkgname.desktop
	echo 'Path=/usr/bin' >> $_tarname/$_pkgname.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"${srcdir}"/LICENSE.md
	curl https://discord.com/licenses | html2text >"${srcdir}"/OSS-LICENSES.md

	# use system electron
	asar e $_tarname/resources/app.asar $_tarname/resources/app
	rm $_tarname/resources/app.asar
	sed -i "s|process.resourcesPath|'/usr/lib/${_pkgname}'|" $_tarname/resources/app/app_bootstrap/buildInfo.js
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" $_tarname/resources/app/app_bootstrap/autoStart/linux.js
	sed -i "s#^module\.paths.*;#module.paths = [(process.env.XDG_CONFIG_HOME || (process.env.HOME + \"/.config\")) + \"/discord/$pkgver/modules\"];#" Discord/resources/app/app_bootstrap/requireNative.js
	asar p $_tarname/resources/app $_tarname/resources/app.asar --unpack-dir '**'
	rm -rf $_tarname/resources/app
}

package() {
	# create necessary directories
	install -d "${pkgdir}"/usr/{lib/$_pkgname,bin}
	install -d "${pkgdir}"/usr/share/{pixmaps,applications,licenses/$_pkgname}

	# copy relevant data
	cp -r $_tarname/resources/* "${pkgdir}"/usr/lib/$_pkgname/

	# install the binary
	install -Dm 755 discord-launcher.sh "${pkgdir}"/usr/bin/$_pkgname

	cp $_tarname/$_pkgname.png \
		"${pkgdir}"/usr/share/pixmaps/$_pkgname.png
	cp $_tarname/$_pkgname.desktop \
		"${pkgdir}"/usr/share/applications/$_pkgname.desktop

	# license
	install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/$_pkgname/
	install -Dm 644 OSS-LICENSES.md "${pkgdir}"/usr/share/licenses/$_pkgname/
}
