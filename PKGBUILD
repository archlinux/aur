# Maintainer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>

pkgdesc='Wayland terminal emulator. Git builds without any custom tinkering.'
pkgname=foot-upstream-git
pkgver=1.13.1.r47.g37218be6
pkgrel=1
conflicts=('foot')
provides=('foot')
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(MIT)
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'ncurses' 'fcft>=3.0.0')
makedepends=(
  git
  fcft
  fontconfig
  libutf8proc
  libxkbcommon
  llvm
  meson
  ncurses
  ninja
  pixman
  python
  scdoc
  sway
  tllist
  wayland
  wayland-protocols
)
checkdepends=('check')
optdepends=(
  "foot-terminfo: alternative to ncurses' terminfo, with additional non-standard capabilities"
  "libnotify: desktop notifications"
  "xdg-utils: URI launching"
  "bash-completion: bash completions for foot itself"
)
source=(git+https://codeberg.org/dnkl/foot.git)
sha256sums=('SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd foot
  ./pgo/pgo.sh \
    full-headless-sway \
    . build \
    -Dterminfo=disabled \
    --prefix=/usr \
    --wrap-mode=nodownload
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
