# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: E5ten <e5ten.arch@gmail.com>
# Contributor: anna <morganamilo@gmail.com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-git
_pkgname=mpd
pkgver=0.21.25.r1114.ge8380cf2a
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music (from git)'
url='https://www.musicpd.org/'
license=('GPL2')
arch=('x86_64')
depends=('bzip2' 'chromaprint' 'expat' 'gcc-libs' 'glibc' 'lame' 'libcdio'
         'libcdio-paranoia' 'libgcrypt' 'libgme' 'libmad' 'libmms' 'libmodplug'
         'libmpcdec' 'libnfs' 'libshout' 'libsidplayfp' 'libsoxr' 'libupnp-git' 'openal'
         'opus' 'smbclient' 'sqlite' 'wavpack' 'wildmidi' 'yajl' 'zlib' 'zziplib')
makedepends=('alsa-lib' 'audiofile' 'avahi' 'boost' 'curl' 'dbus' 'faad2'
             'ffmpeg' 'flac' 'fluidsynth' 'git' 'icu' 'jack' 'libao' 'libid3tag' 'libmikmod'
             'libmpdclient' 'libogg' 'libpulse' 'libsamplerate' 'libsndfile' 'liburing'
             'libvorbis' 'meson' 'mpg123' 'python-sphinx' 'systemd-libs' 'twolame')
provides=('mpd')
conflicts=('mpd')
source=("$_pkgname::git+https://github.com/MusicPlayerDaemon/MPD"
        "${_pkgname}.conf"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            'f40f68205834ca53cea3372e930bfe6c2f9ecc9df3b1605df2fec63a658b2e03'
            '0b74c6e5db08daab3091dc15a6b0c75210ba2f9e98fa074f6cfd605a461056b6'
            '2faa85c12449a5b3ca422ff1c1fa06d057c7e262a74bfa6298c914a92d6f2e7a')

backup=('etc/mpd.conf')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	sed -e '/\[Service\]/a User=mpd' \
		-i "systemd/system/mpd.service.in"
}

build() {
  cd "${_pkgname}"
  # NOTE: sndio conflicts with alsa
  # TODO: package adplug
  # TODO: package shine
  meson --prefix /usr \
        --libexecdir lib \
        --sbindir bin \
        --buildtype plain \
        --auto-features enabled \
        --wrap-mode nodownload \
        -D b_lto=true \
        -D b_pie=true \
        -D documentation=enabled \
        -D adplug=disabled \
        -D sndio=disabled \
        -D shine=disabled \
        -D tremor=disabled \
        build
  ninja -C build
}

check() {
  cd "${_pkgname}"
  ninja -C build test
}

package() {
  depends+=('libFLAC.so' 'libao.so' 'libasound.so' 'libaudiofile.so'
  'libavahi-client.so' 'libavahi-common.so' 'libavcodec.so' 'libavformat.so'
  'libavutil.so' 'libcurl.so' 'libdbus-1.so' 'libfaad.so' 'libfluidsynth.so'
  'libicui18n.so' 'libicuuc.so' 'libid3tag.so' 'libjack.so' 'libmikmod.so'
  'libmpdclient.so' 'libmpg123.so' 'libogg.so' 'libpulse.so' 'libsamplerate.so'
  'libsndfile.so' 'libsystemd.so' 'libtwolame.so' 'libvorbis.so'
  'libvorbisenc.so')
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -vDm 644 "doc/${_pkgname}conf.example" \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -vDm 644 "doc/${_pkgname}.conf.5.rst" -t "${pkgdir}/usr/share/man/man5/"
  install -vDm 644 "doc/${_pkgname}.1.rst" -t "${pkgdir}/usr/share/man/man1/"

  install -vDm 644 "../${_pkgname}.conf" -t "${pkgdir}/etc/"
  install -vDm 644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm 644 "../${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
