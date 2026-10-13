# Maintainer: LittleWatter <zs987526341@gmail.com>

pkgname=sigilsmith-git
_pkgname=SigilSmith
pkgver=0.9.11.r189.g49600b7
pkgrel=1

# Unofficial community package: built and maintained separately from upstream.
# Packaging issues: AUR comments. Upstream bugs: the GitHub issue tracker
# (https://github.com/Agistaris/SigilSmith/issues), also pinned on the AUR page.
pkgdesc="Keyboard-first, Linux-first TUI mod manager for Baldur's Gate 3 (community package)"
arch=('x86_64')
url="https://github.com/Agistaris/SigilSmith"

license=('LicenseRef-SigilSmith-Community-1.0')

depends=(
  'glibc'
  'libgcc'
  'hicolor-icon-theme'
  'xz'
  'bzip2'
)

makedepends=(
  'cargo'
  'git'
)

provides=('sigilsmith')
conflicts=('sigilsmith')

# SigilSmith depends on Rust crates such as ring that may fail
# to link correctly with Arch's package LTO flags.
options=('!lto' '!debug')

source=(
  "git+https://github.com/Agistaris/SigilSmith.git"
)

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local version
  version="$(
    sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -n1
  )"

  printf "%s.r%s.g%s" \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch \
    --locked \
    --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build \
    --frozen \
    --release
}

package() {
  cd "$srcdir/$_pkgname"

  # Main executable
  install -Dm755 \
    target/release/sigilsmith \
    "$pkgdir/usr/bin/sigilsmith"

  # Desktop entry
  if [[ -f packaging/sigilsmith.desktop ]]; then
    install -Dm644 \
      packaging/sigilsmith.desktop \
      "$pkgdir/usr/share/applications/sigilsmith.desktop"
  fi

  # Application icon
  if [[ -f packaging/icons/sigilsmith.svg ]]; then
    install -Dm644 \
      packaging/icons/sigilsmith.svg \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/sigilsmith.svg"
  fi

  # Upstream license
  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
