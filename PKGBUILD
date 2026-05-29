# Maintainer: Rain Xelelo <rxelelo@outlook.com>
# Co-Maintainer: jofir

_pkgname=BestClient
pkgname=bestclient
pkgver=1.7.1
pkgrel=5
pkgdesc="DDRaceNetwork modification that adds new feauters"
arch=('x86_64')
url="https://github.com/RoflikBEST/bestdownload"
license=('custom')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
makedepends=('patchelf')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
install="$pkgname.install"
# _ffmpeg6pkg: bundled FFmpeg 6.x libs from Arch Linux Archive (binary compiled against these)
_ffmpeg6pkg="ffmpeg-2:6.1.1-7-x86_64.pkg.tar.zst"
source=("https://github.com/RoflikBEST/bestdownload/releases/download/v$pkgver/BestClient-linux.tar.xz"
        "$pkgname.png"
        "ffmpeg6::https://archive.archlinux.org/packages/f/ffmpeg/ffmpeg-2%3A6.1.1-7-x86_64.pkg.tar.zst")
sha256sums=('ffe98fc6159789e56241e90e27aa5cf2ab2ec0ac9ebefe8d6c13e6acf566e649'
            'a118504f690407019294b39bea26920e2cddee94c032a1e5fae1ea216c9ea64f'
            'e4c9468bf15c08a4ef2875be99c99261f0769559d92cde7d25acacac5515e9fd')

prepare() {
	mkdir -p $pkgname/game
	cp -r ${srcdir}/$pkgname-*-linux_x86_64/* $pkgname/game
	chmod +x $pkgname/game/DDNet

	# Fix hardcoded CI build path for discord_game_sdk.so and set RPATH=$ORIGIN
	patchelf --replace-needed \
		/home/runner/work/BestClient/BestClient/ddnet-libs/discord/linux/lib64/discord_game_sdk.so \
		discord_game_sdk.so \
		$pkgname/game/DDNet
	patchelf --set-rpath '$ORIGIN' $pkgname/game/DDNet

	# Extract bundled FFmpeg 6.x shared libs from the archived package
	for lib in libavformat.so.60 libavcodec.so.60 libavutil.so.58 libswscale.so.7 libswresample.so.4; do
		bsdtar -xOf "${srcdir}/ffmpeg6" usr/lib/${lib} > $pkgname/game/${lib}
	done
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a $pkgname "$pkgdir/opt/$pkgname"

	# GLEW compat: binary needs 2.2, Arch ships 2.3+
	ln -sf /usr/lib/libGLEW.so "$pkgdir/opt/$pkgname/game/libGLEW.so.2.2"

	install -dm0755 "$pkgdir/usr/bin"
	install -dm0755 "$pkgdir/usr/share/applications/"
	cat >"$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
cd /opt/$pkgname/game
export LD_LIBRARY_PATH="/opt/$pkgname/game\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec ./DDNet "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Name=$_pkgname
StartupNotify=true
TryExec=$pkgname
Exec=$pkgname
Terminal=false
Icon=/opt/$pkgname/$pkgname.png
Type=Application
Categories=Game
EOF
	install -Dm0644 "$srcdir/$pkgname.png" "$pkgdir/opt/$pkgname/$pkgname.png"
}
