# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot' 'foot-terminfo')
pkgver=1.4.0
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman')
source=(https://codeberg.org/dnkl/foot/archive/1.4.0.tar.gz
        https://codeberg.org/dnkl/tllist/archive/1.0.1.tar.gz
        https://codeberg.org/dnkl/fcft/archive/2.2.2.tar.gz)
sha256sums=('a3685b865ffb1541d862a50acb7cc7317c9264541163512014c85b520af20a20'
            'baa94259ee6a8cc9114cf59cf58395a7f6537d36909e8bed036f0da7457b6a0e'
            '9bc54b5ccb637f6c8270697c886e3e86cb4ffb6042b1d4a32eaaee854fb0837d')

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
