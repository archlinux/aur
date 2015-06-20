# Maintainer:  Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jackass
pkgname="${_pkgname}-git"
pkgver=1.0.r13.adcd7eb
_pkgver=1.0
pkgrel=1
pkgdesc="A VST plugin that provides JACK-MIDI support for VST hosts."
arch=('i686' 'x86_64')
url="https://github.com/falkTX/JackAss/"
license=('MIT')
depends=('gcc-libs-multilib' 'wine')
makedepends=('git' 'unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/falkTX/JackAss.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo ${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  rm -rf vstsdk2.4

  if [ ! -e "$startdir/vst_sdk2.4_rev2.zip" ]; then
    error "This package needs the Steinberg VST SDK 2.4rev2 to build."
    plain "Place the file vst_sdk2.4-rev2.zip next to PKGBUILD manually."
  fi

  unzip "$startdir/vst_sdk2.4_rev2.zip"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make linux wine32 wine64
}

package() {
  cd "${srcdir}/${_pkgname}"

  for plugin in JackAss.so JackAssFx.so; do
    install -D -m644 $plugin "${pkgdir}/usr/lib/vst/$plugin"
  done

  for plugin in JackAssWine32.dll JackAssWine64.dll JackAssFxWine32.dll \
                JackAssFxWine64.dll; do
    install -D -m644 $plugin "${pkgdir}/usr/lib/jackass/$plugin"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:set ts=2 sw=2 et:
