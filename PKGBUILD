# Maintainer: Rain Xelelo <rxelelo@outlook.com>
# Co-Maintainer: jofir

_pkgname=BestClient
pkgname=bestclient
pkgver=1.7.1
pkgrel=18
pkgdesc="DDRaceNetwork modification that adds new feauters"
arch=('x86_64')
url="https://github.com/RoflikBEST/bestdownload"
license=('custom')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
makedepends=('patchelf' 'gcc')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
install="$pkgname.install"
#
# BUNDLED LIBRARY RATIONALE
# BestClient 1.7.1 is a prebuilt binary compiled on an older Arch Linux snapshot
# with BIND_NOW (-z now) set on both DDNet and libavcodec. This means ALL undefined
# symbols must be resolved at process startup, regardless of whether the codec is used.
# We therefore bundle or provide SONAME-compat shims for every codec library.
#
# Strategy per library:
#   SONAME-compat  — copy system lib, patch SONAME to old value; works when symbol
#                    names are stable across the version gap (no version suffix in name).
#   Archive bundle — must use the exact old version; symbol names embed the version
#                    (e.g. x264_encoder_open_164, x265_api_get_199).
#   GNU_VERSION_R  — patchelf --remove-needed cannot remove VER_NEED ELF entries;
#                    the library must be present with the old SONAME so the linker
#                    can find it during _dl_check_map_versions.
#
# Library matrix:
#   libavformat/codec/util/swscale/swresample  FFmpeg 6.1.1   Archive bundle
#   libxml2.so.2                               libxml2 2.12.7  Archive bundle  (GNU_VERSION_R)
#   libbluray.so.2                             libbluray 1.3.4 Archive bundle  (GNU_VERSION_R)
#   libicuuc/data.so.75                        ICU 75.1        Archive bundle  (libxml2 dep; version-specific symbols)
#   libtheoraenc/dec.so.1                      libtheora 1.1.1  Archive bundle  (exact soname + GNU_VERSION_R)
#   libjxl.so.0.10 / libjxl_threads.so.0.10   libjxl 0.10.3   Archive bundle  (exact soname + GNU_VERSION_R)
#   libvpx.so.9                                libvpx 1.14.1   Archive bundle  (exact soname)
#   librav1e.so.0.7                            rav1e 0.7.1     Archive bundle  (exact soname)
#   libSvtAv1Enc.so.2                          svt-av1 2.3.0   Archive bundle  (exact soname)
#   libx264.so.164                             x264 0.164      Archive bundle  (x264_encoder_open_164)
#   libx265.so.199                             x265 3.5        Archive bundle  (x265_api_get_199)
#
source=("https://github.com/RoflikBEST/bestdownload/releases/download/v$pkgver/BestClient-linux.tar.xz"
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
        "vsscript_stub.c")
