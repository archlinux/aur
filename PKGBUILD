# Maintainer: David Runge <dave@sleepmap.de>
pkgname=zam-plugins
pkgver=3.10
pkgrel=2
pkgdesc="Collection of LADSPA/LV2/VST/JACK audio plugins for high-quality processing"
arch=('x86_64')
url="https://github.com/zamaudio/zam-plugins"
license=('GPL2')
groups=('ladspa-plugins' 'lv2-plugins' 'pro-audio' 'vst-plugins')
depends=('fftw' 'libglvnd' 'jack' 'liblo' 'zita-convolver')
makedepends=('git' 'ladspa' 'libx11' 'libgl' 'liblo' 'lv2')
source=("$pkgname-$pkgver::git+https://github.com/zamaudio/${pkgname}.git#tag=${pkgver}"
        "git+https://github.com/distrho/dpf.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule init
  git config submodule.dpf.url "${srcdir}/dpf"
  git submodule update
  # use system zita-convolver
  sed -e 's|\"../../lib/zita-convolver-3.1.0/zita-convolver.h\"|<zita-convolver.h>|' \
    -i plugins/Zam{Verb,HeadX2}/convolution.{cpp,hpp}
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm644 {README.md,changelog}
}
