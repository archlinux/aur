# Maintainer: Xianyi Lin <iynaix@gmail.com>
pkgname=focal-git
_pkgname=focal
pkgver=r121.a7edff4
pkgrel=1
pkgdesc="Rofi menu for capturing and copying screenshots or videos on hyprland / sway."
arch=(x86_64 aarch64)
url="https://github.com/iynaix/focal"
license=('MIT')
depends=(glibc gcc-libs ffmpeg slurp wf-recorder wl-clipboard)
makedepends=(git cargo mesa pango wayland)
optdepends=('tesseract: OCR support'
            'rofi: Graphical menu for selecting options'
            'noctalia: Graphical menu for selecting options')
provides=(focal)
conflicts=(focal)
replaces=(focal-hyprland-git focal-sway-git)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
_depends=(glibc gcc-libs ffmpeg slurp wf-recorder wl-clipboard)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # fix ELF file ('usr/bin/focal') lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.
  export RUSTFLAGS='-C link-args=-Wl,-z,shstk'
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --manifest-path=$_pkgname/Cargo.toml --target-dir=$_pkgname/target --no-default-features --features="ocr,video"
}

package() {
  install -Dm755 "$_pkgname/target/release/${_pkgname}" -t "$pkgdir/usr/bin"

  $_pkgname/target/release/focal generate bash > "$_pkgname/target/release/focal.bash"
  $_pkgname/target/release/focal generate zsh > "$_pkgname/target/release/focal.zsh"
  $_pkgname/target/release/focal generate fish > "$_pkgname/target/release/focal.fish"

  install -Dm644 "$_pkgname/target/release/focal.bash" "$pkgdir/usr/share/bash-completion/completions/focal"
  install -Dm644 "$_pkgname/target/release/focal.zsh" "$pkgdir/usr/share/zsh/site-functions/_focal"
  install -Dm644 "$_pkgname/target/release/focal.fish" "$pkgdir/usr/share/fish/vendor_completions.d/focal.fish"

  for section in 1 2 3 4 5 6 7 8; do
    while IFS= read -r -d '' file; do
        install -Dm644 "$file" "$pkgdir/usr/share/man/man$section/$(basename "$file")"
    done < <(find "$_pkgname/target/man" -type f -name "*.$section" -print0)
  done
}