sha256sums=('ffe98fc6159789e56241e90e27aa5cf2ab2ec0ac9ebefe8d6c13e6acf566e649'
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
            'SKIP')

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

	# Helper: extract one .so file from a pkg.tar.zst and install it
	_extract_so() {
		local pkg="$1" sofile="$2" destdir="$3"
		local tmp="${srcdir}/_extract_tmp"
		mkdir -p "$tmp"
		bsdtar -xf "$pkg" -C "$tmp" "$sofile"
		install -m755 "$tmp/$sofile" "$destdir/"
		rm -rf "$tmp"
	}

	# Helper: copy a system lib with patched SONAME (for stable-API libs where
	# only the soname changed between the bundled and current system versions)
	_make_compat() {
		local old_soname="$1" sys_link="$2"
		local real
		real=$(readlink -f "$sys_link")
		cp "$real" "$pkgname/game/$old_soname"
		patchelf --set-soname "$old_soname" "$pkgname/game/$old_soname"
	}

	# ── VapourSynth stub ───────────────────────────────────────────────────────
	# libavformat was compiled with -lvapoursynth-script. Modern VapourSynth
	# changed its SONAME to libvsscript.so and removed the vsscript_* API.
	# DDNet never uses VapourSynth; this stub satisfies BIND_NOW symbol resolution.
	gcc -shared -fPIC \
	    -Wl,-soname,libvapoursynth-script.so.0 \
	    -o "$pkgname/game/libvapoursynth-script.so.0" \
	    "${srcdir}/vsscript_stub.c"

	# ── FFmpeg 6.1.1 ────────────────────────────────────────────────────────────
	for sofile in usr/lib/libavformat.so.60.16.100 \
	              usr/lib/libavcodec.so.60.31.102 \
	              usr/lib/libavutil.so.58.29.100 \
	              usr/lib/libswscale.so.7.5.100 \
	              usr/lib/libswresample.so.4.12.100; do
		_extract_so "${srcdir}/ffmpeg6" "$sofile" "$pkgname/game"
	done
	ln -sf libavformat.so.60.16.100  $pkgname/game/libavformat.so.60
	ln -sf libavcodec.so.60.31.102   $pkgname/game/libavcodec.so.60
	ln -sf libavutil.so.58.29.100    $pkgname/game/libavutil.so.58
	ln -sf libswscale.so.7.5.100     $pkgname/game/libswscale.so.7
	ln -sf libswresample.so.4.12.100 $pkgname/game/libswresample.so.4

	# ── libxml2 2.12.7 ──────────────────────────────────────────────────────────
	# libavformat GNU_VERSION_R: LIBXML2_2.5.2 / 2.4.30 / 2.7.3 / 2.6.0
	# Must provide exact libxml2.so.2 soname with those version nodes.
	_extract_so "${srcdir}/libxml2_212" "usr/lib/libxml2.so.2.12.7" "$pkgname/game"
	ln -sf libxml2.so.2.12.7 $pkgname/game/libxml2.so.2

	# ── libbluray 1.3.4 ─────────────────────────────────────────────────────────
	# libavformat NEEDED libbluray.so.2. 1.3.4 links against libxml2.so.16 (system) — OK.
	_extract_so "${srcdir}/libbluray_134" "usr/lib/libbluray.so.2.4.3" "$pkgname/game"
	ln -sf libbluray.so.2.4.3 $pkgname/game/libbluray.so.2

	# ── ICU 75.1 ────────────────────────────────────────────────────────────────
	# libxml2.so.2.12.7 NEEDED libicuuc.so.75 / libicudata.so.75.
	# ICU uses version-embedded symbols (ucnv_open_75); system ICU 78 is incompatible.
	_extract_so "${srcdir}/icu75" "usr/lib/libicuuc.so.75.1"   "$pkgname/game"
	_extract_so "${srcdir}/icu75" "usr/lib/libicudata.so.75.1" "$pkgname/game"
	ln -sf libicuuc.so.75.1   $pkgname/game/libicuuc.so.75
	ln -sf libicudata.so.75.1 $pkgname/game/libicudata.so.75

	# ── x264 0.164 ──────────────────────────────────────────────────────────────
	# libavcodec uses x264_encoder_open_164 (version-specific symbol name).
	# System libx264.so.165 exports x264_encoder_open_165 — incompatible.
	_extract_so "${srcdir}/x264_164" "usr/lib/libx264.so.164" "$pkgname/game"

	# ── x265 3.5 ────────────────────────────────────────────────────────────────
	# libavcodec uses x265_api_get_199 (version-specific symbol name).
	# System libx265.so.215 exports x265_api_get_215 — incompatible.
	_extract_so "${srcdir}/x265_35" "usr/lib/libx265.so.199" "$pkgname/game"

	# ── Codec libs — exact archive versions, no system lib needed ───────────────
	# All bundled from Arch Archive with exact soname match.
	# Avoids makedepend issues on other systems (rav1e, svt-av1, libjxl not always installed).
	# BIND_NOW requires ALL symbols resolved at startup; DDNet never encodes with these.

	# libtheora 1.1.1 — libtheoraenc.so.1 + libtheoradec.so.1 (GNU_VERSION_R entries)
	_extract_so "${srcdir}/libtheora_111" "usr/lib/libtheoraenc.so.1.1.2" "$pkgname/game"
	_extract_so "${srcdir}/libtheora_111" "usr/lib/libtheoradec.so.1.1.4" "$pkgname/game"
	ln -sf libtheoraenc.so.1.1.2 $pkgname/game/libtheoraenc.so.1
	ln -sf libtheoradec.so.1.1.4 $pkgname/game/libtheoradec.so.1

	# libjxl 0.10.3 — libjxl.so.0.10 + libjxl_threads.so.0.10 + libjxl_cms.so.0.10 (GNU_VERSION_R entries)
	_extract_so "${srcdir}/libjxl_010" "usr/lib/libjxl.so.0.10.3"         "$pkgname/game"
	_extract_so "${srcdir}/libjxl_010" "usr/lib/libjxl_threads.so.0.10.3" "$pkgname/game"
	_extract_so "${srcdir}/libjxl_010" "usr/lib/libjxl_cms.so.0.10.3"     "$pkgname/game"
	ln -sf libjxl.so.0.10.3         $pkgname/game/libjxl.so.0.10
	ln -sf libjxl_threads.so.0.10.3 $pkgname/game/libjxl_threads.so.0.10
	ln -sf libjxl_cms.so.0.10.3     $pkgname/game/libjxl_cms.so.0.10

	# rav1e 0.7.1 — librav1e.so.0.7
	_extract_so "${srcdir}/rav1e_07" "usr/lib/librav1e.so.0.7.1" "$pkgname/game"
	ln -sf librav1e.so.0.7.1 $pkgname/game/librav1e.so.0.7

	# svt-av1 2.3.0 — libSvtAv1Enc.so.2
	_extract_so "${srcdir}/svtav1_23" "usr/lib/libSvtAv1Enc.so.2.3.0" "$pkgname/game"
	ln -sf libSvtAv1Enc.so.2.3.0 $pkgname/game/libSvtAv1Enc.so.2

	# libvpx 1.14.1 — libvpx.so.9
	_extract_so "${srcdir}/libvpx_14" "usr/lib/libvpx.so.9.0.1" "$pkgname/game"
	ln -sf libvpx.so.9.0.1 $pkgname/game/libvpx.so.9
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
