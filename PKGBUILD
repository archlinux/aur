# Maintainer: Rain Xelelo <rxelelo@outlook.com>
# Co-Maintainer: jofir

_pkgname=BestClient
pkgname=bestclient
pkgver=1.7.1
pkgrel=12
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
#
# BUNDLED LIBRARY RATIONALE
# The BestClient binary was compiled on an older Arch Linux snapshot and links
# against several library ABI versions that no longer match current Arch packages.
# We cannot simply patchelf --replace-needed for libraries whose symbol names embed
# the version number (e.g. x265_api_get_199, ucnv_open_75), nor can we patch away
# GNU_VERSION_R entries (e.g. LIBXML2_2.5.2) without bundling the right soname.
# Therefore we bundle exact old versions from the Arch Linux Archive for:
#   - FFmpeg 6.1.1   (libavformat/libavcodec/libavutil/libswscale/libswresample)
#   - libxml2 2.12.7 (libxml2.so.2 — libavformat GNU_VERSION_R requirement)
#   - libbluray 1.3.4 (libbluray.so.2 — libavformat NEEDED)
#   - ICU 75.1       (libicuuc/libicudata — libxml2.so.2 NEEDED, version-specific symbols)
# All encoder-only codec deps (x264, x265, vpx, rav1e, …) are removed from
# libavcodec with patchelf --remove-needed; FFmpeg's internal decoders suffice
# for the game's video playback use case.
#
source=("https://github.com/RoflikBEST/bestdownload/releases/download/v$pkgver/BestClient-linux.tar.xz"
        "$pkgname.png"
        "ffmpeg6::https://archive.archlinux.org/packages/f/ffmpeg/ffmpeg-2%3A6.1.1-7-x86_64.pkg.tar.zst"
        "libxml2_212::https://archive.archlinux.org/packages/l/libxml2/libxml2-2.12.7-1-x86_64.pkg.tar.zst"
        "libbluray_134::https://archive.archlinux.org/packages/l/libbluray/libbluray-1.3.4-3-x86_64.pkg.tar.zst"
        "icu75::https://archive.archlinux.org/packages/i/icu/icu-75.1-2-x86_64.pkg.tar.zst")
sha256sums=('ffe98fc6159789e56241e90e27aa5cf2ab2ec0ac9ebefe8d6c13e6acf566e649'
            'a118504f690407019294b39bea26920e2cddee94c032a1e5fae1ea216c9ea64f'
            'e4c9468bf15c08a4ef2875be99c99261f0769559d92cde7d25acacac5515e9fd'
            'de624a17b93a72af65c3a7987e94af4b9d0664b1ed279b6fb6fd4a4faf9695d9'
            'e701ff2f681c79eca1663e8b0db52142dc356f35db1ec1bc68198c8a7e7c1d59'
            '328339d8083e175438d75e5172dc882202064918cf3e88c72d1c8e57fff57a23')

