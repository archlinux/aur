# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
pkgname=zrythm
pkgver=0.6.003
pkgrel=2
pkgdesc='An highly automated, intuitive, Digital Audio Workstation (DAW)'
arch=('x86_64' 'i686')
url='https://www.zrythm.org'
license=('AGPL3')
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext'
  'libsamplerate' 'alsa-lib'
  'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed'
             'meson' 'ninja')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=('zrythm-git')
source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('f6ccc1cc43ccd2fe8cdfbf8a884303a50e52fcd504d331a7ba754ca2508e4e43'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')

rootdir="${pkgname}-${pkgver}"

build() {
  cd ${rootdir}/
  mkdir -p build
  cd build && meson --prefix=/usr .. -Denable_tests=true
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
