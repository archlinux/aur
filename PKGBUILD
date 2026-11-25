# Maintainer: Remco Stoeten <remcostoeten@hotmail.com>

pkgname=kuizer
pkgver=0.1.3
pkgrel=1
pkgdesc='Keyboard-driven disk cleanup for developers, with a terminal UI and a desktop app'
arch=('x86_64' 'aarch64')
url='https://kuizer.app'
license=('MIT')
depends=(
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo')
optdepends=(
  'docker: clean dangling images, stopped containers and build cache'
  'git: pack repositories and delete merged branches'
  'xdg-utils: reveal items in the file manager'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/remcostoeten/kuizer/archive/v$pkgver.tar.gz")
sha256sums=('38b3a3d0e487a4f43cd2c37fa61169d962d5bbd6279461fe1195c334d4d7a623')

_generate() {
  local exe=$1
  local out=$2
  mkdir -p "$out/man"
  "$exe" generate completions bash > "$out/kuizer.bash"
  "$exe" generate completions zsh > "$out/_kuizer"
  "$exe" generate completions fish > "$out/kuizer.fish"
  "$exe" generate man --out "$out/man"
}

_install_generated() {
  local dir=$1
  [[ -d $dir ]] || return 0
  install -Dm644 "$dir/kuizer.bash" "$pkgdir/usr/share/bash-completion/completions/kuizer"
  install -Dm644 "$dir/_kuizer" "$pkgdir/usr/share/zsh/site-functions/_kuizer"
  install -Dm644 "$dir/kuizer.fish" "$pkgdir/usr/share/fish/vendor_completions.d/kuizer.fish"
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$dir"/man/*.1
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p kuizer -p kuizer-gui
  # 0.1.3 and older read `kuizer generate` as a folder to scan.
  if (( $(vercmp "$pkgver" 0.1.3) > 0 )); then
    _generate target/release/kuizer generated
  fi
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/kuizer "$pkgdir/usr/bin/kuizer"
  install -Dm755 target/release/kuizer-gui "$pkgdir/usr/bin/kuizer-gui"
  install -Dm644 packaging/kuizer-gui.desktop "$pkgdir/usr/share/applications/kuizer-gui.desktop"
  install -Dm644 packaging/kuizer-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kuizer-gui.svg"
  for size in 32 128 256 512; do
    install -Dm644 "packaging/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kuizer-gui.png"
  done
  _install_generated generated
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
