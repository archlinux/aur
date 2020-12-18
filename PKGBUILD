# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot-git' 'foot-terminfo-git')
pkgver=1.6.0
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols')
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'freetype2')
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
  export CFLAGS+=" -O3 -Wno-missing-profile"

  meson --prefix=/usr --buildtype=release --wrap-mode=forcefallback -Db_lto=true -Dfcft:text-shaping=disabled -Dfcft:test-text-shaping=false . build

  find -name "*.gcda" -delete
  meson configure -Db_pgo=generate build
  ninja -C build

  script_options="--scroll --scroll-region --colors-regular --colors-bright --colors-256 --colors-rgb --attr-bold --attr-italic --attr-underline"

  tmp_file=$(mktemp)

  if [[ -v WAYLAND_DISPLAY ]]; then
    build/foot \
      --config /dev/null \
      --term=xterm \
      sh -c "./scripts/generate-alt-random-writes.py ${script_options} ${tmp_file} && cat ${tmp_file}"
  else
    ./scripts/generate-alt-random-writes.py \
      --rows=67 \
      --cols=135 \
      ${script_options} \
      ${tmp_file}
    build/pgo ${tmp_file} ${tmp_file} ${tmp_file}
  fi

  rm "${tmp_file}"

  meson configure -Db_pgo=use build
  ninja -C build
}

check() {
  cd foot
  ninja -C build test
}

package_foot-git() {
  pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
  depends+=('foot-terminfo')
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
