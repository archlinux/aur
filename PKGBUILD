# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot' 'foot-terminfo')
pkgver=1.2.2
pkgrel=1
arch=('x86_64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
depends=('libxkbcommon' 'wayland' 'pixman')
source=(https://codeberg.org/dnkl/foot/archive/1.2.2.tar.gz
        https://codeberg.org/dnkl/tllist/archive/1.0.0.tar.gz
        https://codeberg.org/dnkl/fcft/archive/1.1.4.tar.gz)
sha256sums=('52e4e8fde260bb4a22c9644038b6bb6320ab75bf10e06cc619180df1ce47e481'
            '115f067f6b7029959fea39e45ec64697806e901fe4ca2de67c7eb2af4b7d2ae2'
            '4f6fb4d16fd973fcfc296fdfd34eefb1444d6e38bef98009c32fbed47ad06ba9')

build() {
  cd foot

  mkdir -p subprojects
  pushd subprojects
  ln -sf ../../tllist .
  ln -sf ../../fcft .
  popd

  meson --prefix=/usr --buildtype=release --wrap-mode=forcefallback -Db_lto=true -Dc_args="-Wno-missing-profile" . build

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
  pkgdesc="A wayland native terminal emulator"
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
