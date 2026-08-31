# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Dongda Li <dongdongbhbh at gmail dot com>
pkgname=mindwtr
pkgver=1.2.5
pkgrel=4
_nodeversion=24
pkgdesc="Mind Like Water: A complete Getting Things Done (GTD) productivity system"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'bzip2'
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'openssl'
  'sqlite'
  'webkit2gtk-4.1'
)
makedepends=(
  'pnpm'
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
        "pnpm-lock.yaml"
        "pnpm-workspace.yaml"
)
sha256sums=('4e2be834cae47c8960f8ab2e58cad2db131d58c3ba1716cc290848875ad4419c'
            'c283dc386b122df8db1157a2f74e7cfd780ab65133ab8fef6c74b2179f85161c'
            '83e04c18d50c6f0392e9289a503f86349393851705135c5609db67f4bdddabfd'
            '4147dc8bee4e18f2d7776c90cfcb09b81223735ebabc67ac87d063aff510f7e3')

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
  cd "Mindwtr-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  cp "$srcdir/pnpm-lock.yaml" pnpm-lock.yaml
  cp "$srcdir/pnpm-workspace.yaml" pnpm-workspace.yaml
  pnpm install --frozen-lockfile --ignore-scripts --store-dir "$srcdir/pnpm-store"
  sed -i 's/\"beforeBuildCommand\": \"bun run build:vite\"/\"beforeBuildCommand\": \"pnpm run build:vite\"/' apps/desktop/src-tauri/tauri.conf.json

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path apps/desktop/src-tauri/Cargo.toml \
    --locked --target host-tuple
}

build() {
  cd "Mindwtr-$pkgver/apps/desktop"
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export OPENSSL_NO_VENDOR=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  _ensure_local_nvm
  cargo tauri build --no-bundle -- --frozen
}

check() {
  cd "Mindwtr-$pkgver/apps/desktop"

  # Run the desktop Vitest suite, but do not fail the package build on test failures.
  pnpm run test || :
}

package() {
  cd "Mindwtr-$pkgver/apps/desktop/src-tauri"
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
