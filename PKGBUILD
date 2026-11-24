# Maintainer: Gijs Vermeulen <gijsvrm at gmail dot com>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
# Contributor: MarsSeed <marcell.meszaros@runbox.eu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Kitching <chriskitching@linux.com>

# Mirrors Arch's gstreamer package as closely as a 32-bit build allows.
# Core, base and good are packaged elsewhere, so only bad, ugly and libav are built.
# Meson options and file lists follow upstream, except the va and gtk plugins
# stay in lib32-gst-plugins-bad instead of their own packages.
# Upstream: https://gitlab.archlinux.org/archlinux/packaging/packages/gstreamer

declare -Ii LIB32GST_DISABLE_AV LIB32GST_DISABLE_BAD

pkgbase=lib32-gst-bad-ugly
pkgname=()
((LIB32GST_DISABLE_BAD)) || pkgname+=(
	lib32-gst-plugins-bad-libs	# Split badaudio first
	lib32-gst-plugins-bad
)
pkgname+=(lib32-gst-plugins-ugly)
((LIB32GST_DISABLE_AV)) || pkgname+=(lib32-gst-libav)
readonly LIB32GST_DISABLE_{AV,BAD}

pkgver=1.28.9
pkgrel=1
pkgrel_arch=2 # pkgrel of the Arch gstreamer tag to fetch patches from
pkgdesc="Multimedia graph framework (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)

# Built by lib32-gstreamer, so not pinned to an exact version like upstream
_core_depends=(
	"lib32-gst-plugins-base-libs>=$pkgver"
	"lib32-gstreamer>=$pkgver"
)

_bad_libs_depends=(
	lib32-gcc-libs		lib32-glib2
	lib32-glibc		lib32-libdrm
	lib32-libglvnd		lib32-libgudev
	lib32-libusb		lib32-libva
	lib32-libx11		lib32-libxcb
	lib32-libxkbcommon	lib32-libxkbcommon-x11
	lib32-mesa		lib32-orc
	lib32-vmaf		lib32-vulkan-icd-loader
	lib32-wayland		lib32-zlib
)

_bad_depends=(
	lib32-aom		lib32-bzip2
	lib32-cairo		lib32-curl
	lib32-faac		lib32-faad2
	lib32-fluidsynth	lib32-gcc-libs
	lib32-glib2		lib32-glibc
	lib32-gsm		lib32-gtk3
	lib32-json-glib		lib32-lcms2
	lib32-libass		lib32-libavtp
	lib32-libbs2b		lib32-libdc1394
	lib32-libdca		lib32-libdvdnav
	lib32-libdvdread	lib32-libfdk-aac
	lib32-liblrdf		lib32-libmodplug
	lib32-libmpcdec		lib32-libopenmpt
	lib32-librsvg		lib32-libsndfile
	lib32-libva		lib32-libwebp
	lib32-libxml2		lib32-nettle
	lib32-openal		lib32-openh264
	lib32-openjpeg2		lib32-openssl
	lib32-opus		lib32-pango
	lib32-rtmpdump		lib32-soundtouch
	lib32-srt		lib32-svt-av1
	lib32-wayland		lib32-x265
)

_ugly_depends=(
	lib32-a52dec		lib32-glib2
	lib32-glibc		lib32-libdvdread
	lib32-libmpeg2		lib32-x264
)

_libav_depends=(
	lib32-ffmpeg	lib32-glib2
	lib32-glibc
)

makedepends=(
	git
	glib2-devel
	meson
	python-packaging
	wayland-protocols

	# Not built here, but the test suites use their elements
	lib32-gst-plugins-base
	lib32-gst-plugins-good

	"${_core_depends[@]}"
	"${_ugly_depends[@]}"
)
((LIB32GST_DISABLE_BAD)) || makedepends+=(
	"${_bad_libs_depends[@]}"
	"${_bad_depends[@]}"

	# Only needed at build time
	# bluez-libs provides headers only, the plugin talks to BlueZ over D-Bus
	lib32-bluez-libs
	lib32-ladspa
	lib32-shaderc
	lib32-vulkan-validation-layers
	vulkan-headers
)
((LIB32GST_DISABLE_AV)) || makedepends+=("${_libav_depends[@]}")

checkdepends=(xorg-server-xvfb)
# Used by the jifmux test, which is skipped without it
((LIB32GST_DISABLE_BAD)) || checkdepends+=(lib32-libexif)
options=(!debug)

_archsrc="https://gitlab.archlinux.org/archlinux/packaging/packages/gstreamer/-/raw/$pkgver-$pkgrel_arch"
source=(
	"git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git#tag=$pkgver"

	# Arch's patch to disable broken tests
	"0001-HACK-meson-Disable-broken-tests.patch::$_archsrc/0001-HACK-meson-Disable-broken-tests.patch?ref_type=tags&inline=false"

	# Skip the core subproject in favour of lib32-gstreamer
	0002-Allow-disabling-gstreamer.patch

	# Disable tests that fail for reasons outside this package
	0003-HACK-meson-Disable-broken-tests-lib32.patch
)
b2sums=('515aff0af4cc758c52bcbf4604e1db7b15888b7e339c657ade0211384b579b03d9bfb6283287afe588ff5b571f5bdd9ee739623d4c79b30257607740b1e4aa44'
        'e72bc27b05782637affe803ae36648bded04587c945dfc129ae8d6d11bb8e402dc87266ad6ef57776ca6df0010871e01c6033811a7958468a536629fc813d2dc'
        'f8c9252c286339c92ae857b3d1f20448759cc8cf07bb7ac55a2aaa4207858cff5b26bea867f1ffd166f2f45f4faf9a3e1ec29a6db344017c15d3c3dd34adba8e'
        '5fbe1068a3ea83be1e252cf946fb3ad7f66d56dfc4bdff04d543155801624b7d9e9cd54113a5403d1ba0f1812dc663094a105ddc86c43fcee9d269c58e0b307f')
#validpgpkeys=(D637032E45B8C6585B9456565D2EEE6F6F349D7C) # Tim Müller <tim@gstreamer-foundation.org>

pkgver() {
	cd gstreamer
	git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
	cd gstreamer

	local src
	for src in "${source[@]}"; do
		src="${src%%::*}"
		src="${src##*/}"
		src="${src%%\?*}"
		[[ $src = *.patch ]] || continue
		echo "Applying patch $src..."
		git apply -3 < "../$src"
	done
}

build() {
	local -a meson_switches=(enabled disabled)

	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

	# x87 math breaks timestamp rounding in the tests. Every x86_64 CPU has SSE2.
	export CFLAGS+=' -msse2 -mfpmath=sse'
	export CXXFLAGS+=' -msse2 -mfpmath=sse'

	local meson_options=(
		--libdir=lib32
		--libexecdir=lib32

		# Packaged elsewhere or not shippable here
		-D gstreamer=disabled
		-D base=disabled
		-D good=disabled
		-D devtools=disabled
		-D ges=disabled
		-D gst-examples=disabled
		-D python=disabled
		-D rs=disabled
		-D rtsp_server=disabled
		-D sharp=disabled
		-D introspection=disabled
		-D doc=disabled
		-D qt5=disabled
		-D qt6=disabled

		-D "libav=${meson_switches[LIB32GST_DISABLE_AV]}"
		-D ugly=enabled
		-D "bad=${meson_switches[LIB32GST_DISABLE_BAD]}"

		# Fail instead of silently skipping all tests
		-D tests=enabled

		# Same as upstream
		-D benchmarks=disabled
		-D examples=disabled
		-D glib_debug=disabled
		-D gpl=enabled
		-D gst-plugins-bad:aja=disabled
		-D gst-plugins-bad:amfcodec=disabled
		-D gst-plugins-bad:androidmedia=disabled
		-D gst-plugins-bad:cuda-nvmm=disabled
		-D gst-plugins-bad:directfb=disabled
		-D gst-plugins-bad:directshow=disabled
		-D gst-plugins-bad:flite=disabled
		-D gst-plugins-bad:gs=disabled
		-D gst-plugins-bad:iqa=disabled
		-D gst-plugins-bad:isac=disabled
		-D gst-plugins-bad:lcevcdecoder=disabled
		-D gst-plugins-bad:lcevcencoder=disabled
		-D gst-plugins-bad:magicleap=disabled
		-D gst-plugins-bad:mfx_api=oneVPL
		-D gst-plugins-bad:mpeghdec=disabled
		-D gst-plugins-bad:nvcomp=disabled
		-D gst-plugins-bad:nvdswrapper=disabled
		-D gst-plugins-bad:openni2=disabled
		-D gst-plugins-bad:opensles=disabled
		-D gst-plugins-bad:qt6d3d11=disabled
		-D gst-plugins-bad:svtjpegxs=disabled
		-D gst-plugins-bad:tflite=disabled
		-D gst-plugins-bad:tinyalsa=disabled
		-D gst-plugins-bad:voaacenc=disabled
		-D gst-plugins-bad:voamrwbenc=disabled
		-D gst-plugins-bad:wasapi2=disabled
		-D gst-plugins-bad:wasapi=disabled
		-D gst-plugins-bad:wpe=disabled
		-D gst-plugins-ugly:sidplay=disabled
		-D orc-source=system
		-D package-origin="https://www.archlinux.org/"

		# Set per subproject as the core is not built here
		-D gst-plugins-bad:package-name="Arch Linux lib32-gst-plugins-bad $pkgver-$pkgrel"
		-D gst-plugins-ugly:package-name="Arch Linux lib32-gst-plugins-ugly $pkgver-$pkgrel"
		-D gst-libav:package-name="Arch Linux lib32-gst-libav $pkgver-$pkgrel"

		# Disabled until the outdated or broken lib32 dependency is fixed
		-D gst-plugins-bad:libde265=disabled	# lib32-libde265 1.0.16 vs 1.1.3
		-D gst-plugins-bad:gme=disabled		# lib32-libgme 0.6.4 vs 0.6.5
		-D gst-plugins-bad:srtp=disabled		# lib32-libsrtp 2.7.0 vs 2.8.2
		-D gst-plugins-bad:lv2=disabled		# lib32-lilv 0.24.26 vs 0.28.0
		-D gst-plugins-bad:neon=disabled		# lib32-neon 0.35.0 vs 0.37.1
		-D gst-plugins-bad:sbc=disabled		# lib32-sbc 2.0 vs 2.2
		-D gst-plugins-bad:wildmidi=disabled	# lib32-wildmidi 0.4.6 vs 0.5.0
		-D gst-plugins-bad:teletext=disabled		# lib32-zvbi 0.2.44 vs 0.2.46
		-D gst-plugins-ugly:cdio=disabled		# lib32-libcdio 2.2.0 vs 2.4.0
		-D gst-plugins-bad:openexr=disabled	# lib32-openexr and lib32-imath orphaned
		-D gst-plugins-bad:mpeg2enc=disabled	# lib32-mjpegtools orphaned and out of date
		-D gst-plugins-bad:mplex=disabled		# lib32-mjpegtools orphaned and out of date

		# Enabled explicitly so a missing dependency fails the build
		-D gst-plugins-ugly:a52dec=enabled
		-D gst-plugins-bad:dts=enabled
		-D gst-plugins-bad:musepack=enabled
		-D gst-plugins-bad:fdkaac=enabled
		-D gst-plugins-bad:dc1394=enabled
		-D gst-plugins-ugly:mpeg2dec=enabled
		-D gst-plugins-bad:bluez=enabled
		-D gst-plugins-bad:fluidsynth=enabled
		-D gst-plugins-bad:openh264=enabled
		-D gst-plugins-bad:faac=enabled
		-D gst-plugins-bad:faad=enabled
		-D gst-plugins-bad:svtav1=enabled
		-D gst-plugins-bad:openal=enabled
		-D gst-plugins-bad:ladspa-rdf=enabled

		# Disabled for lack of a 32-bit dependency
		-D libnice=disabled		# no lib32-libnice
		-D gst-plugins-bad:webrtc=disabled	# needs libnice
		-D gst-plugins-bad:chromaprint=disabled	# no lib32-chromaprint
		-D gst-plugins-bad:lc3=disabled		# no lib32-liblc3
		-D gst-plugins-bad:ldac=disabled	# no lib32-libldac
		-D gst-plugins-bad:microdns=disabled	# no lib32-libmicrodns
		-D gst-plugins-bad:onnx=disabled	# no lib32-onnxruntime
		-D gst-plugins-bad:openaptx=disabled	# no lib32-libfreeaptx
		-D gst-plugins-bad:opencv=disabled	# no lib32-opencv
		-D gst-plugins-bad:qroverlay=disabled	# no lib32-qrencode
		-D gst-plugins-bad:spandsp=disabled	# no lib32-spandsp
		-D gst-plugins-bad:svthevcenc=disabled	# no lib32-svt-hevc
		-D gst-plugins-bad:webrtcdsp=disabled	# no lib32-webrtc-audio-processing-1
		-D gst-plugins-bad:wpe2=disabled	# no lib32-wpewebkit
		-D gst-plugins-bad:zbar=disabled	# no lib32-zbar
		-D gst-plugins-bad:zxing=disabled	# no lib32-zxing-cpp
		-D gst-plugins-bad:hip=disabled		# no 32-bit ROCm runtime
		-D gst-plugins-bad:msdk=disabled	# no 32-bit Intel media runtime
		-D gst-plugins-bad:qsv=disabled		# no 32-bit oneVPL runtime
		# timecode builds without LTC support as there is no lib32-libltc
	)

	arch-meson gstreamer build "${meson_options[@]}"
	meson configure build	# Print config
	meson compile -C build
}

