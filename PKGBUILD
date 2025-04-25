# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target_alias="ppu"
_pkgname="ffmpeg"
pkgname="ps3-${_pkgname}-libs"
pkgver="7.1.1"
pkgrel=1
pkgdesc="Complete solution to record, convert and stream audio and video"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url="https://www.ffmpeg.org"
license=(GPL3)
depends=(ps3-env ps3-ppu-gcc)
options=(!emptydirs !strip staticlibs)
source=(
	"https://www.ffmpeg.org/releases/${_pkgname}-${pkgver}.tar.xz"
)
sha256sums=(
	'733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
)

source /opt/ps3dev/ps3toolchain.sh

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	export AR="${_target_alias}-ar" CC="${_target_alias}-gcc" RANLIB="${_target_alias}-ranlib"	
	local _cflags=(
		-O3
		-flto=auto
		-ffat-lto-objects
		-mminimal-toc
		-I${PSL1GHT}/ppu/include
		-L${PSL1GHT}/ppu/lib
		-I${PS3DEV}/ppu/include
		#-include ${TOPDIR}/support/nostrictansi.h
		-Dstatic_assert=_Static_assert
	)
	export CFLAGS="${_cflags[@]}"

	local _configure_flags=(
		# env
		--prefix="${PS3DEV}/portlibs/${_target_alias}"
		--cc="${CC}"

		# arch
		--enable-cross-compile
		--cross-prefix=${PS3DEV}/ppu/bin/ppu-
		--arch=powerpc64
		--cpu=cell
		--target-os=none
		#--malloc-prefix=my
		--disable-shared
		--enable-static
		--disable-network
		--disable-doc

		# common
    	#--disable-parsers
		#--disable-decoders
		#--disable-demuxers
		--enable-decoder=png
		--enable-decoder=mjpeg
		--enable-encoder=mjpeg
		--enable-encoder=png
		--enable-muxer=spdif
		--enable-encoder=ac3
		--enable-encoder=eac3
		--enable-muxer=matroska
		--enable-encoder=ffvhuff
		--enable-encoder=pcm_s16le
		--disable-encoders
		--disable-filters
		--disable-muxers
		--disable-devices
		--disable-demuxer=rtp
		--disable-protocol=rtp
		--disable-bzlib
		--disable-decoder=twinvq
		--disable-decoder=snow
		--disable-decoder=cavs
		--disable-programs
		--disable-avfilter
	)
	./configure "${_configure_flags[@]}"

	make V=1
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
