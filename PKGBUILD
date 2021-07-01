# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
pkgname=foot
pkgver=1.8.1  # Don’t forget to update CHANGELOG.md
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
changelog=CHANGELOG.md
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'fcft' 'foot-terminfo')
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols' 'tllist')  # ‘llvm’, for PGO with clang
checkdepends=('check')
optdepends=('libnotify: desktop notifications'
            'xdg-utils: URI launching'
            'bash-completion: bash completions for foot itself')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('53df83617f7fbdd0f8f4c7a06e6e1716da61dbdcfb16aa65383ed31f4996195d')

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

  meson \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nodownload \
    -Db_lto=true \
    -Dterminfo-install-location=disabled \
    . build

  if [[ ${do_pgo} == yes ]]; then
    find -name "*.gcda" -delete
    meson configure -Db_pgo=generate build
    ninja -C build

    local script_options="--scroll --scroll-region --colors-regular --colors-bright --colors-256 --colors-rgb --attr-bold --attr-italic --attr-underline --sixel"

    local tmp_file=$(mktemp)

    if [[ -v WAYLAND_DISPLAY ]]; then
      # TODO: remove the sleep in the next release (with SIGWINCH
      # fixes in generate-alt-random-writes.py)
      build/footclient --version
      build/foot \
        --config /dev/null \
        --term=xterm \
        sh -c "sleep 2 && ./scripts/generate-alt-random-writes.py ${script_options} ${tmp_file} && cat ${tmp_file}"
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

package() {
  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
