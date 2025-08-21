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
pkgver=0.24.5
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without openal, ao, jack, mikmod, modplug, mpg123, openmpt, pipewire, shout, sidplay, wavpack, fluidsynth, avahi, zziplib and gme support.'
url='https://www.musicpd.org/'
_url="https://github.com/MusicPlayerDaemon/MPD"
license=(
  BSD-2-Clause
  GPL-2.0-or-later
  ISC
  LGPL-2.1-only
)
arch=('x86_64')
depends=('gcc-libs' 'pcre2' 'glibc' 'libcdio-paranoia' 'libmad' 'sqlite' 'git'
         'libmms' 'libsoxr' 'zlib'
         'alsa-lib' 'audiofile' 'curl' 'faad2' 'ffmpeg' 'flac' 'fmt'
         'icu' 'libid3tag' 'libmpdclient' 'libnfs' 'libogg' 'libpulse' 'libsamplerate'
         'libupnp' 'libvorbis' 'nlohmann-json')
makedepends=('meson' 'python-sphinx' 'python-sphinx_rtd_theme')
provides=("mpd=${pkgver}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+$_url?signed#tag=v${pkgver}"
        "${_pkgname}.conf"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.service.override")
sha512sums=('373e41c0b1f093be0e079480b38296df4c6ee1bd2721ead08f1311538b115fff8eec99c406d98e9a92ed090f51bc2baeda0022603276e6ac9c8a7404976f0469'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1'
            'd66c1d771160ee1781a05e57f383acc466babb29924c07d83ac0e763c14380dd1f279ba7b4aec508dc70245370d9732b4bc6287df1a2e06a920f3b73551d3032'
            'db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d'
            'c1782b82f9db1d30aece43a07230c5d57370f2494a16e108af03815d83968805472f10f53ea5495cf0e08ff8f245430c3c3bc44025af43aaf9ecd12fcd6afc6c')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>
backup=("etc/${_pkgname}.conf")

build() {
  local _meson_options=(
         -D documentation=enabled
         -D adplug=disabled # not in an official repo
         -D sndio=disabled # interferes with detection of alsa devices
         -D shine=disabled # not in an official repo
         -D tremor=disabled # not in an official repo
         -D b_ndebug=true # see https://bugs.archlinux.org/task/72455
         -D audiofile=disabled
         -D io_uring=disabled  # liburing support broken: https://github.com/MusicPlayerDaemon/MPD/issues/2241
         -D pipewire=disabled
         -D openmpt=disabled
         -D chromaprint=disabled
         -D ao=disabled
         -D jack=disabled
         -D modplug=disabled
         -D shout=disabled
         -D sidplay=disabled
         -D wavpack=disabled
         -D zzip=disabled
         -D zeroconf=disabled
         -D smbclient=disabled
         -D qobuz=disabled
         -D iso9660=disabled
         -D fluidsynth=disabled
         -D mikmod=disabled
         -D mpcdec=disabled
         -D mpg123=disabled
         -D opus=disabled
         -D wildmidi=disabled
         -D lame=disabled
         -D twolame=disabled
         -D openal=disabled
         -D gme=disabled
  )

  arch-meson "${_pkgname}" build "${_meson_options[@]}"
  meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -vDm 644 ${_pkgname}/doc/${_pkgname}conf.example -t "$pkgdir/usr/share/doc/${_pkgname}/"
  install -vDm 644 ${_pkgname}/LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${_pkgname}.service.override "$pkgdir/usr/lib/systemd/system/mpd.service.d/00-arch.conf"
  install -vDm 644 ${_pkgname}.conf -t "$pkgdir/etc/"
  install -vDm 644 ${_pkgname}.sysusers "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm 644 ${_pkgname}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
# vim: ts=2 sw=2 et:
