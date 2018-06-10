# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=oxefmsynth
pkgname="${_pkgname}-git"
pkgver=1.3.6.r113.f42210e
pkgrel=1
pkgdesc="An 8-OP FM synthesizer VST plug-in (git version)"
arch=('i686' 'x86_64')
url="http://www.oxesoft.com/"
license=('GPL3')
depends=('mesa')
makedepends=('steinberg-vst36' 'git')
provides=('oxefmsynth')
conflicts=('oxefmsynth')
source=("${_pkgname}::git+https://github.com/oxesoft/oxefmsynth.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(grep '#define VERSION_STR' src/synth/constants.h | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  for file in Makefile.vstlinux \
        src/vst/oxevst.h \
        src/vst/oxevsteditor.h \
        src/vst/oxevsteditor.cpp \
        src/vst/vsthostinterface.cpp; do
    sed -i -e 's|public.sdk/source/vst2.x/||g' "$file"
  done

  sed -i -e 's| "VERSION_STR| " VERSION_STR|' src/synth/constants.h
  sed -i -e 's|BMP_PATH| BMP_PATH |' src/toolkits/xlibtoolkit.cpp
}

build() {
  cd "${srcdir}/${_pkgname}"

  export VSTSDK_PATH="/usr/include/vst36"
  export CFLAGS="$CFLAGS -std=c++11 -Wno-narrowing"
  make -f Makefile.vstlinux LIBS="-lX11 -lGL -lpthread -ldl"
}

package() {
  cd "${srcdir}/${_pkgname}"

  if [[ $CARCH == 'i686' ]]; then
    _arch=32
  elif [[ $CARCH == 'x86_64' ]]; then
    _arch=64
  fi

  install -D oxevst${_arch}.so "$pkgdir/usr/lib/vst/oxevst${_arch}.so"
}
