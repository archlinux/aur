# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot-git' 'foot-terminfo-git')
pkgver=1.3.0
pkgrel=2
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman')
source=(git+https://codeberg.org/dnkl/foot.git
        git+https://codeberg.org/dnkl/tllist.git
        git+https://codeberg.org/dnkl/fcft.git)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

package_foot-git() {
  pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
  optdepends=('foot-terminfo: terminfo for foot')
  conflicts=('foot')
  provides=('foot')

  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  rm -rf "${pkgdir}/usr/share/terminfo"
}

package_foot-terminfo-git() {
  pkgdesc="Terminfo files for the foot terminal emulator"
  depends=('ncurses')
  conflicts=('foot-terminfo')
  provides=('foot-terminfo')

  cd foot
  install -dm 755 "${pkgdir}/usr/share/terminfo/f/"
  cp build/f/* "${pkgdir}/usr/share/terminfo/f/"
}
