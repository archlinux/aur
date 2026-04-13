pkgname=whispers-cuda-git
_pkgname=whispers
pkgver=r0.0000000
pkgrel=1
pkgdesc='Local-first speech-to-text dictation for Wayland (latest git build with CUDA)'
arch=('x86_64')
url='https://github.com/OneNoted/whispers'
license=('MIT')
makedepends=('cargo' 'clang' 'cmake' 'cuda' 'git' 'pkgconf')
depends=('alsa-lib' 'cuda' 'gcc-libs' 'glibc' 'noto-fonts' 'wl-clipboard')
optdepends=('python: experimental faster-whisper and NeMo runtimes')
provides=('whispers')
conflicts=('whispers' 'whispers-bin' 'whispers-git' 'whispers-cuda-bin')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  if git describe --long --abbrev=7 --tags >/dev/null 2>&1; then
    git describe --long --abbrev=7 --tags | sed 's/^v//; s/-/.r/; s/-/./g'
  else
    printf 'r%s.%s' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_pkgname"

  export CARGO_TARGET_DIR=target
  cargo build \
    --frozen \
    --release \
    --no-default-features \
    --features cuda,local-rewrite,osd

  mkdir -p completions
  target/release/whispers completions bash > completions/whispers.bash
  target/release/whispers completions zsh > completions/_whispers
  target/release/whispers completions fish > completions/whispers.fish
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/whispers \
    "$pkgdir/usr/bin/whispers"
  install -Dm755 target/release/whispers-osd \
    "$pkgdir/usr/bin/whispers-osd"
  install -Dm755 target/release/whispers-rewrite-worker \
    "$pkgdir/usr/bin/whispers-rewrite-worker"

  install -Dm644 completions/whispers.bash \
    "$pkgdir/usr/share/bash-completion/completions/whispers"
  install -Dm644 completions/_whispers \
    "$pkgdir/usr/share/zsh/site-functions/_whispers"
  install -Dm644 completions/whispers.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/whispers.fish"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/whispers/README.md"
  install -Dm644 config.example.toml \
    "$pkgdir/usr/share/doc/whispers/config.example.toml"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/whispers/LICENSE"
  install -Dm644 NOTICE \
    "$pkgdir/usr/share/licenses/whispers/NOTICE"
}
