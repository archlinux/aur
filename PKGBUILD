pkgname=wl-screenrec
pkgver=0.1.5
pkgrel=0
pkgdesc="High performance hardware accelerated wlroots screen recorder"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/russelltg/wl-screenrec"
license=('APACHE')
provides=("wl-screenrec")
makedepends=('cargo' 'git' 'clang' 'rust' 'cargo')
depends=('ffmpeg' 'libva-driver')
conflicts=('wl-screenrec-git')
source=("https://github.com/russelltg/wl-screenrec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b28a013d7418491da82efe25101f0a778e47c34d195f88d48c3132f9d223190d')

build() {
  cd "$pkgname-$pkgver"
  if command -v rustup > /dev/null 2>&1; then
    rustup run stable cargo build --release
  else
    cargo build --release
  fi

  ./target/release/wl-screenrec --generate-completions bash > wl-screenrec.bash
  ./target/release/wl-screenrec --generate-completions zsh > wl-screenrec.zsh
  ./target/release/wl-screenrec --generate-completions fish > wl-screenrec.fish
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wl-screenrec" "$pkgdir/usr/bin/wl-screenrec"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "wl-screenrec.bash" "$pkgdir/usr/share/bash-completion/completions/wl-screenrec"
  install -Dm644 "wl-screenrec.zsh" "$pkgdir/usr/share/zsh/site-functions/_wl-screenrec"
  install -Dm644 "wl-screenrec.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wl-screenrec.fish"
}
