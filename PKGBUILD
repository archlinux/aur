# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=helm
pkgname="${_pkgname}-git"
pkgver=0.3.3.r958.0741c59
pkgrel=1
pkgdesc="a cross-platform, polyphonic synthesizer LV2 and VST plugin"
arch=('i686' 'x86_64')
url="http://tytel.org/helm/"
license=('GPL')
groups=('lv2-plugins' 'vst-plugins')
depends=('alsa-lib' 'mesa' 'lv2')
makedepends=('git' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/mtytel/helm.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}"

  if [ ! -d vstsdk2.4 ]; then

    if [ ! -e "$startdir/vst_sdk2.4_rev2.zip" ]; then
      error "This package needs the Steinberg VST SDK 2.4rev2 to build."
      plain "Place the file vst_sdk2.4-rev2.zip next to PKGBUILD manually."
    fi

    unzip "$startdir/vst_sdk2.4_rev2.zip"
  fi

  cd "$srcdir/${_pkgname}/builds/linux/VST"
  sed -i -e "s|-I ~/srcs/vstsdk2.4|-I $srcdir/vstsdk2.4|" Makefile
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
