pkgname=discord-canary-electron-wayland-bin
_pkgname=discord-canary
pkgver=0.0.134
pkgrel=1
pkgdesc="Discord (popular voice + video app) using system electron (v13) and set up for wayland"
arch=('x86_64')
provides=('discord-canary')
conflicts=('discord-canary')
url='https://canary.discordapp.com'
license=('custom')
depends=('electron13' 'gtk3' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'xdg-utils' 'libcups')
makedepends=('asar' 'curl' 'python-html2text')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'noto-fonts-emoji: Google font for emoji support.'
            'ttf-symbola: Font for emoji support.'
            'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')

sha512sums=('c2c35c5152b7bc67ce144cbaa957cd25799a5d986da5ba9fe9e1193c369499024c16c05a86c281746886b53de40d3a802a35c1c5b214225e2183c0faa58aa9d9'
            'SKIP'
            'SKIP')
prepare() {
	# create launcher script
	cat >>"$srcdir"/discord-canary <<'EOF'
#!/bin/sh

if [ "$(loginctl show-session "$XDG_SESSION_ID" -p Type --value)" = wayland ]; then
	# Using wayland
	exec electron13 --enable-features=UseOzonePlatform \
		--ozone-platform=wayland /usr/lib/discord-canary/resources/app.asar \$@
else
	# Using x11
	exec electron13 /usr/lib/discord-canary/resources/app.asar \$@
fi
EOF

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/discord-canary|" DiscordCanary/discord-canary.desktop
	echo 'Path=/usr/bin' >> DiscordCanary/discord-canary.desktop

	# create the license files
	curl https://discord.com/terms | html2text >"$srcdir"/LICENSE.md
	curl https://discord.com/licenses | html2text >"$srcdir"/OSS-LICENSES.md

	# use system electron version 13
	asar e DiscordCanary/resources/app.asar DiscordCanary/resources/app
	rm DiscordCanary/resources/app.asar
	sed -i "s|process.resourcesPath|'/usr/lib/discord-canary/resources'|" DiscordCanary/resources/app/app_bootstrap/buildInfo.js
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" DiscordCanary/resources/app/app_bootstrap/autoStart/linux.js
        asar p DiscordCanary/resources/app DiscordCanary/resources/app.asar
        rm -rf DiscordCanary/resources/app
}

package() {
	# create necessary directories
	install -d "$pkgdir"/usr/{lib/discord-canary,bin}
	install -d "$pkgdir"/usr/share/{pixmaps,applications,licenses/discord}

	# copy relevant data
	cp -r DiscordCanary/resources "$pkgdir"/usr/lib/discord-canary/
	# install the binary
	install -Dm 755 discord-canary "$pkgdir"/usr/bin/discord-canary

	cp DiscordCanary/discord.png \
		"$pkgdir"/usr/share/pixmaps/discord.png
	cp DiscordCanary/discord-canary.desktop \
		"$pkgdir"/usr/share/applications/discord-canary.desktop

	# license
	install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/discord/
	install -Dm 644 OSS-LICENSES.md "$pkgdir"/usr/share/licenses/discord/
}
