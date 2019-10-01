# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
pkgname=zrythm
pkgver=0.6.480
pkgrel=1
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk3' 'lilv' 'libx11' 'jack' 'libsndfile'
  'libyaml' 'libsamplerate' 'alsa-lib' 'fftw'
  'suil')
makedepends=(
  'python' 'gettext' 'sed'
  'meson' 'ninja' 'help2man' 'python-sphinx'
  'ladspa' 'lv2')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=('zrythm-git')
source=("https://www.zrythm.org/releases/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('8a9452f8e8571909896204a07dfcc4c53ce0dbaf5fa4ccc30ee1bca63ed5f52d'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')

build() {
  cd "$pkgname-$pkgver"
  meson build --buildtype=release --prefix=/usr -Denable_tests=true -Duser_manual=true -Dmanpage=true
  ninja -C build
}

check() {
  cd "$pkgname-$pkgver"
  ninja -C build test
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 AUTHORS CONTRIBUTING.md CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  DESTDIR="${pkgdir}/" ninja -C build install
}
