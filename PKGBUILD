# Maintainer: Fazzi <faaris.ansari@proton.me>
# Maintainer of Original Package: Daniel Eklöf <daniel at ekloef dot se>
# shellcheck disable=all

PGO=auto

pkgdesc='A fork of foot - the fast wayland terminal emulator - now with more transparency options!! (git)'
pkgname=foot-transparency-git
pkgver=1.16.2.r135.gd8f61883
pkgrel=1
conflicts=('foot')
replaces=('foot-themes')
provides=('foot')
arch=('x86_64' 'aarch64')
url=https://codeberg.org/fazzi/foot/src/branch/transparency_yipee
license=(mit)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'python' 'wayland-protocols' 'tllist')  # ‘llvm’, for PGO with clang
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'ncurses' 'fcft>=3.0.0')
optdepends=("foot-terminfo: alternative to ncurses' terminfo, with additional non-standard capabilities"
            "libnotify: desktop notifications"
            "xdg-utils: URI launching"
            "bash-completion: bash completions for foot itself")
source=(git+https://codeberg.org/fazzi/foot.git#branch=transparency_yipee)
sha256sums=('SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd foot
  ./pgo/pgo.sh \
    ${PGO} \
    . build \
    --prefix=/usr \
    --wrap-mode=nodownload \
    -Dterminfo=disabled
}

check() {
  cd foot
  ninja -C build test
}

package() {
  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/foot/LICENSE"
}
