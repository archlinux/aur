# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

# Set to 1 to use Meson build system
_use_meson=0

_pkgname=audacious-plugins
pkgname="$_pkgname-git"
pkgver=4.2.beta1.r5.gf0c055546
pkgrel=1
epoch=1
pkgdesc="Plugins for Audacious (git version)"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD' 'GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('audacious-git'
         'alsa-lib' 'curl' 'dbus-glib' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
         'jack' 'lame' 'libbs2b' 'libcdio-paranoia' 'libcue' 'libmms'
         'libmodplug' 'libmtp' 'libnotify' 'libopenmpt' 'libpulse'
         'libsamplerate' 'libsidplayfp' 'libvorbis' 'lirc' 'mpg123' 'neon'
         'opusfile' 'pipewire' 'qt5-x11extras' 'wavpack')
makedepends=('glib2' 'python' 'git')
source=("git+https://github.com/audacious-media-player/$_pkgname.git")
sha256sums=('SKIP')

if [ "$_use_meson" = 1 ]; then
  makedepends+=('meson')
fi

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^audacious-plugins-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  if [ "$_use_meson" = 1 ]; then
    arch-meson build
    meson compile -C build
  else
    autoreconf
    ./configure --prefix=/usr
    make
  fi
}

package() {
  cd "$_pkgname"

  if [ "$_use_meson" = 1 ]; then
    meson install -C build --destdir "$pkgdir"
  else
    make DESTDIR="$pkgdir" install
  fi

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