prepare() {
	mkdir -p $pkgname/game
	cp -r ${srcdir}/$pkgname-*-linux_x86_64/* $pkgname/game
	chmod +x $pkgname/game/DDNet

	# Fix hardcoded CI build path for discord_game_sdk.so
	patchelf --replace-needed \
		/home/runner/work/BestClient/BestClient/ddnet-libs/discord/linux/lib64/discord_game_sdk.so \
		discord_game_sdk.so \
		$pkgname/game/DDNet

	# Set RPATH=$ORIGIN so bundled libs in /opt/bestclient/game/ are found first
	patchelf --set-rpath '$ORIGIN' $pkgname/game/DDNet

	# ── FFmpeg 6.1.1 ────────────────────────────────────────────────────────────
	# Extract the real (non-symlink) versioned .so files from the archive.
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

	# Soname symlinks (DDNet binary NEEDED entries reference these)
	ln -sf libavformat.so.60.16.100  $pkgname/game/libavformat.so.60
	ln -sf libavcodec.so.60.31.102   $pkgname/game/libavcodec.so.60
	ln -sf libavutil.so.58.29.100    $pkgname/game/libavutil.so.58
	ln -sf libswscale.so.7.5.100     $pkgname/game/libswscale.so.7
	ln -sf libswresample.so.4.12.100 $pkgname/game/libswresample.so.4

	local _avcod="$pkgname/game/libavcodec.so.60.31.102"

	# libavcodec encoder-only deps that are NOT in GNU_VERSION_R (VER_NEED):
	# safe to remove — dynamic linker won't look for them by version.
	# Note: x265/x264/vpx/rav1e/SvtAv1Enc have no VER_NEED entries in libavcodec.
	patchelf --remove-needed libvpx.so.9        "$_avcod"
	patchelf --remove-needed librav1e.so.0.7    "$_avcod"
	patchelf --remove-needed libSvtAv1Enc.so.2  "$_avcod"
	patchelf --remove-needed libx264.so.164     "$_avcod"
	patchelf --remove-needed libx265.so.199     "$_avcod"

	# libtheoraenc.so.1, libtheoradec.so.1, libjxl.so.0.10, libjxl_threads.so.0.10
	# HAVE VER_NEED entries in libavcodec — patchelf --remove-needed would leave
	# orphan VER_NEED entries causing "needed != NULL" assertion in ld.so.
	# Fix: keep them in NEEDED, provide SONAME-patched copies of current system libs.
	# Symbol names are stable across these minor version bumps (no version embedding).
	_make_compat() {
		local old_soname="$1" sys_lib="$2"
		local out="$pkgname/game/${old_soname}"
		cp "$(readlink -f "$sys_lib")" "$out"
		patchelf --set-soname "$old_soname" "$out"
	}
	_make_compat libtheoraenc.so.1      /usr/lib/libtheoraenc.so.2
	_make_compat libtheoradec.so.1      /usr/lib/libtheoradec.so.2
	_make_compat libjxl.so.0.10        /usr/lib/libjxl.so.0.11
	_make_compat libjxl_threads.so.0.10 /usr/lib/libjxl_threads.so.0.11

	# ── libxml2 2.12.7 ──────────────────────────────────────────────────────────
	# libavformat has GNU_VERSION_R entries for LIBXML2_2.5.2 / 2.4.30 / 2.7.3.
	# These cannot be patched out with patchelf; we must provide the exact soname
	# (libxml2.so.2) with those version nodes present.
	local _xml2dir="${srcdir}/libxml2_212-extract"
	mkdir -p "$_xml2dir"
	bsdtar -xf "${srcdir}/libxml2_212" -C "$_xml2dir" "usr/lib/libxml2.so.2.12.7"
	install -m755 "$_xml2dir/usr/lib/libxml2.so.2.12.7" $pkgname/game/
	ln -sf libxml2.so.2.12.7 $pkgname/game/libxml2.so.2

	# ── libbluray 1.3.4 ─────────────────────────────────────────────────────────
	# libavformat NEEDED libluray.so.2. The 1.3.4 package itself links against
	# libxml2.so.16 (system) which is fine, so no further bundling needed for it.
	local _bldir="${srcdir}/libbluray_134-extract"
	mkdir -p "$_bldir"
	bsdtar -xf "${srcdir}/libbluray_134" -C "$_bldir" "usr/lib/libbluray.so.2.4.3"
	install -m755 "$_bldir/usr/lib/libbluray.so.2.4.3" $pkgname/game/
	ln -sf libbluray.so.2.4.3 $pkgname/game/libbluray.so.2

	# ── ICU 75.1 ────────────────────────────────────────────────────────────────
	# libxml2.so.2.12.7 was compiled against libicuuc.so.75 / libicudata.so.75.
	# ICU uses version-embedded symbol names (ucnv_open_75 etc.), so we must
	# bundle the exact ICU 75 libraries rather than redirecting to system ICU 78.
	local _icudir="${srcdir}/icu75-extract"
	mkdir -p "$_icudir"
	bsdtar -xf "${srcdir}/icu75" -C "$_icudir" \
		"usr/lib/libicuuc.so.75.1" \
		"usr/lib/libicudata.so.75.1"
	install -m755 "$_icudir/usr/lib/libicuuc.so.75.1"   $pkgname/game/
	install -m755 "$_icudir/usr/lib/libicudata.so.75.1" $pkgname/game/
	ln -sf libicuuc.so.75.1   $pkgname/game/libicuuc.so.75
	ln -sf libicudata.so.75.1 $pkgname/game/libicudata.so.75
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
