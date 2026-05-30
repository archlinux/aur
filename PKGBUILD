# Maintainer: Rain Xelelo <rxelelo@outlook.com>
# Co-Maintainer: jofir

_pkgname=BestClient
pkgname=bestclient
pkgver=1.7.1
pkgrel=19
pkgdesc="DDRaceNetwork modification that adds new features"
arch=('x86_64')
url="https://github.com/RoflikBEST/bestdownload"
license=('custom')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
makedepends=('patchelf' 'gcc')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
install="$pkgname.install"

# ── Bundled library rationale ─────────────────────────────────────────────────
# BestClient is a prebuilt x86_64 binary compiled with BIND_NOW (-z now) against
# FFmpeg 6.1.1 and specific codec library versions. BIND_NOW requires ALL symbol
# references to be resolved at process start, even for codecs DDNet never uses.
# System libraries cannot satisfy these requirements because:
#   - FFmpeg/x264/x265/ICU embed version numbers in symbol names
#   - libxml2/libbluray have GNU_VERSION_R entries that must match exactly
#   - libtheora/libjxl/libvpx/rav1e/svt-av1 have different SONAMEs on current Arch
# Solution: bundle exact-version libraries from Arch Archive.
#
#  Library                   Version        Reason
#  ───────────────────────   ─────────────  ────────────────────────────────────
#  libavformat/codec/…       FFmpeg 6.1.1   ABI symbols: LIBAVFORMAT_60 etc.
#  libxml2.so.2              2.12.7         GNU_VERSION_R: LIBXML2_2.x
#  libbluray.so.2            1.3.4          ABI match with bundled libavformat
#  libicuuc/data.so.75       ICU 75.1       Version-embedded symbols (ucnv_open_75)
#  libx264.so.164            x264 0.164     Symbol: x264_encoder_open_164
#  libx265.so.199            x265 3.5       Symbol: x265_api_get_199
#  libtheoraenc/dec.so.1     libtheora 1.1.1  Exact SONAME + GNU_VERSION_R
#  libjxl*.so.0.10           libjxl 0.10.3  Exact SONAME + GNU_VERSION_R
#  librav1e.so.0.7           rav1e 0.7.1    Exact SONAME
#  libSvtAv1Enc.so.2         svt-av1 2.3.0  Exact SONAME
#  libvpx.so.9               libvpx 1.14.1  Exact SONAME
#  libvapoursynth-script.so.0  stub         vsscript_* API removed from modern VS;
#                                           DDNet never calls it — stubs satisfy BIND_NOW

source=(
	"https://github.com/RoflikBEST/bestdownload/releases/download/v$pkgver/BestClient-linux.tar.xz"
	"$pkgname.png"
	"ffmpeg6::https://archive.archlinux.org/packages/f/ffmpeg/ffmpeg-2%3A6.1.1-7-x86_64.pkg.tar.zst"
	"libxml2_212::https://archive.archlinux.org/packages/l/libxml2/libxml2-2.12.7-1-x86_64.pkg.tar.zst"
	"libbluray_134::https://archive.archlinux.org/packages/l/libbluray/libbluray-1.3.4-3-x86_64.pkg.tar.zst"
	"icu75::https://archive.archlinux.org/packages/i/icu/icu-75.1-2-x86_64.pkg.tar.zst"
	"x264_164::https://archive.archlinux.org/packages/x/x264/x264-3%3A0.164.r3108.31e19f9-3-x86_64.pkg.tar.zst"
	"x265_35::https://archive.archlinux.org/packages/x/x265/x265-3.5-3-x86_64.pkg.tar.zst"
	"libtheora_111::https://archive.archlinux.org/packages/l/libtheora/libtheora-1.1.1-6-x86_64.pkg.tar.zst"
	"libjxl_010::https://archive.archlinux.org/packages/l/libjxl/libjxl-0.10.3-1-x86_64.pkg.tar.zst"
	"rav1e_07::https://archive.archlinux.org/packages/r/rav1e/rav1e-0.7.1-1-x86_64.pkg.tar.zst"
	"svtav1_23::https://archive.archlinux.org/packages/s/svt-av1/svt-av1-2.3.0-1-x86_64.pkg.tar.zst"
	"libvpx_14::https://archive.archlinux.org/packages/l/libvpx/libvpx-1.14.1-1-x86_64.pkg.tar.zst"
	"vsscript_stub.c"
)
sha256sums=(
	'ffe98fc6159789e56241e90e27aa5cf2ab2ec0ac9ebefe8d6c13e6acf566e649'
	'a118504f690407019294b39bea26920e2cddee94c032a1e5fae1ea216c9ea64f'
	'e4c9468bf15c08a4ef2875be99c99261f0769559d92cde7d25acacac5515e9fd'
	'de624a17b93a72af65c3a7987e94af4b9d0664b1ed279b6fb6fd4a4faf9695d9'
	'e701ff2f681c79eca1663e8b0db52142dc356f35db1ec1bc68198c8a7e7c1d59'
	'328339d8083e175438d75e5172dc882202064918cf3e88c72d1c8e57fff57a23'
	'8ffdc81e6ca674cc430e2bb3c63b8b35e94abe2b78b4a5a3806cd3ce938ce37d'
	'ca8a4e3fcce43757770f93fb9fa8e9815f2a9c1f626e43e7ac357fa7fdd9592d'
	'3f323a86383eb243fd4699bfc707d0d9fe2b86335816d60e78a905a2ccfe1c14'
	'a22d0e15fdce40c09d6d6da20becb0bf30cf85096626b80f7c28a7320d484030'
	'5be482bce8d9809b700825b3b926eea2d88d0d15b7cec535923b4192f8e77747'
	'6b2c0b3330d67c6effee771df04229a9ac0bc7642ddca18c8db19df554c31aa7'
	'bde486e65caa73dd388be0a78c486d3ad3f7ed00094396a07d66f3b57b0bc2c1'
	'1f30fa79395052a7e78fa5e2ecf64a7b71387e9b32f20b3ec1e981caf8e70b91'
)

