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
pkgver=0.23.17
pkgrel=2
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without openal, ao, jack, mikmod, modplug, mpg123, openmpt, pipewire, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, zziplib and gme support.'
url='https://www.musicpd.org/'
license=(
  BSD-2-Clause
  GPL-2.0-or-later
)
arch=('x86_64')
depends=('gcc-libs' 'pcre2' 'glibc' 'libcdio-paranoia' 'libmad' 'sqlite' 'git'
         'libmms' 'libsoxr' 'zlib'
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
sha512sums=('6c156fd543f426dd7927dac4871d0fc00c3766e55447a800c1987a9a0652384bfddad56aaff8c5a4c3c9ac5e537492dbc67b64a7f493f9b85c17145f901f5c1c'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1'
            'd66c1d771160ee1781a05e57f383acc466babb29924c07d83ac0e763c14380dd1f279ba7b4aec508dc70245370d9732b4bc6287df1a2e06a920f3b73551d3032'
            'db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d'
            'c1782b82f9db1d30aece43a07230c5d57370f2494a16e108af03815d83968805472f10f53ea5495cf0e08ff8f245430c3c3bc44025af43aaf9ecd12fcd6afc6c')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>
backup=("etc/${_pkgname}.conf")

build() {
  _opts=('-D documentation=enabled'
         '-D adplug=disabled' # not in an official repo
         '-D sndio=disabled' # interferes with detection of alsa devices
         '-D shine=disabled' # not in an official repo
         '-D tremor=disabled' # not in an official repo
         '-D b_ndebug=true' # see https://bugs.archlinux.org/task/72455
         '-D audiofile=disabled'
         '-D nfs=disabled'
         '-D pipewire=disabled'
         '-D openmpt=disabled'
         '-D chromaprint=disabled'
         '-D ao=disabled'
         '-D jack=disabled'
         '-D modplug=disabled'
         '-D shout=disabled'
         '-D sidplay=disabled'
         '-D soundcloud=disabled'
         '-D wavpack=disabled'
         '-D zzip=disabled'
         '-D zeroconf=disabled'
         '-D smbclient=disabled'
         '-D qobuz=disabled'
         '-D iso9660=disabled'
         '-D fluidsynth=disabled'
         '-D mikmod=disabled'
         '-D mpcdec=disabled'
         '-D mpg123=disabled'
         '-D opus=disabled'
         '-D wildmidi=disabled'
         '-D lame=disabled'
         '-D twolame=disabled'
         '-D openal=disabled'
         '-D yajl=disabled'
         '-D gme=disabled'
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
