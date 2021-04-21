# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot-git' 'foot-terminfo-git')
pkgver=1.7.2
pkgrel=2
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols' 'tllist')  # ‘llvm’, for PGO with clang
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'freetype2' 'fcft')
source=(git+https://codeberg.org/dnkl/foot.git)
sha256sums=('SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd foot

  local compiler=other
  local do_pgo=no

  # makepkg uses -O2 by default, but we *really* want -O3
  CFLAGS+=" -O3"

  # Figure out which compiler we're using, and whether or not to do PGO
  case $(${CC-cc} --version) in
    *GCC*)
      compiler=gcc
      do_pgo=yes
      ;;

    *clang*)
      compiler=clang

      # We need llvm to be able to manage the profiling data
      if command -v llvm-profdata > /dev/null; then
        do_pgo=yes

        # Meson adds -fprofile-correction, which Clang doesn't
        # understand
        CFLAGS+=" -Wno-ignored-optimization-argument"
      fi
      ;;
  esac

  meson --prefix=/usr --buildtype=release -Db_lto=true . build

  if [[ ${do_pgo} == yes ]]; then
    find -name "*.gcda" -delete
    meson configure -Db_pgo=generate build
    ninja -C build

    # Need to run tests here, to ensure *all* generated binaries have
    # profiling data (including e.g. unit tests from fcft/tllist).
    ninja -C build test

    local script_options="--scroll --scroll-region --colors-regular --colors-bright --colors-256 --colors-rgb --attr-bold --attr-italic --attr-underline --sixel"

    local tmp_file=$(mktemp)

    if [[ -v WAYLAND_DISPLAY ]]; then
      build/footclient --version
      build/foot \
        --config /dev/null \
        --term=xterm \
        sh -c "./scripts/generate-alt-random-writes.py ${script_options} ${tmp_file} && cat ${tmp_file}"
    else
      build/footclient --version
      build/foot --version
      ./scripts/generate-alt-random-writes.py \
        --rows=67 \
        --cols=135 \
        ${script_options} \
        ${tmp_file}
      build/pgo ${tmp_file} ${tmp_file} ${tmp_file}
    fi

    rm "${tmp_file}"

    if [[ ${compiler} == clang ]]; then
      llvm-profdata merge default_*profraw --output=build/default.profdata
    fi

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
  depends+=('foot-terminfo')
  optdepends=('libnotify: desktop notifications'
              'xdg-utils: URI launching'
              'bash-completion: bash completions for foot itself')
  conflicts=('foot')
  provides=('foot')

  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  rm -rf "${pkgdir}/usr/share/terminfo"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/foot/LICENSE"
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
