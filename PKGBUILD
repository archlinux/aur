# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
pkgname=zrythm
pkgver=0.6.039
pkgrel=1
pkgdesc='An highly automated, intuitive, Digital Audio Workstation (DAW)'
arch=('x86_64' 'i686')
url='https://www.zrythm.org'
license=('AGPL3')
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext'
  'libsamplerate' 'alsa-lib'
  'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed'
             'meson' 'ninja' 'help2man' 'python-sphinx')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=('zrythm-git')
source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('c9b04756085ba2158b08e18add99d608159f528f36f580cfadf462e134358288'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')

rootdir="${pkgname}-${pkgver}"

build() {
  cd ${rootdir}/
  mkdir -p build
  cd build && meson --prefix=/usr .. -Denable_tests=true -Duser_manual=true -Dmanpage=true
  ninja
}

check() {
  cd ${rootdir}/
  cd build && ninja test
}

package() {
  cd ${rootdir}/
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  cd build && DESTDIR="${pkgdir}/" ninja install
}
