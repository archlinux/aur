# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

_enable_gtk=true
_enable_qt=true

_pkgname=audacious-plugins
pkgname="$_pkgname-git"
pkgver=4.4.r0.gb29776eee
pkgrel=1
epoch=1
pkgdesc="Plugins for Audacious (git version)"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('audacious-git'
         'alsa-lib' 'curl' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'json-glib' 'lame' 'libbs2b' 'libcddb' 'libcdio-paranoia'
         'libcue' 'libmms' 'libmodplug' 'libmtp' 'libnotify' 'libopenmpt'
         'libpipewire' 'libpulse' 'libsamplerate' 'libsidplayfp' 'libvorbis'
         'lirc' 'mpg123' 'neon' 'opusfile' 'wavpack')
makedepends=('meson' 'git' 'glib2-devel')
source=("git+https://github.com/audacious-media-player/$_pkgname.git"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/$_pkgname/-/raw/main/sidplay-rom-paths.patch")
sha256sums=('SKIP'
            'c32cd36f75dd18db082f9b9447f1c0982279703b9d648f5695295ff25c9b678d')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^audacious-plugins-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # set paths for ROM files from vice for sidplay
  patch -Np1 -i ../sidplay-rom-paths.patch
}

build() {
  arch-meson $_pkgname build \
    -D gtk="$_enable_gtk" \
    -D qt="$_enable_qt"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
