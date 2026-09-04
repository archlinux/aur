# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname='moc-development'
_pkgname='moc'
pkgver='2.6_alpha3'
_pkgver='2.6-alpha3'
pkgrel=2
pkgdesc='Music On Console is an ncurses-based console audio player - latest version with patches to support PulseAudio, FluidSynth and newer FFmpeg'
arch=('x86_64')
url="https://moc.daper.net/"
license=('GPL-2.0-or-later')
depends=('popt' 'libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'sndio' 'fluidsynth' 'libsmf')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2')
optdepends=('speex:      for using the speex plugin'
	    'ffmpeg:     for using the ffmpeg plugin'
	    'taglib:     for using the musepack plugin'
	    'libmpcdec:  for using the musepack plugin'
            'wavpack:    for using the wavpack plugin'
            'faad2:      for using the aac plugin'
	    'libmodplug: for using the modplug plugin')
provides=('moc')
conflicts=('moc' 'moc-pulse' 'moc-git' 'moc-unstable' 'moc-fluidsynth-plugin')
source=("https://ftp.daper.net/pub/soft/${_pkgname}/unstable/${_pkgname}-${_pkgver}.tar.xz"
	"moc-fluidsynth-plugin-0.6.6.tar.gz::https://github.com/joanbm/moc-fluidsynth-plugin/archive/refs/tags/v0.0.6.tar.gz"
        "pulse.c"
        "pulse.h"
	"ffmpeg.c"
	"ffmpeg.m4")
sha256sums=('a27b8888984cf8dbcd758584961529ddf48c237caa9b40b67423fbfbb88323b1'
	    '5585d541c6bc92103a71a044d096f16d872ac260a078d7d91b005f60939aefb4'
	    '84cbc24e9c81f0ea699438bdb8827f1519c107fb963a8b59baf50e3a21f70252'
	    '93e89cc4f4025f30a9b1b0c4c2603ca35950cf237dc0fc15f09759438232bc33'
	    'SKIP'
	    'SKIP')
install="moc-development.install"

prepare() {
    cd "${_pkgname}-${_pkgver}"

    ## 1. Fix the compilation (fix all current errors):
    
    # first patch the FFmpeg 4.4 plugin in the file: 'decoder_plugins/ffmpeg/ffmpeg.c'
    sed -i '700 s/CODEC_CAP_EXPERIMENTAL/AV_CODEC_CAP_EXPERIMENTAL/' "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/ffmpeg.c"
    sed -i '708 s/CODEC_CAP_TRUNCATED/AV_CODEC_CAP_TRUNCATED/'       "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/ffmpeg.c"
    sed -i '709 s/CODEC_FLAG_TRUNCATED/AV_CODEC_FLAG_TRUNCATED/'     "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/ffmpeg.c"
    sed -i '728 s/CODEC_CAP_DELA/AV_CODEC_CAP_DELA/'                 "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/ffmpeg.c"

    # fixing an error in the file: 'tags_cache.c'
    sed -i '129 s/db_strerror/bdb_strerror/' "$srcdir/${_pkgname}-${_pkgver}/tags_cache.c"

    # add support for https in the file: 'files.c'
    sed -i '87a\		|| !strncasecmp (str, "https://", sizeof ("https://") - 1)' "$srcdir/${_pkgname}-${_pkgver}/files.c"

    # fix warning about the file 'configure.in' (should be named 'configue.ac'):
    mv "$srcdir/${_pkgname}-${_pkgver}/configure.in" "$srcdir/${_pkgname}-${_pkgver}/configure.ac"


    
    ## 2. Add the PulseAudio support:
    # (Note: PulseAudio support based on the AUR/moc-pulse package)

    # copy files 'pulse.c' and 'pulse.h' into the main directory:
    cp ../pulse.c "$srcdir/${_pkgname}-${_pkgver}/"
    cp ../pulse.h "$srcdir/${_pkgname}-${_pkgver}/"

    # include the 'pulse.h' header into the file: 'audio.c'
    sed -i '34a\#ifdef HAVE_PULSE'   "$srcdir/${_pkgname}-${_pkgver}/audio.c"
    sed -i '35a\# include "pulse.h"' "$srcdir/${_pkgname}-${_pkgver}/audio.c"
    sed -i '36a\#endif"'             "$srcdir/${_pkgname}-${_pkgver}/audio.c"

    # add "PulseAudio" as an option in the main configuration file - modify the file: 'options.c'
    sed -i '578 s/CHECK_DISCRETE(5), "SNDIO", "Jack", "ALSA", "OSS", "null");/CHECK_DISCRETE(5), "SNDIO", "PulseAudio", "Jack", "ALSA", "OSS", "null");/' \
	"$srcdir/${_pkgname}-${_pkgver}/options.c"
    sed -i '581 s/CHECK_DISCRETE(5), "SNDIO", "Jack", "ALSA", "OSS", "null");/CHECK_DISCRETE(5), "SNDIO", "PulseAudio", "Jack", "ALSA", "OSS", "null");/' \
	"$srcdir/${_pkgname}-${_pkgver}/options.c"

    # finally, modify the main configuration file to add another option - file: 'configure.ac'
    sed -i '159a\if test "x$with_pulse" != "xno"' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '160a\then' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '161a\	PKG_CHECK_MODULES(PULSE, [libpulse],' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '162a\		 [SOUND_DRIVERS="$SOUND_DRIVERS PULSE"' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '163a\		  EXTRA_OBJS="$EXTRA_OBJS pulse.o"' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '164a\		  AC_DEFINE([HAVE_PULSE], 1, [Define if you have PulseAudio.])' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '165a\		  EXTRA_LIBS="$EXTRA_LIBS $PULSE_LIBS"' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '166a\		  CFLAGS="$CFLAGS $PULSE_CFLAGS"],' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '167a\		  [true])' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '168a\fi' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"
    sed -i '169a\' "$srcdir/${_pkgname}-${_pkgver}/configure.ac"


    
    ## 3. Add the FluidSynth support (made by Joan Bruguera Micó)
    # Note: for some reason, it can't be included directly (can only be compiled separately as a shared library)
    #       ...probably because the moc-fulidsynth-plugin adds specific steps for compiling the libfluidsynth_decoder.so (as a standalone plugin)
    #       - that makes some of the following steps kind of redundant
    #         (will needs to compile the libfluidsynth_decoder.so manually later - see the build() and package() sections)

    # copy the 'fluidsynth' decoder plugin from the moc-fluidsynth-plugin project:
    cp -r ../moc-fluidsynth-plugin-0.0.6/moc/decoder_plugins/fluidsynth "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins"

    # add the 'fluidsynth' right after 'timidity' in the decoder list - the file: 'decoders.m4'
    sed -i '26a\m4_include(decoder_plugins/fluidsynth/fluidsynth.m4)' "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/decoders.m4"

    # ... and to the file: 'decoder_plugins/Makefile.am'
    sed -i '38a\if BUILD_fluidsynth'       "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/Makefile.am"
    sed -i '39a\    SUBDIRS += fluidsynth' "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/Makefile.am"
    sed -i '40a\endif'                     "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/Makefile.am"
    sed -i '41a\'                          "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/Makefile.am"

    # also add 'fluidsynth' to the file: 'tools/md5check.sh'
    sed -i '244 s/timidity/timidity|fluidsynth/' "$srcdir/${_pkgname}-${_pkgver}/tools/md5check.sh"

    # and list it in the main makefile: 'Makefile.in'
    sed -i '69a\	$(top_srcdir)/decoder_plugins/fluidsynth/fluidsynth.m4 \' "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/Makefile.in"

    # add notion about the FluidSynth support to the default example config file: 'config.example.in'
    sed -i '639a\# Self-describing FluidSynth audio characteristic options.'   "$srcdir/${_pkgname}-${_pkgver}/config.example.in"
    sed -i '640a\#FluidSynth_SoundFont = /usr/share/soundfonts/default.sf2'    "$srcdir/${_pkgname}-${_pkgver}/config.example.in"
    sed -i '641a\#FluidSynth_Rate = 44100            # Between 8000 and 96000' "$srcdir/${_pkgname}-${_pkgver}/config.example.in"
    sed -i '642a\'                                                             "$srcdir/${_pkgname}-${_pkgver}/config.example.in"

    # and finally: give credit to the author of the moc-fluidsynth-plugin - add him to the file: 'THANKS'
    sed -i '16a\Joan Bruguera:'                               "$srcdir/${_pkgname}-${_pkgver}/THANKS"
    sed -i '17a\	* Added FluidSynth decoder for MIDI.' "$srcdir/${_pkgname}-${_pkgver}/THANKS"
    sed -i '18a\'                                             "$srcdir/${_pkgname}-${_pkgver}/THANKS"



    ## 4. Patch the FFmpeg decoder plugin so that its compatible with current version of FFmpeg:

    # change the original file 'decoder_plugins/ffmpeg/ffmpeg.c' for the new one:
    rm "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/ffmpeg.c"
    cp ../ffmpeg.c "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/"

    # there are now several redundant probes in the file 'decoder_plugins/ffmpeg/ffmpeg.m4' (lines 47-53)
    # but there is a much bigger problem too - we will need to ensure that MOC compiles against FFmpeg>=5.1
    # (otherwise, it will fail to compile if FFmpeg4.4 is present).
    # In short: change the file 'decoder_plugins/ffmpeg/ffmpeg.m4' for the new one:
    rm "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/ffmpeg.m4"
    cp ../ffmpeg.m4 "$srcdir/${_pkgname}-${_pkgver}/decoder_plugins/ffmpeg/"


    
    ## 5. final step - reconfigure the build system:
    autoreconf -i -f
}

build() {
    cd "${_pkgname}-${_pkgver}"

    ./configure --prefix=/usr     \
		--without-rcc     \
		--with-pulse      \
		--with-oss        \
		--with-alsa       \
		--with-jack       \
		--with-aac        \
		--with-mp3        \
		--with-musepack   \
		--with-vorbis     \
		--with-flac       \
		--with-wavpack    \
		--with-sndfile    \
		--with-modplug    \
		--with-ffmpeg     \
		--with-speex      \
		--with-samplerate \
		--with-curl       \
		--with-fluidsynth \
		--disable-cache   \
		--disable-debug
    make

    ## Since the FluidSynth plugin can't be included directly (requires specific additional make parameters),
    ## we will now create a new Makefile and use it to build the file libfluidsynth_decoder.so
    ## Note that as far as packaging goes, this is kind of a weird hack:

    # create the new Makefile in the "$srcdir":
    cd "${srcdir}"
    touch "Makefile"

    # fill the new Makefile - based on the content of Makefile from the moc-fluidsynth-plugin:
    echo 'CC := gcc' >> "$srcdir/Makefile"
    echo 'SMF_FLAGS = $(shell pkg-config --exists smf && pkg-config --cflags --libs smf && echo "-DHAVE_SMF")' >> "$srcdir/Makefile"
    echo 'libfluidsynth_decoder.so: moc/decoder_plugins/fluidsynth/fluidsynth.c' >> "$srcdir/Makefile"
    echo '	$(CC) -Wall -Wextra -fPIC -DSTANDALONE -Imoc -shared moc/decoder_plugins/fluidsynth/fluidsynth.c \' >> "$srcdir/Makefile"
    echo '		$(shell pkg-config --cflags --libs fluidsynth) $(SMF_FLAGS) -o libfluidsynth_decoder.so' >> "$srcdir/Makefile"

    # create a symbolic link called 'moc' in "$srcdir" - this mirrors the directory structure from the moc-fluidsynth plugin:
    ln -s "${_pkgname}-${_pkgver}" "${srcdir}/${_pkgname}"

    # and of course make the libfluidsynth_decoder.so library itself:
    make libfluidsynth_decoder.so
}

package() {
    cd ${_pkgname}-${_pkgver}
    make DESTDIR="${pkgdir}" install

    # now all that remains to do is to replace the libfluidsynth_decoder.so with the one from "$srcdir":
    rm "${pkgdir}/usr/lib/moc/decoder_plugins/libfluidsynth_decoder.so"
    cp "${srcdir}/libfluidsynth_decoder.so" "${pkgdir}/usr/lib/moc/decoder_plugins/"
}

# vim: ts=2 sw=2
