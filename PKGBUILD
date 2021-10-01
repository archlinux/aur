# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

PGO=auto           # auto|none|partial|full-current-session|full-headless-sway|full-headless-cage

pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
pkgname=foot
pkgver=1.9.1  # Don’t forget to update CHANGELOG.md
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
sha256sums=('1277cfb6c88fbf299d115446cfa2a33cd6ddf88225989c84e6579024675edb97')

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
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
