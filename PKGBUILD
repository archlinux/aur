# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=helm
pkgname="${_pkgname}-git"
pkgver=0.3.3.r958.0741c59
pkgrel=2
pkgdesc="a cross-platform, polyphonic synthesizer LV2 and VST plugin"
arch=('i686' 'x86_64')
url="http://tytel.org/helm/"
license=('GPL')
groups=('lv2-plugins' 'vst-plugins')
depends=('alsa-lib' 'mesa' 'lv2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/mtytel/helm.git"
        'http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip')
md5sums=('SKIP'
         '1ac422ebb4aa2e86061278412c347b55')
changelog=ChangeLog


prepare() {
  cd "$srcdir/${_pkgname}/builds/linux/VST"
  sed -i -e "s|-I ~/srcs/VST3\\\\ SDK|-I $srcdir/VST3\\\\ SDK|" Makefile
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver="$(grep 'JUCERPROJECT.*version' helm.jucer | sed 's/.*version=\"\(.*\)\".*/\1/')"
  echo "${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="/usr" all vst
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
  install -D builds/linux/VST/build/helm.so "$pkgdir/usr/lib/vst/helm.so"
}
