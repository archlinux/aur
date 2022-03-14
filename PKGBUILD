# Maintainer: Stick <stick@stma.is>
# Contributors: johnnyapol (arch@johnnyapol.me), huyizheng
# Based off the discord_arch_electron PKGBUILD from johnnyapol and huyizheng
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

# Staying on Electron13 for now due to this bug:
# https://github.com/electron/electron/issues/32487

pkgname=discord_arch_electron_wayland
_pkgname=discord
pkgver=0.0.17
pkgrel=1
pkgdesc="Discord (popular voice + video app) using system electron (v13) and set up for wayland"
arch=('x86_64')
provides=('discord')
conflicts=('discord')
url='https://discordapp.com'
license=('custom')
depends=('electron13')
makedepends=('asar')
optdepends=(
	'libpulse: Pulseaudio support'
	'xdg-utils: Open files'
)
source=(
	"https://dl.discordapp.net/apps/linux/$pkgver/$_pkgname-$pkgver.tar.gz"
	'LICENSE.html::https://discordapp.com/terms'
	'OSS-LICENSES.html::https://discordapp.com/licenses'
)
sha256sums=(
	'3462732e5d5d9bb75f901f7ca5047782fe2f96576b208ea538c593ba2a031315'
	'50756158704d6f09ca821af21bccb794ab3c9d6dd851134e99187cf1bd4e6322'
	'1305bac53fc05f2efb68907a4447eb92f45817a74297b2e57baf1d880c428bc8'
)

prepare() {
	# create launcher script
	cat >>"$srcdir"/"$_pkgname" <<EOF
#!/bin/sh
exec electron13 --enable-features=UseOzonePlatform --ozone-platform=wayland \
	/usr/lib/$_pkgname/app.asar \$@
EOF

	# fix the .desktop file
	sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" Discord/$_pkgname.desktop
	echo 'Path=/usr/bin' >>Discord/$_pkgname.desktop

	# use system electron version 13
	asar e Discord/resources/app.asar Discord/resources/app
	rm Discord/resources/app.asar
	sed -i "s|process.resourcesPath|'/usr/lib/$_pkgname'|" Discord/resources/app/app_bootstrap/buildInfo.js
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" Discord/resources/app/app_bootstrap/autoStart/linux.js
	asar p Discord/resources/app Discord/resources/app.asar --unpack-dir '**'
	rm -rf Discord/resources/app
}

package() {
	# create necessary directories
	install -d "$pkgdir"/usr/{lib/"$_pkgname",bin,share/{pixmaps,applications}}

	# copy relevanat data
	cp -r Discord/resources/* "$pkgdir"/usr/lib/"$_pkgname"/

	# install the binary
	install -Dm 755 $_pkgname "$pkgdir"/usr/bin/"$_pkgname"

	cp Discord/discord.png \
		"$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	cp Discord/discord.desktop \
		"$pkgdir"/usr/share/applications/"$_pkgname".desktop

	# licenses
	install -Dm 644 LICENSE.html \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
	install -Dm 644 OSS-LICENSES.html \
		"$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
