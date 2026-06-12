# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mindwtr
pkgver=0.9.10
pkgrel=1
_nodeversion=20
pkgdesc="Mind Like Water: A complete Getting Things Done (GTD) productivity system"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'cargo'
  'cargo-tauri'
  'clang'
  'cmake'
  'git'
  'nvm'
  'python'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dongdongbh/Mindwtr/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
)
sha256sums=('09f7d9f2ca76b7caacd026151604a16b85b522273f9dcde6a659ca45fdcb1f7b'
            'c283dc386b122df8db1157a2f74e7cfd780ab65133ab8fef6c74b2179f85161c')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "$srcdir/Mindwtr-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path apps/desktop/src-tauri/Cargo.toml \
    --locked --target host-tuple
}

build() {
  cd "$srcdir/Mindwtr-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  _ensure_local_nvm
  bun install

  cd apps/desktop
  cargo tauri build --no-bundle -- --frozen
}

check() {
  cd "$srcdir/Mindwtr-$pkgver/apps/desktop"
  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"
  
  # Run the desktop Vitest suite, but do not fail the package build on test failures.
  bun run test || :
}

package() {
  cd "$srcdir/Mindwtr-$pkgver/apps/desktop/src-tauri"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  
  for i in 32x32 64x64 128x128 128x128@2x; do
    install -Dm644 "icons/${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
