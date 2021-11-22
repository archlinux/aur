# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

_basename=alsa-plugins
pkgname=(alsa-plugins-git pulseaudio-alsa-git)
pkgver=1.2.5.r29.gda157e9
pkgrel=1
epoch=1
pkgdesc="Additional ALSA plugins"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL2.1)
makedepends=(alsa-lib dbus jack libavtp libpulse libsamplerate speexdsp ffmpeg)
source=(git+https://github.com/alsa-project/alsa-plugins.git
        pulse-sysdefault.diff)
sha512sums=('SKIP'
            'b8c8e55f4da0ae87cc44d75a906d00b4f1e2304e6bc10419c6e0913c8f7d29599a3f3d41733decbe412a4669ea0d5af2a57f85b1655fba3625fbbd33c956f3f9')
b2sums=('SKIP'
        '83c16b77c1737b2b59b60302be22b63e53026a366799fd97fe3c03b86756063d1b9689d5ffc7c793b40db55bdb79a5b6d72a17e0c8aa32364d6e639cf7ad3ce0')

pkgver() {
  cd $_basename
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_basename

  # Make use of the pulse plugin's "fallback" feature
  # Keeps parity with our old config from pulseaudio-alsa
  patch -Np1 -i ../pulse-sysdefault.diff

  # a52, lavrate plugins not compatible with ffmpeg >= 4.0
  # https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/159425.html
  # https://bugs.archlinux.org/task/60586
  autoreconf -fvi
}

build() {
  cd $_basename
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-maemo-plugin \
    --enable-maemo-resource-manager
  make
}

package_alsa-plugins-git() {
  provides=('alsa-plugins=1.2.5')
  conflicts=(alsa-plugins)
  depends=(glibc libasound.so)
  optdepends=('dbus: for maemo plugin'
              'jack: for pcm_jack plugin'
              'libavtp: for pcm_aaf plugin'
              'libsamplerate: for rate_samplerate plugin'
              'libpulse: for conf_pulse, ctl_pulse and pcm_pulse plugins'
              'speexdsp: for pcm_speex and rate_speexrate plugins'
              'ffmpeg: for pcm_a52 plugin')

  cd $_basename
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/doc/$pkgbase" -m644 doc/README* doc/*.txt

  # remove maemo plugin configuration (it overrides defaults for pcm and ctl),
  # until a better way is found to package default overrides:
  # https://bugs.archlinux.org/task/65440
  rm -v "${pkgdir}/etc/alsa/conf.d/98-maemo.conf"

  # make a proper off-by-default config template out of the example file
  mv -v "${pkgdir}/etc/alsa/conf.d/99-pulseaudio-default.conf.example" \
    "${pkgdir}/usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf"
}

package_pulseaudio-alsa-git() {
  provides=('pulseaudio-alsa')
  conflicts=(pulseaudio-alsa)
  pkgdesc="ALSA Configuration for PulseAudio"
  depends=('alsa-plugins>=1.2.2-2' pulseaudio)

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf
}
