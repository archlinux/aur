# Maintainer: Rain Xelelo <rxelelo@outlook.com>
# Co-Maintainer: jofir

_pkgname=BestClient
pkgname=bestclient
pkgver=1.7.1
pkgrel=7
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
# FFmpeg 6.1.1 bundled from Arch Linux Archive — binary was compiled against these ABI versions
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

	# Fix hardcoded CI build path for discord_game_sdk.so
	patchelf --replace-needed \
		/home/runner/work/BestClient/BestClient/ddnet-libs/discord/linux/lib64/discord_game_sdk.so \
		discord_game_sdk.so \
		$pkgname/game/DDNet

	# Set RPATH=$ORIGIN so bundled libs are found before system libs
	patchelf --set-rpath '$ORIGIN' $pkgname/game/DDNet

	# Extract REAL (non-symlink) FFmpeg 6.x .so files from Arch archive
	# bsdtar -xOf doesn't resolve symlinks correctly, so we use actual versioned filenames
	local _ffdir="${srcdir}/ffmpeg6-extract"
	mkdir -p "$_ffdir"
	bsdtar -xf "${srcdir}/ffmpeg6" -C "$_ffdir" \
		"usr/lib/libavformat.so.60.16.100" \
		"usr/lib/libavcodec.so.60.31.102" \
		"usr/lib/libavutil.so.58.29.100" \
		"usr/lib/libswscale.so.7.5.100" \
		"usr/lib/libswresample.so.4.12.100"

	install -m755 "$_ffdir/usr/lib/libavformat.so.60.16.100"  $pkgname/game/
	install -m755 "$_ffdir/usr/lib/libavcodec.so.60.31.102"   $pkgname/game/
	install -m755 "$_ffdir/usr/lib/libavutil.so.58.29.100"    $pkgname/game/
	install -m755 "$_ffdir/usr/lib/libswscale.so.7.5.100"     $pkgname/game/
	install -m755 "$_ffdir/usr/lib/libswresample.so.4.12.100" $pkgname/game/

	# Versioned symlinks — these are the sonames the DDNet binary references
	ln -sf libavformat.so.60.16.100  $pkgname/game/libavformat.so.60
	ln -sf libavcodec.so.60.31.102   $pkgname/game/libavcodec.so.60
	ln -sf libavutil.so.58.29.100    $pkgname/game/libavutil.so.58
	ln -sf libswscale.so.7.5.100     $pkgname/game/libswscale.so.7
	ln -sf libswresample.so.4.12.100 $pkgname/game/libswresample.so.4

	# Patch bundled FFmpeg .so soname references to match system library versions.
	# The bundled libs were compiled against older sonames; we redirect them to
	# the system versions already present on Arch. DDNet itself does not use these
	# codec libraries directly — they are pulled in transitively by libavformat/libavcodec.
	local _avfmt="$pkgname/game/libavformat.so.60.16.100"
	local _avcod="$pkgname/game/libavcodec.so.60.31.102"

	# libavformat.so.60 needs
	patchelf --replace-needed libxml2.so.2     libxml2.so.16   "$_avfmt"
	patchelf --replace-needed libbluray.so.2   libbluray.so.3  "$_avfmt"

	# libavcodec.so.60 needs
	patchelf --replace-needed libvpx.so.9           libvpx.so.12        "$_avcod"
	patchelf --replace-needed libjxl.so.0.10        libjxl.so.0.11      "$_avcod"
	patchelf --replace-needed libjxl_threads.so.0.10 libjxl_threads.so.0.11 "$_avcod"
	patchelf --replace-needed librav1e.so.0.7       librav1e.so.0.8     "$_avcod"
	patchelf --replace-needed libSvtAv1Enc.so.2     libSvtAv1Enc.so.4   "$_avcod"
	patchelf --replace-needed libtheoraenc.so.1     libtheoraenc.so.2   "$_avcod"
	patchelf --replace-needed libtheoradec.so.1     libtheoradec.so.2   "$_avcod"
	patchelf --replace-needed libx264.so.164        libx264.so.165      "$_avcod"
	patchelf --replace-needed libx265.so.199        libx265.so.215      "$_avcod"
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