check() (
	export XDG_RUNTIME_DIR="$PWD/runtime-dir"
	mkdir -p -m 700 "$XDG_RUNTIME_DIR"

	export CK_TIMEOUT_MULTIPLIER=5
	export NO_AT_BRIDGE=1 GTK_A11Y=none

	xvfb-run -s "-nolisten local" \
		meson test -C build --no-rebuild --print-errorlogs -t $CK_TIMEOUT_MULTIPLIER
)

# Install once into $srcdir/root, then each package moves out its own files
_root() {
	[[ -d $srcdir/root ]] || meson install -C "$srcdir/build" --no-rebuild --destdir "$srcdir/root"
	cd "$srcdir/root"
}

_install() {
	local src dir
	for src in "${files[@]}"; do
		dir="$pkgdir/$(dirname "$src")"
		mkdir -p "$dir"
		mv -v "$src" "$dir"
	done
}

# Suffix binaries with 32 to avoid conflicts with the native package.
# Headers, locales and other shared data are left out for the same reason.
_install_bin() {
	local src
	for src in "$@"; do
		install -Dm755 "$src" "$pkgdir/usr/bin/${src##*/}-32"
	done
}

package_lib32-gst-plugins-bad-libs() {
	pkgdesc+=" - bad"
	depends=("${_core_depends[@]}" "${_bad_libs_depends[@]}")
	replaces=('lib32-gst-plugins-bad-libs-latest')

	_root; local files=(
		usr/lib32/libgst{adaptivedemux,analytics,badaudio,basecamerabinsrc,codecparsers,codecs,cuda,insertbin,isoff,mpegts,mse}-1.0.so*
		usr/lib32/libgst{photography,play,player,sctp,transcoder,uridownloader,va,vulkan,wayland,webrtc}-1.0.so*
		usr/lib32/pkgconfig/gstreamer-{analytics,bad-audio,codecparsers,cuda,insertbin,mpegts,mse,photography,play,player,sctp,transcoder,vulkan{,-wayland,-xcb},va,wayland,webrtc}-1.0.pc

		usr/lib32/pkgconfig/gstreamer-plugins-bad-1.0.pc
		usr/lib32/gstreamer-1.0/libgstaccurip.so
		usr/lib32/gstreamer-1.0/libgstadpcmdec.so
		usr/lib32/gstreamer-1.0/libgstadpcmenc.so
		usr/lib32/gstreamer-1.0/libgstaiff.so
		usr/lib32/gstreamer-1.0/libgstasfmux.so
		usr/lib32/gstreamer-1.0/libgstaudiobuffersplit.so
		usr/lib32/gstreamer-1.0/libgstaudiofxbad.so
		usr/lib32/gstreamer-1.0/libgstaudiolatency.so
		usr/lib32/gstreamer-1.0/libgstaudiomixmatrix.so
		usr/lib32/gstreamer-1.0/libgstaudiovisualizers.so
		usr/lib32/gstreamer-1.0/libgstautoconvert.so
		usr/lib32/gstreamer-1.0/libgstbayer.so
		usr/lib32/gstreamer-1.0/libgstbluez.so
		usr/lib32/gstreamer-1.0/libgstcamerabin.so
		usr/lib32/gstreamer-1.0/libgstcodecalpha.so
		usr/lib32/gstreamer-1.0/libgstcodectimestamper.so
		usr/lib32/gstreamer-1.0/libgstcoloreffects.so
		usr/lib32/gstreamer-1.0/libgstdebugutilsbad.so
		usr/lib32/gstreamer-1.0/libgstdecklink.so
		usr/lib32/gstreamer-1.0/libgstdvb.so
		usr/lib32/gstreamer-1.0/libgstdvbsubenc.so
		usr/lib32/gstreamer-1.0/libgstdvbsuboverlay.so
		usr/lib32/gstreamer-1.0/libgstdvdspu.so
		usr/lib32/gstreamer-1.0/libgstfaceoverlay.so
		usr/lib32/gstreamer-1.0/libgstfbdevsink.so
		usr/lib32/gstreamer-1.0/libgstfestival.so
		usr/lib32/gstreamer-1.0/libgstfieldanalysis.so
		usr/lib32/gstreamer-1.0/libgstfreeverb.so
		usr/lib32/gstreamer-1.0/libgstfrei0r.so
		usr/lib32/gstreamer-1.0/libgstgaudieffects.so
		usr/lib32/gstreamer-1.0/libgstgdp.so
		usr/lib32/gstreamer-1.0/libgstgeometrictransform.so
		usr/lib32/gstreamer-1.0/libgstid3tag.so
		usr/lib32/gstreamer-1.0/libgstinsertbin.so
		usr/lib32/gstreamer-1.0/libgstinter.so
		usr/lib32/gstreamer-1.0/libgstinterlace.so
		usr/lib32/gstreamer-1.0/libgstipcpipeline.so
		usr/lib32/gstreamer-1.0/libgstivfparse.so
		usr/lib32/gstreamer-1.0/libgstivtc.so
		usr/lib32/gstreamer-1.0/libgstjp2kdecimator.so
		usr/lib32/gstreamer-1.0/libgstjpegformat.so
		usr/lib32/gstreamer-1.0/libgstkms.so
		usr/lib32/gstreamer-1.0/libgstlegacyrawparse.so
		usr/lib32/gstreamer-1.0/libgstmidi.so
		usr/lib32/gstreamer-1.0/libgstmpegpsdemux.so
		usr/lib32/gstreamer-1.0/libgstmpegpsmux.so
		usr/lib32/gstreamer-1.0/libgstmpegtsdemux.so
		usr/lib32/gstreamer-1.0/libgstmpegtsmux.so
		usr/lib32/gstreamer-1.0/libgstmse.so
		usr/lib32/gstreamer-1.0/libgstmxf.so
		usr/lib32/gstreamer-1.0/libgstnetsim.so
		usr/lib32/gstreamer-1.0/libgstnvcodec.so
		usr/lib32/gstreamer-1.0/libgstpcapparse.so
		usr/lib32/gstreamer-1.0/libgstpnm.so
		usr/lib32/gstreamer-1.0/libgstproxy.so
		usr/lib32/gstreamer-1.0/libgstremovesilence.so
		usr/lib32/gstreamer-1.0/libgstrfbsrc.so
		usr/lib32/gstreamer-1.0/libgstrist.so
		usr/lib32/gstreamer-1.0/libgstrtmp2.so
		usr/lib32/gstreamer-1.0/libgstrtpmanagerbad.so
		usr/lib32/gstreamer-1.0/libgstrtponvif.so
		usr/lib32/gstreamer-1.0/libgstsdpelem.so
		usr/lib32/gstreamer-1.0/libgstsegmentclip.so
		usr/lib32/gstreamer-1.0/libgstshm.so
		usr/lib32/gstreamer-1.0/libgstsiren.so
		usr/lib32/gstreamer-1.0/libgstsmooth.so
		usr/lib32/gstreamer-1.0/libgstspeed.so
		usr/lib32/gstreamer-1.0/libgstsubenc.so
		usr/lib32/gstreamer-1.0/libgstswitchbin.so
		usr/lib32/gstreamer-1.0/libgsttensordecoders.so
		usr/lib32/gstreamer-1.0/libgsttranscode.so
		usr/lib32/gstreamer-1.0/libgstunixfd.so
		usr/lib32/gstreamer-1.0/libgstuvcgadget.so
		usr/lib32/gstreamer-1.0/libgstuvch264.so
		usr/lib32/gstreamer-1.0/libgstv4l2codecs.so
		usr/lib32/gstreamer-1.0/libgstvideofiltersbad.so
		usr/lib32/gstreamer-1.0/libgstvideoframe_audiolevel.so
		usr/lib32/gstreamer-1.0/libgstvideoparsersbad.so
		usr/lib32/gstreamer-1.0/libgstvideosignal.so
		usr/lib32/gstreamer-1.0/libgstvmaf.so
		usr/lib32/gstreamer-1.0/libgstvmnc.so
		usr/lib32/gstreamer-1.0/libgstvulkan.so
		usr/lib32/gstreamer-1.0/libgstwaylandsink.so
	); _install

	_install_bin usr/bin/gst-transcoder-1.0
}

