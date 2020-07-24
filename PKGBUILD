# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=foo-yc20
_faust_version=0.9.73-mr2
_faust_commit=40a919756d09c6b2de19b3299b7eef55997551dc
pkgname="${_name}-git"
pkgver=1.3.0.r330.b99d4a3
pkgrel=3
pkgdesc="An emulation of the Yamaha YC-20 combo organ as an LV2 plugin and a standalone program (git version)"
arch=('x86_64' 'armv7l')
url="https://github.com/sampov2/foo-yc20"
license=('BSD')
depends=('gtk2' 'jack')
groups=('pro-audio' 'lv2-plugins')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+https://github.com/sampov2/foo-yc20.git"
        # we need an obsolete version of FAUST as a build dependency,
        # for which there is, unfortuantely, no release tag or archive
        # just a branch, so we pin the commit for the checkout archive we're retrieving
        "faust-${_faust_version}.tar.gz::https://github.com/grame-cncm/faust/archive/${_faust_commit}.tar.gz"
        'foo-yc20-makefile-ldflags.patch')
sha256sums=('SKIP'
            '74ad05cd5d508e30d78f31ff230e29793dc1cdb4f156cdb2afe43ac119f82701'
            '5408a958c15bf39d0034c6aeb0a86652a4bb34dd403780e3438bd7bf5e3f45ee')


pkgver() {
  cd "${srcdir}/${_name}"
  local ver="$(git tag | sort -r | head -n 1)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_name}"

  # Fix LDFLAGS position
  patch -p1 -N -i "${srcdir}/foo-yc20-makefile-ldflags.patch"

  # Insert project version into Makefile
  VERSION="$(git tag --sort=-taggerdate | head -n 1)"
  sed -i -e 's/^VERSION=/VERSION='$VERSION'/' Makefile

  # Adapted from: https://github.com/zynthian/zynthian-sys/blob/master/scripts/recipes/install_foo-yc20.sh
  sed -i -e 's|-Iinclude/|-Iinclude -I'${srcdir}'/faust-'${_faust_commit}'/architecture|' Makefile
  sed -i -e 's/= NULL/= 0/' src/faust-dsp-standalone.cpp
  sed -i -e 's/= NULL/= 0/' src/faust-dsp-plugin.cpp

  # Fix icon name
  sed -i -e 's/^Icon=.*/Icon=foo-yc20/' foo-yc20.desktop.in

  # Workaround for wrong include paths in foo-yc20 sources
  cd "${srcdir}/faust-${_faust_commit}/architecture/faust/audio"
  ln -sf ../dsp/dsp.h .
}

build() {
  cd "${srcdir}/${_name}"

  # Adapted from: https://github.com/zynthian/zynthian-sys/blob/master/scripts/recipes/install_foo-yc20.sh
  if [[ "$(uname -m)" = "armv7l" ]]; then
    model="$(cat /proc/device-tree/model)"

    if [[ ${model} =~ "Raspberry Pi 4" ]]; then
      export CFLAGS="$CFLAGS -O3 -ffast-math -ftree-vectorize -mcpu=cortex-a7 -mtune=cortex-a7 -mfpu=neon-vfpv4"
    else
      export CFLAGS="$CFLAGS -O3 -ffast-math -ftree-vectorize -mcpu=cortex-a53 -mtune=cortex-a53 -mfpu=neon-fp-armv8"
    fi
  else
    export CFLAGS="$CFLAGS -O3 -ffast-math -ftree-vectorize"
  fi

  export LDFLAGS_YC20="$LDFLAGS"
  export LDFLAGS_YC20_CLI="$LDFLAGS"
  export LDFLAGS_YC20_LV2="$LDFLAGS"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
  # Fix icon install location
  install -Dm644 graphics/icon.png "${pkgdir}"/usr/share/pixmaps/foo-yc20.png
  rm -rf "${pkgdir}/usr/share/foo-yc20"
  # Install documentation
  install -Dm644 README -t "${pkgdir}"/usr/share/doc/${pkgname}
  # Install license
  install -Dm644 LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
