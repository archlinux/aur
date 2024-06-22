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
pkgver=0.23.15
pkgrel=3
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without openal, ao, jack, mikmod, modplug, mpg123, openmpt, pipewire, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, zziplib and gme support.'
url='https://www.musicpd.org/'
license=(
  BSD-2-Clause
  GPL-2.0-or-later
)
arch=('x86_64')
depends=('gcc-libs' 'pcre2' 'glibc' 'libcdio-paranoia' 'libmad' 'sqlite' 'git'
         'libmms' 'libnfs' 'libsoxr' 'zlib'
         'alsa-lib' 'audiofile' 'curl' 'faad2' 'ffmpeg' 'flac' 'fmt'
         'icu' 'libid3tag' 'libmpdclient' 'libogg' 'libpulse' 'libsamplerate'
         'libupnp' 'liburing' 'libvorbis')
makedepends=('boost' 'meson' 'python-sphinx')
provides=("mpd=${pkgver}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+https://github.com/MusicPlayerDaemon/MPD.git#tag=v${pkgver}?signed"
        "${_pkgname}.conf"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.service.override")
sha512sums=('bce2314087725e709e5936f9e5e74ac1b4713cb3402aecf75ebc81d7eb7cab0237a6dfc90ba71672ffe60593a9c627b918c44c79e4f081b1b8987dbc2c029e17'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1'
            '6e467481406279767b709ec6d5c06dbd825c0de09045c52ffa2d21d0604dcfe19b7a92bf42bed25163d66a3a0d1dbde6185a648b433eaf5eac56be90491e2e18'
            'db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d'
            'c1782b82f9db1d30aece43a07230c5d57370f2494a16e108af03815d83968805472f10f53ea5495cf0e08ff8f245430c3c3bc44025af43aaf9ecd12fcd6afc6c')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>
backup=("etc/${_pkgname}.conf")

build() {
  _opts=('-Ddocumentation=enabled'
         '-Dadplug=disabled' # not in an official repo
         '-Dsndio=disabled' # interferes with detection of alsa devices
         '-Dshine=disabled' # not in an official repo
         '-Dtremor=disabled' # not in an official repo
         '-Db_ndebug=true' # see https://bugs.archlinux.org/task/72455
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

  arch-meson ${_opts[@]} build "${_pkgname}"
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -vDm 644 ${_pkgname}/doc/${_pkgname}conf.example -t "$pkgdir/usr/share/doc/${_pkgname}/"
  # NOTE: BSD-2-Clause license file currently missing: https://github.com/MusicPlayerDaemon/MPD/issues/1877
  # install -vDm 644 ${_pkgname}/LICENSES/BSD-2-Clause -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${_pkgname}.service.override "$pkgdir/usr/lib/systemd/system/mpd.service.d/00-arch.conf"
  install -vDm 644 ${_pkgname}.conf -t "$pkgdir/etc/"
  install -vDm 644 ${_pkgname}.sysusers "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm 644 ${_pkgname}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
# vim: ts=2 sw=2 et:
