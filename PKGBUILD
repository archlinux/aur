# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mpd-light-pulse-ffmpeg
_pkgname=mpd
pkgver=0.23.5
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without openal, ao, jack, mikmod, modplug, mpg123, openmpt, pipewire, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, zziplib and gme support.'
url='https://www.musicpd.org/'
license=('GPL2')
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'libcdio-paranoia' 'libmad' 'sqlite'
         'libmms' 'libnfs' 'libsoxr' 'zlib'
         'alsa-lib' 'audiofile' 'curl' 'faad2' 'ffmpeg' 'flac' 'fmt'
         'icu' 'libid3tag' 'libmpdclient' 'libogg' 'libpulse' 'libsamplerate'
         'libupnp' 'liburing' 'libvorbis')
makedepends=('boost' 'meson' 'python-sphinx')
provides=("mpd=${pkgver}")
conflicts=('mpd')
replaces=('mpd')
source=("https://www.musicpd.org/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${_pkgname}.conf"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha512sums=('3a870e79bb82c9e8877958d271e933daa3dd970a4510aff4aeea91feab521d7927cd59c7f1ea16a36e84ff879e4f24e4347602ac449c5da31853acb5a3b46f34'
            'SKIP'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1'
            '6e467481406279767b709ec6d5c06dbd825c0de09045c52ffa2d21d0604dcfe19b7a92bf42bed25163d66a3a0d1dbde6185a648b433eaf5eac56be90491e2e18'
            'db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>
backup=("etc/${_pkgname}.conf")

prepare() {
  cd "${_pkgname}-${pkgver}"
  sed -e '/\[Service\]/a User=mpd' \
      -i "systemd/system/mpd.service.in"
}

build() {
  cd "${_pkgname}-${pkgver}"


  _opts=('-Ddocumentation=enabled'
         '-Dadplug=disabled' # not in an official repo
         '-Dsndio=disabled' # interferes with detection of alsa devices
         '-Dshine=disabled' # not in an official repo
         '-Dtremor=disabled' # not in an official repo
         '-D b_ndebug=true' # see https://bugs.archlinux.org/task/72455
         '-Dpipewire=disabled'
         '-Dopenmpt=disabled'
         '-Dchromaprint=disabled'
         '-Dao=disabled'
         '-Djack=disabled'
         '-Dmodplug=disabled'
         '-Dshout=disabled'
         '-Dsidplay=disabled'
         '-Dsoundcloud=disabled'
         '-Dwavpack=disabled'
         '-Dzzip=disabled'
         '-Dzeroconf=disabled'
         '-Dsmbclient=disabled'
         '-Dqobuz=disabled'
         '-Diso9660=disabled'
         '-Dfluidsynth=disabled'
         '-Dmikmod=disabled'
         '-Dmpcdec=disabled'
         '-Dmpg123=disabled'
         '-Dopus=disabled'
         '-Dwildmidi=disabled'
         '-Dlame=disabled'
         '-Dtwolame=disabled'
         '-Dopenal=disabled'
         '-Dyajl=disabled'
         '-Dgme=disabled'
  )
  arch-meson ${_opts[@]} build
  ninja -C build
}

check() {
  cd "${_pkgname}-${pkgver}"
  ninja -C build test
}

package() {
  # depends+=('libFLAC.so' 'libasound.so' 'libaudiofile.so' 'libavcodec.so' 'libavformat.so'
            # 'libcurl.so' 'libfaad.so' 'libfmt.so' 'libicui18n.so' 'libicuuc.so' 'libid3tag.so'
            # 'libmpdclient.so' 'libogg.so' 'libsamplerate.so'
            # 'libvorbis.so' 'libupnp.so' 'liburing.so' 'libixml.so')
  cd "${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
  install -vDm 644 "doc/${_pkgname}conf.example" \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -vDm 644 "../${_pkgname}.conf" -t "${pkgdir}/etc/"
  install -vDm 644 "../${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -vDm 644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"

	# Now service file installs only when libsystemd package was found
	if [ -e "${pkgdir}"/usr/lib/systemd/system/mpd.service ]; then
		sed \
			-e '/\[Service\]/a User=mpd' \
			-e '/WantedBy=/c WantedBy=default.target' \
			-i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	fi
}
# vim: ts=2 sw=2 et:
