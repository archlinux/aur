# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot' 'foot-terminfo')
pkgver=1.4.4
pkgrel=3
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'freetype2')
source=(https://codeberg.org/dnkl/foot/archive/1.4.4.tar.gz
        https://codeberg.org/dnkl/tllist/archive/1.0.2.tar.gz
        https://codeberg.org/dnkl/fcft/archive/2.2.5.tar.gz)
sha256sums=('0d00e30d38c50b67138535bbcb6f2ea0e27b83b160823842cffbe79f9cc5de30'
            '8fe933e4614aed35aa6dfb6ab3105b2c2d6eb80a75bd3e93d4445ce6efd3dba0'
            '1c3121376e25e0201426739ab47dd23f4198d0d629a4727e0d962af291131a94')

build() {
  cd foot

  mkdir -p subprojects
  pushd subprojects
  ln -sf ../../tllist .
  ln -sf ../../fcft .
  popd

  # makepkg uses -O2 by default, but we *really* want -O3
  # -Wno-missing-profile since we're not exercising everything when doing PGO builds
  # -fno-plt because performance (this is the default in makepkg anyway)
  export CFLAGS+=" -O3 -Wno-missing-profile -fno-plt"

  meson --prefix=/usr --buildtype=release --wrap-mode=forcefallback -Db_lto=true . build

  if [[ -v WAYLAND_DISPLAY ]]; then
    meson configure -Db_pgo=generate build
    find -name "*.gcda" -delete
    ninja -C build

    tmp_file=$(mktemp)
    build/foot --config /dev/null --term=xterm -- sh -c "./scripts/generate-alt-random-writes.py --scroll --scroll-region --colors-regular --colors-bright --colors-rgb ${tmp_file} && cat ${tmp_file}"
    rm "${tmp_file}"

    meson configure -Db_pgo=use build
  fi

  ninja -C build
}

check() {
  cd foot
  ninja -C build test
}

package_foot() {
  pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
  optdepends=('foot-terminfo: terminfo for foot')

  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  rm -rf "${pkgdir}/usr/share/terminfo"
}

package_foot-terminfo() {
  pkgdesc="Terminfo files for the foot terminal emulator"
  depends=('ncurses')

  cd foot
  install -dm 755 "${pkgdir}/usr/share/terminfo/f/"
  cp build/f/* "${pkgdir}/usr/share/terminfo/f/"
}
