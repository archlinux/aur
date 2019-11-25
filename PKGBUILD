# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=helm
pkgname="${_pkgname}-git"
pkgver=0.9.0.r1897.abdedd52
pkgrel=2
pkgdesc="a cross-platform, polyphonic synthesizer LV2 and VST plugin"
arch=('i686' 'x86_64')
url="http://tytel.org/helm/"
license=('GPL')
groups=('lv2-plugins' 'vst-plugins')
depends=('alsa-lib' 'curl' 'freetype2' 'hicolor-icon-theme' 'mesa' 'libxinerama' 'lv2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/mtytel/helm.git"
        'juce-gcc.diff')
md5sums=('SKIP'
         '2495dfc19287544c0ac87dae3837b3be')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver="$(grep 'JUCERPROJECT.*version' helm.jucer | sed 's/.*version=\"\(.*\)\".*/\1/')"
  echo "${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -p1 -N -i "${srcdir}"/juce-gcc.diff
}

build() {
  cd "${srcdir}/${_pkgname}"

  make CONFIG=Release PREFIX="/usr" all vst
}

package() {
  cd "${srcdir}/${_pkgname}"

  make \
    CONFIG=Release \
    PREFIX="/usr" \
    DESTDIR="$pkgdir" \
    VSTDIR="$pkgdir/usr/lib/vst" \
    install
}
