# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dexed-vst
pkgname="${_pkgname}-git"
pkgver=0.9.0.r112.39d3c28
pkgrel=1
pkgdesc="A VST plugin synth closely modelled on the Yamaha DX7"
arch=('i686' 'x86_64')
url="http://plugin.org.uk/"
license=("GPL3")
groups=('vst-plugins')
depends=('alsa-lib' 'libxext' 'gcc-libs-multilib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/asb2m10/dexed.git"
        'http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip')
md5sums=('SKIP'
         '1ac422ebb4aa2e86061278412c347b55')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(cpp -dM Source/Dexed.h | grep DEXED_VERSION | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}/Builds/Linux"
  sed -i -e "s|-I ~/src/vstsdk2.4|-I $srcdir/VST3\\\\ SDK|" Makefile
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
