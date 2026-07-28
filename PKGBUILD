# Maintainer: futpib

pkgname=buzz-desktop-git
pkgver=0.5.0.r25.g90e058ebf
pkgrel=3
pkgdesc='Workspace where humans and agents build together (desktop client, git version)'
arch=('x86_64')
url='https://buzz.xyz'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'libx11'
  'libxi'
  'opus'
  'webkit2gtk-4.1'
)
makedepends=(
  'clang'
  'cmake'
  'corepack'
  'desktop-file-utils'
  'git'
  'librsvg'
  'nodejs>=24'
  'patchelf'
  'pkgconf'
  'rust'
)
provides=('buzz')
conflicts=('buzz' 'buzz-bin')
# Arch's GCC LTO objects cannot be consumed by Rust's lld linker when crates
# compile bundled C libraries (notably secp256k1-sys).
options=('!lto')
source=('buzz::git+https://github.com/block/buzz.git#branch=main')
b2sums=('SKIP')

pkgver() {
  cd buzz
  git describe --long --tags --match 'v[0-9]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd buzz
  mkdir -p "$srcdir/corepack-bin"
  corepack enable --install-directory "$srcdir/corepack-bin"
  export PATH="$srcdir/corepack-bin:$PATH"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  pnpm install --frozen-lockfile
}

build() {
  cd buzz

  export PATH="$srcdir/corepack-bin:$PATH"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"

  cargo build --release --locked \
    -p buzz-acp \
    -p buzz-agent \
    -p buzz-dev-mcp \
    -p git-credential-nostr \
    -p buzz-cli
  ./scripts/bundle-sidecars.sh

  pnpm -C desktop exec tauri build --ci --bundles deb
}

package() {
  cd buzz

  local deb
  deb=$(find desktop/src-tauri/target/release/bundle/deb \
    -maxdepth 1 -type f -name '*.deb' -print -quit)
  if [[ -z $deb ]]; then
    printf 'error: Tauri did not produce a Debian bundle\n' >&2
    return 1
  fi

  local deb_root="$srcdir/deb-root"
  mkdir -p "$deb_root"
  bsdtar -xf "$deb" -C "$deb_root"
  bsdtar -xf "$deb_root/data.tar.gz" -C "$pkgdir"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
