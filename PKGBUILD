# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Brandon Mulcahy <brandon@jangler.info>
pkgname=schismtracker-git
pkgver=20240909.r16.g3b88cf3
pkgrel=1
pkgdesc='A reimplementation of the Impulse Tracker music editor.'
arch=('i686' 'x86_64' 'armv7h')  # and likely many more
url='https://schismtracker.org/'
license=('GPL-2.0-only')
depends=('libutf8proc' 'sdl2' 'hicolor-icon-theme')
optdepends=(
  'alsa-lib: ALSA MIDI support'
  'jack: JACK output support'
  'flac: FLAC sample loading support'
)
makedepends=('git')
provides=("schismtracker=${pkgver}")
conflicts=('schismtracker')
source=("$pkgname::git+https://github.com/schismtracker/schismtracker.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  # rename desktop file and application icons, for 'extra' package parity
  sed -e 's/schism.desktop/schismtracker.desktop/' -i Makefile.am
  sed -e 's/schism-icon-128/schismtracker/' -i sys/fd.org/schism.desktop
  mv sys/fd.org/{schism,schismtracker}.desktop
}

build() {
  cd "$pkgname"
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  # delete old application icon
  rm -rf "$pkgdir/usr/share/pixmaps"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/${pkgname%%-git}" \
          docs/configuration.md README.md

  # application icons
  for i in 16 22 24 32 36 48 64 72 96 128 192; do
    install -vDm644 "icons/schism-icon-${i}.png" \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%%-git}.png"
  done
  install -vDm644 icons/schism-icon.svg \
          "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%%-git}.svg"
}
