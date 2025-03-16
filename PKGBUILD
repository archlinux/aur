# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libsndfile
pkgver=1.2.2
pkgrel=3
arch=('any')
pkgdesc="A C library for reading and writing files containing sampled audio data (Android ${_android_arch})"
url="https://libsndfile.github.io/libsndfile/"
license=('LGPL-2.1-or-later')
groups=('android-libsndfile')
depends=("android-${_android_arch}-flac"
         "android-${_android_arch}-lame"
         "android-${_android_arch}-libogg"
         "android-${_android_arch}-libvorbis"
         "android-${_android_arch}-mpg123"
         "android-${_android_arch}-opus")
makedepends=('android-cmake'
             "android-${_android_arch}-alsa-lib"
             "android-${_android_arch}-sqlite"
             'python')
optdepends=("android-${_android_arch}-alsa-lib: for sndfile-play")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsndfile/libsndfile/releases/download/${pkgver}/libsndfile-${pkgver}.tar.xz"{,.asc}
        "libsndfile-1.2.2-CVE-2022-33065.patch::https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c.patch")
md5sums=('04e2e6f726da7c5dc87f8cf72f250d04'
         'SKIP'
         '556246c10b1a889a7948c4f96c9a5172')
validpgpkeys=(
  '6A91A5CF22C24C99A35E013FCFDCF91FB242ACED'  # Erik de Castro Lopo <erikd@mega-nerd.com>
  '9B1CFD2E92239C4B288E025F9D0D1F1CCB35FF8C'  # evpobr evpobr@gmail.com
  '31D95CAB6D80D262244A1750A47620E801E47E95'  # David Seifert soap@gentoo.org
)

prepare() {
    cd "${srcdir}/libsndfile-${pkgver}"

    patch -Np1 -i ../libsndfile-1.2.2-CVE-2022-33065.patch
}

build() {
    cd "${srcdir}/libsndfile-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_PROGRAMS=OFF \
        -DBUILD_TESTING=OFF \
        -DENABLE_EXTERNAL_LIBS=ON \
        -DENABLE_MPEG=ON \
        -Dpkgcfg_lib_PC_FLAC_FLAC="${ANDROID_PREFIX_LIB}/pkgconfig/flac.pc" \
        -Dpkgcfg_lib_PC_MPG123_mpg123="${ANDROID_PREFIX_LIB}/pkgconfig/libmpg123.pc" \
        -Dpkgcfg_lib_PC_OGG_ogg="${ANDROID_PREFIX_LIB}/pkgconfig/ogg.pc" \
        -Dpkgcfg_lib_PC_OPUS_opus="${ANDROID_PREFIX_LIB}/pkgconfig/opus.pc" \
        -Dpkgcfg_lib_PC_SPEEX_speex="${ANDROID_PREFIX_LIB}/pkgconfig/speex.pc" \
        -Dpkgcfg_lib_PC_Vorbis_Enc_vorbisenc="${ANDROID_PREFIX_LIB}/pkgconfig/vorbisenc.pc" \
        -Dpkgcfg_lib_PC_Vorbis_File_vorbisfile="${ANDROID_PREFIX_LIB}/pkgconfig/vorbisfile.pc" \
        -Dpkgcfg_lib_PC_Vorbis_Vorbis_vorbis="${ANDROID_PREFIX_LIB}/pkgconfig/vorbis.pc" \
        -DALSA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libasound.so" \
        -DFLAC_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DFLAC_LIBRARY="${ANDROID_PREFIX_LIB}/libFLAC.so" \
        -DMP3LAME_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DMP3LAME_LIBRARY="${ANDROID_PREFIX_LIB}/libmp3lame.so" \
        -DOGG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOGG_LIBRARY="${ANDROID_PREFIX_LIB}/libogg.so" \
        -DOPUS_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPUS_LIBRARY="${ANDROID_PREFIX_LIB}/libopus.so" \
        -DSPEEX_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSPEEX_LIBRARY="${ANDROID_PREFIX_LIB}/libspeex.so" \
        -DSQLite3_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSQLite3_LIBRARY="${ANDROID_PREFIX_LIB}/libsqlite3.so" \
        -DVorbis_Enc_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DVorbis_Enc_LIBRARY="${ANDROID_PREFIX_LIB}/libvorbisenc.so" \
        -DVorbis_File_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DVorbis_File_LIBRARY="${ANDROID_PREFIX_LIB}/libvorbisfile.so" \
        -DVorbis_Vorbis_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DVorbis_Vorbis_LIBRARY="${ANDROID_PREFIX_LIB}/libvorbis.so" \
        -Dmpg123_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -Dmpg123_LIBRARY="${ANDROID_PREFIX_LIB}/libmpg123.so" \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_PROGRAMS=OFF \
        -DBUILD_TESTING=OFF \
        -DENABLE_EXTERNAL_LIBS=ON \
        -DENABLE_MPEG=ON \
        -Dpkgcfg_lib_PC_FLAC_FLAC="${ANDROID_PREFIX_LIB}/pkgconfig/flac.pc" \
        -Dpkgcfg_lib_PC_MPG123_mpg123="${ANDROID_PREFIX_LIB}/pkgconfig/libmpg123.pc" \
        -Dpkgcfg_lib_PC_OGG_ogg="${ANDROID_PREFIX_LIB}/pkgconfig/ogg.pc" \
        -Dpkgcfg_lib_PC_OPUS_opus="${ANDROID_PREFIX_LIB}/pkgconfig/opus.pc" \
        -Dpkgcfg_lib_PC_SPEEX_speex="${ANDROID_PREFIX_LIB}/pkgconfig/speex.pc" \
        -Dpkgcfg_lib_PC_Vorbis_Enc_vorbisenc="${ANDROID_PREFIX_LIB}/pkgconfig/vorbisenc.pc" \
        -Dpkgcfg_lib_PC_Vorbis_File_vorbisfile="${ANDROID_PREFIX_LIB}/pkgconfig/vorbisfile.pc" \
        -Dpkgcfg_lib_PC_Vorbis_Vorbis_vorbis="${ANDROID_PREFIX_LIB}/pkgconfig/vorbis.pc" \
        -DALSA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libasound.a" \
        -DFLAC_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DFLAC_LIBRARY="${ANDROID_PREFIX_LIB}/libFLAC.a" \
        -DMP3LAME_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DMP3LAME_LIBRARY="${ANDROID_PREFIX_LIB}/libmp3lame.a" \
        -DOGG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOGG_LIBRARY="${ANDROID_PREFIX_LIB}/libogg.a" \
        -DOPUS_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPUS_LIBRARY="${ANDROID_PREFIX_LIB}/libopus.a" \
        -DSPEEX_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSPEEX_LIBRARY="${ANDROID_PREFIX_LIB}/libspeex.a" \
        -DSQLite3_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSQLite3_LIBRARY="${ANDROID_PREFIX_LIB}/libsqlite3.a" \
        -DVorbis_Enc_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DVorbis_Enc_LIBRARY="${ANDROID_PREFIX_LIB}/libvorbisenc.a" \
        -DVorbis_File_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DVorbis_File_LIBRARY="${ANDROID_PREFIX_LIB}/libvorbisfile.a" \
        -DVorbis_Vorbis_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DVorbis_Vorbis_LIBRARY="${ANDROID_PREFIX_LIB}/libvorbis.a" \
        -Dmpg123_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -Dmpg123_LIBRARY="${ANDROID_PREFIX_LIB}/libmpg123.a" \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libsndfile-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
