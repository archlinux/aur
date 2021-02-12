# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
pkgname=zrythm
pkgver=alpha.11.0.2
pkgrel=3
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk3' 'lilv' 'libx11' 'jack' 'libsndfile' 'libyaml' 'libsamplerate' 'alsa-lib' 'fftw'
         'suil' 'breeze-icons' 'lv2' 'rubberband')
makedepends=('ruby-sass' 'python' 'gettext' 'sed' 'python-sphinx-intl'
  'meson' 'ninja' 'help2man' 'python-sphinx'
  'ladspa' 'lv2' 'gtksourceview3')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=('zrythm-git')
source=("https://www.zrythm.org/releases/$pkgname-1.0.0-$pkgver.tar.xz"{,.asc})
sha256sums=('7bdfc2245adf5582d39dd8dfd17c2ccbab41838d46e9325336ccfa2649d0ed74' 'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')
build() {
  cd "$pkgname-1.0.0-$pkgver"
  meson build --buildtype=release --prefix=/usr \
    -Denable_tests=true -Duser_manual=true \
    -Dmanpage=true
  ninja -C build
}

check() {
  cd "$pkgname-1.0.0-$pkgver"
  ninja -C build test
}

package() {
  cd "$pkgname-1.0.0-$pkgver"
  install -vDm 644 AUTHORS CONTRIBUTING.md \
    CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  DESTDIR="${pkgdir}/" ninja -C build install
}
