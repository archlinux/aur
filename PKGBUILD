# Maintainer: kabeuchi_bird
pkgname=kakikotoba-git
_pkgname=kakikotoba
pkgver=r28.a631f47
pkgrel=1
pkgdesc='Vertical text editor for novel writing'
arch=('x86_64')
url='https://github.com/kabeuchi-bird/kakikotoba'
license=('MIT')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'kirigami' 'qt6-base' 'qt6-declarative')
makedepends=('cargo' 'git')
# テストが読むフォント。ないとテストが何も確かめずに通る
checkdepends=('noto-fonts-cjk' 'ttf-dejavu')
optdepends=('fcitx5: vertical conversion candidates drawn in the editor'
            'noto-fonts-cjk: preferred Japanese font')
provides=("$_pkgname")
conflicts=("$_pkgname")
# LTOを有効にすると、cxxのC++側のシンボルをリンカが解決できない
options=('!lto')
source=("git+$url.git"
        'kakikotoba.desktop')
sha256sums=('SKIP'
            'fe5910f0ffbda17b3e2b326cfd5032421146b6fc7f97e0c71103064a258a2d03')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p kakikotoba
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  install -Dm644 kakikotoba.desktop -t "$pkgdir/usr/share/applications"
  cd "$_pkgname"
  install -Dm755 target/release/kakikotoba -t "$pkgdir/usr/bin"
  install -Dm644 assets/kakikotoba.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