prepare() {
	local _game="${srcdir}/${pkgname}/game"
	local _tmp="${srcdir}/_pkg"
	mkdir -p "$_game"

	cp -r "${srcdir}/${pkgname}-"*-linux_x86_64/* "$_game"
	chmod +x "$_game/DDNet"

	# Fix CI build path baked into the DDNet binary for discord_game_sdk
	patchelf --replace-needed \
		/home/runner/work/BestClient/BestClient/ddnet-libs/discord/linux/lib64/discord_game_sdk.so \
		discord_game_sdk.so \
		"$_game/DDNet"

	# Set RPATH=$ORIGIN so bundled libs in the game dir are found first
	patchelf --set-rpath '$ORIGIN' "$_game/DDNet"

	# VapourSynth stub: libavformat has NEEDED libvapoursynth-script.so.0 and
	# BIND_NOW forces all vsscript_* symbols to be resolved at startup.
	# Modern VapourSynth renamed the library and removed the vsscript_* API.
	# Compile empty stubs — DDNet never calls VapourSynth.
	gcc -shared -fPIC \
		-Wl,-soname,libvapoursynth-script.so.0 \
		-o "$_game/libvapoursynth-script.so.0" \
		"${srcdir}/vsscript_stub.c"

	# Helper: extract one or more .so files from a pkg.tar.zst in a single call
	_install_libs() {
		local pkg="$1" destdir="$2"; shift 2
		rm -rf "$_tmp"; mkdir -p "$_tmp"
		bsdtar -xf "$pkg" -C "$_tmp" "$@"
		for f in "$@"; do
			install -m755 "$_tmp/$f" "$destdir/"
		done
	}

	# ── FFmpeg 6.1.1 ─────────────────────────────────────────────────────────
	_install_libs "${srcdir}/ffmpeg6" "$_game" \
		usr/lib/libavformat.so.60.16.100 \
		usr/lib/libavcodec.so.60.31.102 \
		usr/lib/libavutil.so.58.29.100 \
		usr/lib/libswscale.so.7.5.100 \
		usr/lib/libswresample.so.4.12.100
	ln -sf libavformat.so.60.16.100  "$_game/libavformat.so.60"
	ln -sf libavcodec.so.60.31.102   "$_game/libavcodec.so.60"
	ln -sf libavutil.so.58.29.100    "$_game/libavutil.so.58"
	ln -sf libswscale.so.7.5.100     "$_game/libswscale.so.7"
	ln -sf libswresample.so.4.12.100 "$_game/libswresample.so.4"

	# ── libxml2 2.12.7 ───────────────────────────────────────────────────────
	_install_libs "${srcdir}/libxml2_212" "$_game" usr/lib/libxml2.so.2.12.7
	ln -sf libxml2.so.2.12.7 "$_game/libxml2.so.2"

	# ── libbluray 1.3.4 ──────────────────────────────────────────────────────
	_install_libs "${srcdir}/libbluray_134" "$_game" usr/lib/libbluray.so.2.4.3
	ln -sf libbluray.so.2.4.3 "$_game/libbluray.so.2"

	# ── ICU 75.1 ─────────────────────────────────────────────────────────────
	_install_libs "${srcdir}/icu75" "$_game" \
		usr/lib/libicuuc.so.75.1 \
		usr/lib/libicudata.so.75.1
	ln -sf libicuuc.so.75.1   "$_game/libicuuc.so.75"
	ln -sf libicudata.so.75.1 "$_game/libicudata.so.75"

	# ── x264 0.164 ───────────────────────────────────────────────────────────
	_install_libs "${srcdir}/x264_164" "$_game" usr/lib/libx264.so.164

	# ── x265 3.5 ─────────────────────────────────────────────────────────────
	_install_libs "${srcdir}/x265_35" "$_game" usr/lib/libx265.so.199

	# ── libtheora 1.1.1 ──────────────────────────────────────────────────────
	_install_libs "${srcdir}/libtheora_111" "$_game" \
		usr/lib/libtheoraenc.so.1.1.2 \
		usr/lib/libtheoradec.so.1.1.4
	ln -sf libtheoraenc.so.1.1.2 "$_game/libtheoraenc.so.1"
	ln -sf libtheoradec.so.1.1.4 "$_game/libtheoradec.so.1"

	# ── libjxl 0.10.3 ────────────────────────────────────────────────────────
	_install_libs "${srcdir}/libjxl_010" "$_game" \
		usr/lib/libjxl.so.0.10.3 \
		usr/lib/libjxl_threads.so.0.10.3 \
		usr/lib/libjxl_cms.so.0.10.3
	ln -sf libjxl.so.0.10.3         "$_game/libjxl.so.0.10"
	ln -sf libjxl_threads.so.0.10.3 "$_game/libjxl_threads.so.0.10"
	ln -sf libjxl_cms.so.0.10.3     "$_game/libjxl_cms.so.0.10"

	# ── rav1e 0.7.1 ──────────────────────────────────────────────────────────
	_install_libs "${srcdir}/rav1e_07" "$_game" usr/lib/librav1e.so.0.7.1
	ln -sf librav1e.so.0.7.1 "$_game/librav1e.so.0.7"

	# ── svt-av1 2.3.0 ────────────────────────────────────────────────────────
	_install_libs "${srcdir}/svtav1_23" "$_game" usr/lib/libSvtAv1Enc.so.2.3.0
	ln -sf libSvtAv1Enc.so.2.3.0 "$_game/libSvtAv1Enc.so.2"

	# ── libvpx 1.14.1 ────────────────────────────────────────────────────────
	_install_libs "${srcdir}/libvpx_14" "$_game" usr/lib/libvpx.so.9.0.1
	ln -sf libvpx.so.9.0.1 "$_game/libvpx.so.9"

	rm -rf "$_tmp"
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "${srcdir}/${pkgname}" "$pkgdir/opt/"

	# GLEW: binary needs 2.2, Arch ships 2.3+
	ln -sf /usr/lib/libGLEW.so "$pkgdir/opt/$pkgname/game/libGLEW.so.2.2"

	install -dm0755 "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	cat >"$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash
# Discord Rich Presence: when Discord runs sandboxed (Flatpak / Snap) it places
# IPC sockets in a non-standard path. The Game SDK expects discord-ipc-N directly
# under $XDG_RUNTIME_DIR. Dynamically discover and symlink all sockets found.
# Works with: native AUR discord, Flatpak stable/PTB/Canary, Snap.
_uid=$(id -u)
_rdir="/run/user/$_uid"
for _n in 0 1 2 3 4 5 6 7 8 9; do
	_dst="$_rdir/discord-ipc-$_n"
	[ -S "$_dst" ] && continue   # already in place (native Discord)
	_src=$(find "$_rdir" -maxdepth 5 -name "discord-ipc-$_n" -type s 2>/dev/null | head -1)
	[ -n "$_src" ] && ln -sf "$_src" "$_dst" 2>/dev/null || true
done

cd /opt/bestclient/game
export LD_LIBRARY_PATH="/opt/bestclient/game${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec ./DDNet "$@"
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