package_lib32-gst-plugins-bad() {
	pkgdesc+=" - bad plugins"
	depends=(
		"lib32-gst-plugins-bad-libs=$pkgver-$pkgrel"
		"${_core_depends[@]}"
		"${_bad_depends[@]}"
	)
	replaces=('lib32-gst-plugins-bad-latest')

	_root; local files=(
		usr/lib32/gstreamer-1.0/libgstaes.so
		usr/lib32/gstreamer-1.0/libgstanalyticsoverlay.so
		usr/lib32/gstreamer-1.0/libgstaom.so
		usr/lib32/gstreamer-1.0/libgstassrender.so
		usr/lib32/gstreamer-1.0/libgstavtp.so
		usr/lib32/gstreamer-1.0/libgstbs2b.so
		usr/lib32/gstreamer-1.0/libgstbz2.so
		usr/lib32/gstreamer-1.0/libgstclosedcaption.so
		usr/lib32/gstreamer-1.0/libgstcodec2json.so
		usr/lib32/gstreamer-1.0/libgstcolormanagement.so
		usr/lib32/gstreamer-1.0/libgstcurl.so
		usr/lib32/gstreamer-1.0/libgstdc1394.so
		usr/lib32/gstreamer-1.0/libgstdash.so
		usr/lib32/gstreamer-1.0/libgstdtls.so
		usr/lib32/gstreamer-1.0/libgstdtsdec.so
		usr/lib32/gstreamer-1.0/libgstfaac.so
		usr/lib32/gstreamer-1.0/libgstfaad.so
		usr/lib32/gstreamer-1.0/libgstfdkaac.so
		usr/lib32/gstreamer-1.0/libgstfluidsynthmidi.so
		usr/lib32/gstreamer-1.0/libgstgsm.so
		usr/lib32/gstreamer-1.0/libgstgtkwayland.so
		usr/lib32/gstreamer-1.0/libgsthls.so
		usr/lib32/gstreamer-1.0/libgstladspa.so
		usr/lib32/gstreamer-1.0/libgstmodplug.so
		usr/lib32/gstreamer-1.0/libgstmusepack.so
		usr/lib32/gstreamer-1.0/libgstopenal.so
		usr/lib32/gstreamer-1.0/libgstopenh264.so
		usr/lib32/gstreamer-1.0/libgstopenjpeg.so
		usr/lib32/gstreamer-1.0/libgstopenmpt.so
		usr/lib32/gstreamer-1.0/libgstopusparse.so
		usr/lib32/gstreamer-1.0/libgstresindvd.so
		usr/lib32/gstreamer-1.0/libgstrsvg.so
		usr/lib32/gstreamer-1.0/libgstrtmp.so
		usr/lib32/gstreamer-1.0/libgstsctp.so
		usr/lib32/gstreamer-1.0/libgstsmoothstreaming.so
		usr/lib32/gstreamer-1.0/libgstsndfile.so
		usr/lib32/gstreamer-1.0/libgstsoundtouch.so
		usr/lib32/gstreamer-1.0/libgstsrt.so
		usr/lib32/gstreamer-1.0/libgstsvtav1.so
		usr/lib32/gstreamer-1.0/libgsttimecode.so
		usr/lib32/gstreamer-1.0/libgstttmlsubs.so
		usr/lib32/gstreamer-1.0/libgstva.so
		usr/lib32/gstreamer-1.0/libgstwebp.so
		usr/lib32/gstreamer-1.0/libgstx265.so
	); _install
}

package_lib32-gst-plugins-ugly() {
	pkgdesc+=" - ugly plugins"
	depends=("${_core_depends[@]}" "${_ugly_depends[@]}")
	replaces=('lib32-gst-plugins-ugly-latest')

	_root; local files=(
		usr/lib32/gstreamer-1.0/libgsta52dec.so
		usr/lib32/gstreamer-1.0/libgstasf.so
		usr/lib32/gstreamer-1.0/libgstdvdlpcmdec.so
		usr/lib32/gstreamer-1.0/libgstdvdread.so
		usr/lib32/gstreamer-1.0/libgstdvdsub.so
		usr/lib32/gstreamer-1.0/libgstmpeg2dec.so
		usr/lib32/gstreamer-1.0/libgstrealmedia.so
		usr/lib32/gstreamer-1.0/libgstx264.so
	); _install
}

package_lib32-gst-libav() {
	pkgdesc+=" - libav plugin"
	depends=("${_core_depends[@]}" "${_libav_depends[@]}")
	provides=("lib32-gst-ffmpeg=$pkgver-$pkgrel")
	replaces=('lib32-gst-libav-latest')

	_root; local files=(
		usr/lib32/gstreamer-1.0/libgstlibav.so
	); _install
}

# vim: ft=sh:ts=8
