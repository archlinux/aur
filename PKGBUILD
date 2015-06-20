# Maintainer: Christopher Arndt <chris@chrisarndt.de>

_pkgname=dexed-vst
pkgname="${_pkgname}-git"
pkgver=0.8.0.r97.1eda313
pkgrel=1
pkgdesc="A VST plugin synth closely modeled on the Yamaha DX7"
arch=('i686' 'x86_64')
url="http://plugin.org.uk/"
license=("GPL3")
groups=('vst-plugins')
depends=('alsa-lib' 'libxext' 'gcc-libs-multilib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/asb2m10/dexed.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(cpp -dM Source/Dexed.h | grep DEXED_VERSION | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"

  rm -rf vstsdk2.4
  if [ ! -e "$startdir/vst_sdk2.4_rev2.zip" ]; then
    error "This package needs the Steinberg VST SDK 2.4rev2 to build."
    plain "Place the file vst_sdk2.4-rev2.zip next to PKGBUILD manually."
  fi
  unzip "$startdir/vst_sdk2.4_rev2.zip" -d "$srcdir"

  cd "$srcdir/${_pkgname}/Builds/Linux"
  sed -i -e "s|-I ~/src/vstsdk2.4|-I $srcdir/vstsdk2.4|" Makefile
}

build() {
  cd "${srcdir}/${_pkgname}/Builds/Linux"

  make CONFIG=Release
}

package() {
  cd "${srcdir}/${_pkgname}/Builds/Linux"

  install -Dm755 build/Dexed.so "${pkgdir}/usr/lib/vst/Dexed.so"
}

# vim:set ts=2 sw=2 et:
