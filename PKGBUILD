# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot' 'foot-terminfo')
pkgver=1.5.4  # Don’t forget to update CHANGELOG.md
pkgrel=3
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'freetype2')
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
checkdepends=('check')
source=(https://codeberg.org/dnkl/foot/archive/1.5.4.tar.gz
        https://codeberg.org/dnkl/tllist/archive/1.0.4.tar.gz
        https://codeberg.org/dnkl/fcft/archive/2.3.2.tar.gz)
sha256sums=('e03b2255c5bb2df3ca456fb28a31b48e2cac42b0c6a3df9b0154202ab3aecad5'
            'a135934d4955902d67f75f3c542ace3bfb7be3be9c44796852e76ea9e1d82b33'
            '726fdebb1d29bc40c665015666fd9037981c0b4d0ba3ecafa1994053091e7fa8')

build() {
  cd foot

  mkdir -p subprojects
  pushd subprojects
  ln -sf ../../tllist .
  ln -sf ../../fcft .
  popd

  # makepkg uses -O2 by default, but we *really* want -O3
  # -Wno-missing-profile since we're not exercising everything when doing PGO builds
  export CFLAGS+=" -O3 -Wno-missing-profile"

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
  changelog=CHANGELOG.md
  depends+=('foot-terminfo')

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
