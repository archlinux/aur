# Maintainer: Stick <stick@stma.is>
# Contributors: johnnyapol (arch@johnnyapol.me), huyizheng
# Based off the discord_arch_electron PKGBUILD from johnnyapol and huyizheng
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

# Staying on Electron13 for now due to this bug:
# https://github.com/electron/electron/issues/32487

pkgname=discord_arch_electron_wayland
pkgver=0.0.18
pkgrel=1
pkgdesc="Discord (popular voice + video app) using system electron (v13) and set up for wayland"
arch=('x86_64')
provides=('discord')
conflicts=('discord')
url='https://discordapp.com'
license=('custom')
depends=('electron13')
makedepends=('asar' 'curl' 'python-html2text')
optdepends=(
	'libpulse: Pulseaudio support'
	'xdg-utils: Open files'
)
source=("https://dl.discordapp.net/apps/linux/$pkgver/discord-$pkgver.tar.gz")
sha256sums=('0417389fa437c6e044d77252de0cffe8473074e596e7b34ba76b1a3a5c0e80c2')

prepare() {
	# create launcher script
	cat >"$srcdir"/discord-launcher.sh <<'EOF'
#!/bin/sh

if [ "$XDG_SESSION_TYPE" = wayland ]; then
	# Using wayland
	exec electron13 --enable-features=UseOzonePlatform \
		--ozone-platform=wayland /usr/lib/discord/app.asar \$@
else
	# Using x11
	exec electron13 /usr/lib/discord/app.asar \$@
fi
EOF

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/discord|" Discord/discord.desktop
	echo 'Path=/usr/bin' >>Discord/discord.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"$srcdir"/LICENSE.md
	curl https://discord.com/licenses | html2text >"$srcdir"/OSS-LICENSES.md

	# use system electron13
	asar e Discord/resources/app.asar Discord/resources/app
	rm Discord/resources/app.asar
	sed -i "s|process.resourcesPath|'/usr/lib/discord'|" Discord/resources/app/app_bootstrap/buildInfo.js
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" Discord/resources/app/app_bootstrap/autoStart/linux.js
	asar p Discord/resources/app Discord/resources/app.asar --unpack-dir '**'
	rm -rf Discord/resources/app
}

package() {
	# create necessary directories
	install -d "$pkgdir"/usr/{lib/discord,bin}
	install -d "$pkgdir"/usr/share/{pixmaps,applications,licenses/discord}

	# copy relevant data
	cp -r Discord/resources/* "$pkgdir"/usr/lib/discord/

	# install the binary
	install -Dm 755 discord-launcher.sh "$pkgdir"/usr/bin/discord

	cp Discord/discord.png \
		"$pkgdir"/usr/share/pixmaps/discord.png
	cp Discord/discord.desktop \
		"$pkgdir"/usr/share/applications/discord.desktop

	# license
	install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/discord/
	install -Dm 644 OSS-LICENSES.md "$pkgdir"/usr/share/licenses/discord/
}
