# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=('foot' 'foot-terminfo')
pkgver=1.7.0  # Don’t forget to update CHANGELOG.md
pkgrel=2
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'fcft')
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols' 'tllist')
checkdepends=('check')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('a5a7405956fc1862638712606e502eba11f2561a77f3a9fbbb332f90c8b50ee4')

build() {
  cd foot

  # makepkg uses -O2 by default, but we *really* want -O3
  # -Wno-missing-profile since we're not exercising everything when doing PGO builds
  export CFLAGS+=" -O3 -Wno-missing-profile"

  meson --prefix=/usr --buildtype=release -Db_lto=true . build

  find -name "*.gcda" -delete
  meson configure -Db_pgo=generate build
  ninja -C build

  local script_options="--scroll --scroll-region --colors-regular --colors-bright --colors-256 --colors-rgb --attr-bold --attr-italic --attr-underline"

  local tmp_file=$(mktemp)

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

package_foot() {
  pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
  changelog=CHANGELOG.md
  depends+=('foot-terminfo')
  optdepends=('libnotify: desktop notifications'
              'xdg-utils: URI launching'
              'bash-completion: bash completions for foot itself')

  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  rm -rf "${pkgdir}/usr/share/terminfo"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_foot-terminfo() {
  pkgdesc="Terminfo files for the foot terminal emulator"
  depends=('ncurses')

  cd foot
  install -dm 755 "${pkgdir}/usr/share/terminfo/f/"
  cp build/f/* "${pkgdir}/usr/share/terminfo/f/"
}
