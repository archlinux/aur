# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

PGO=auto           # auto|none|partial|full-current-session|full-headless-sway|full-headless-cage

pkgdesc='Wayland terminal emulator - fast, lightweight and minimalistic'
pkgname=foot-git
pkgver=1.9.1
pkgrel=1
conflicts=('foot')
provides=('foot')
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols' 'tllist')  # ‘llvm’, for PGO with clang
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'fcft' 'foot-terminfo')
optdepends=('libnotify: desktop notifications'
            'xdg-utils: URI launching'
            'bash-completion: bash completions for foot itself')
source=(git+https://codeberg.org/dnkl/foot.git)
sha256sums=('SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd foot
  ./pgo/pgo.sh ${PGO} . build --prefix=/usr --wrap-mode=nodownload -Dterminfo=disabled
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
