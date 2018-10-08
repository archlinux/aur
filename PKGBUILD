# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=pulseaudio-equalizer-ladspa-git
pkgver=3.0.0.56.20fb09c
pkgrel=1
pkgdesc='A 15-band equalizer for PulseAudio'
arch=('any')
url='https://github.com/pulseaudio-equalizer-ladspa'
license=('GPL3')
depends=('python-gobject' 'gtk3' 'swh-plugins' 'pulseaudio' 'bc')
makedepends=('git' 'meson')
optdepends=('python2-gobject: python2 support')
source=("git+$url/equalizer")
sha512sums=('SKIP')

pkgver() {
  cd equalizer


  printf "%s.r%s.%s" \
  	$(git tag | tail -n1 | sed 's|v||') \
  	$(git rev-list --count HEAD | sed 's|r||') \
  	$(git rev-parse --short HEAD)
}

build() {
  mkdir -p equalizer/build
  cd equalizer/build

  arch-meson ..

  ninja
}

package() {
  cd equalizer/build

  DESTDIR="$pkgdir" meson install

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  # It's GLP3 but has a specific copyright string
  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

