# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot' 'foot-terminfo')
pkgver=1.5.1
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'freetype2')
source=(https://codeberg.org/dnkl/foot/archive/1.5.1.tar.gz
        https://codeberg.org/dnkl/tllist/archive/1.0.4.tar.gz
        https://codeberg.org/dnkl/fcft/archive/2.3.1.tar.gz)
sha256sums=('ab17c3c3b504275c86998b954b9ae1f0e5fc895611be26d2cc26c78e498ced9d'
            'a135934d4955902d67f75f3c542ace3bfb7be3be9c44796852e76ea9e1d82b33'
            '4a8ed7e9818a391ec422ec8ee561fccf2586410c1bfc86ecc64026a5cf8bc18c')

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

  # TODO: add -Dfcft:test-text-shaping=false
  meson --prefix=/usr --buildtype=release --wrap-mode=forcefallback -Db_lto=true -Dfcft:text-shaping=disabled -Dfcft:test-text-shaping=false . build

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
