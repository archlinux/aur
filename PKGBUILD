pkgname=viogsf-git
pkgver=r21.f171786
pkgrel=1
pkgdesc="Library for decoding GBA Sound Format (GSF) files"
arch=(i686 x86_64)
url='https://github.com/kode54/viogsf'
license=(GPL2 LGPL2.1)
depends=(glibc gcc-libs)
makedepends=(git qtchooser)
source=(${pkgname}::git+https://github.com/kode54/viogsf.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"

  # Don't request a static lib, it prevents a dynamic one from being built.
  sed -i '/^CONFIG /s/ staticlib//' viogsf.pro

  # Install the header files too.
  cat >> viogsf.pro <<EOF
headers_gba.path = /usr/include/vbam/gba
headers_common.path = /usr/include/vbam/common
headers_apu.path = /usr/include/vbam/apu
headers_gba.files += vbam/gba/GBA.h vbam/gba/Sound.h vbam/gba/Globals.h
headers_common.files += vbam/common/Types.h
headers_apu.files += vbam/apu/Gb_Apu.h vbam/apu/Gb_Oscs.h vbam/apu/Multi_Buffer.h vbam/apu/blargg_common.h vbam/apu/Blip_Buffer.h vbam/apu/blargg_config.h
INSTALLS += headers_gba headers_common headers_apu
EOF
}


build() {
  cd "$srcdir/$pkgname"
  qmake viogsf.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set sw=2 et:
