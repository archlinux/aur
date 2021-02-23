# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=alsa-plugins-libswresample
_basename=alsa-plugins
provides=('alsa-plugins=1.2.2')
conflicts=(alsa-plugins)
pkgver=1.2.2
pkgrel=2
pkgdesc="Additional ALSA plugins (with libswresample support)"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL2.1)
depends=(glibc libasound.so)
optdepends=('dbus: for maemo plugin'
            'jack: for pcm_jack plugin'
            'libavtp: for pcm_aaf plugin'
            'libsamplerate: for rate_samplerate plugin'
            'libpulse: for conf_pulse, ctl_pulse and pcm_pulse plugins'
            'speexdsp: for pcm_speex and rate_speexrate plugins')
makedepends=(alsa-lib dbus jack libavtp libpulse libsamplerate speexdsp)
source=("https://www.alsa-project.org/files/pub/plugins/$_basename-$pkgver.tar.bz2"
        pulse-sysdefault.diff
        "https://git.harting.dev/anonfunc/alsa-plugins/commit/9cdbbb9874757b6f8fda7fb4ac2e3fc59da65946.patch")
sha256sums=('1c0f06450c928d711719686c9dbece2d480184f36fab11b8f0534cb7b41e337d'
            'd8c59b891e2913619d057ffea308293d73892b16fa5a01583d056e372e55309d'
            'f1fc4fe7d3b4c34b244b276d109af9bfb0b501554e882749b22d4e9a6f3d7596')

prepare() {
  cd $_basename-$pkgver

  # Make use of the pulse plugin's "fallback" feature
  # Keeps parity with our old config from pulseaudio-alsa
  patch -Np1 -i ../pulse-sysdefault.diff
 
  # Make rate plugin use libswresample
  patch -Np1 -i ../9cdbbb9874757b6f8fda7fb4ac2e3fc59da65946.patch

  autoreconf -fvi
}

build() {
  cd $_basename-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-maemo-plugin \
    --enable-maemo-resource-manager
  make
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/doc/$_basename" -m644 doc/README* doc/*.txt

  # remove maemo plugin configuration (it overrides defaults for pcm and ctl),
  # until a better way is found to package default overrides:
  # https://bugs.archlinux.org/task/65440
  rm -v "${pkgdir}/etc/alsa/conf.d/98-maemo.conf"

  # make a proper off-by-default config template out of the example file
  mv -v "${pkgdir}/etc/alsa/conf.d/99-pulseaudio-default.conf.example" \
    "${pkgdir}/usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf"
}
# vim:set sw=2 et:
