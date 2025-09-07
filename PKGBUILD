# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=audacious-plugins
pkgname=$_pkgname-gtk3
pkgver=4.5.1
pkgrel=1
pkgdesc="Plugins for Audacious"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
depends=("audacious-gtk3>=$pkgver"
         'alsa-lib' 'curl' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'json-glib' 'lame' 'libbs2b' 'libcddb' 'libcdio-paranoia'
         'libcue' 'libmms' 'libmodplug' 'libmtp' 'libnotify' 'libopenmpt'
         'libpipewire' 'libpulse' 'libsamplerate' 'libsidplayfp' 'libvorbis'
         'lirc' 'mpg123' 'neon' 'opusfile' 'wavpack')
makedepends=('meson' 'glib2-devel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/$_pkgname/-/raw/main/sidplay-rom-paths.patch")
sha256sums=('f4feedc32776acfa9d24701d3b794fc97822f76da6991e91e627e70e561fdd3b'
            'c32cd36f75dd18db082f9b9447f1c0982279703b9d648f5695295ff25c9b678d')

prepare() {
  cd $_pkgname-$pkgver

  # set paths for ROM files from vice for sidplay
  patch -Np1 -i ../sidplay-rom-paths.patch
}

build() {
  arch-meson $_pkgname-$pkgver build \
    -Dqt=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
