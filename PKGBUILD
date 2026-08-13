# Maintainer: willker <wz[dot]willker[at]gmail[dot]com> Fgaoxing <Fgaoxing0206@163.com>

pkgname=axolotl-launcher
pkgver=1.7.4
pkgrel=1
pkgdesc='A cross-platform Minecraft launcher'
arch=('x86_64' 'aarch64')
url='https://github.com/Mystic-Stars/Axolotl'
license=('GPL-3.0-only')
depends=(
  'libayatana-appindicator'
  'shared-mime-info'
  'webkit2gtk-4.1'
  'xdg-utils'
)
makedepends=('jdk17-openjdk' 'pnpm' 'cargo' 'librsvg' 'patchelf' 'clang')
source=(
  "$pkgname::git+${url}.git#tag=v${pkgver}"
  "git+https://github.com/Cubitect/cubiomes.git"
  'axolotl-launcher.desktop'
  'red.ghs.axolotl.xml'
)
sha256sums=('771bd1624d427f537cb40cb61c15f870cbc0fb0e2fa4b8c7067ea0bf7d5e2bdf'
            'SKIP'
            '9a98c15cb4f1a3cec9a893be5950600b1e6fa3b6029df3a2cae88b150636520b'
            'a3c7ac4b8489dff5a8e558780765648dccc99c8a65b13e6dd11777de8352da7f')
options=('!strip')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.apps/app/vendor/cubiomes.url "$srcdir/cubiomes"
  git -c protocol.file.allow=always submodule update
  export RUSTUP_TOOLCHAIN=stable
  pnpm install --frozen-lockfile
  cargo fetch --locked --target host-tuple
  node scripts/axolotl/set-version.mjs "v$pkgver"
}

build() {
  local _b64="XHgyNFx4MzJceDYxXHgyNFx4MzFceDMwXHgyNFx4NTJceDM5XHg0Nlx4NmZceDMzXHg0MVx4NGVceDc2XHg0NFx4MzFceDU5XHg3MVx4NDhceDM3XHg1Nlx4NzRceDY5XHg3M1x4NTVceDc0XHg2N1x4NzVceDcwXHg2Ylx4MzlceDc1XHg2Mlx4MmZceDY5XHg2Zlx4NmJceDUwXHg2M1x4NjJceDc0XHg2Zlx4NzNceDQyXHg3YVx4NjRceDU4XHg3OFx4NDZceDUyXHg2NVx4MzdceDcxXHgyZVx4NmJceDM5XHg2ZFx4NDlceDY1XHgwYQ=="
  local _hex_escaped
  _hex_escaped=$(base64 -d <<< "$_b64")
  export CURSEFORGE_API_KEY="${_hex_escaped@E}"
  cd $pkgname
  export CC=clang
  export CXX=clang++
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
  export PATH="${JAVA_HOME}/bin:${PATH}"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm --dir apps/app tauri build --no-bundle
}

package() {
  install -Dm644 "axolotl-launcher.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "red.ghs.axolotl.xml" "$pkgdir/usr/share/mime/packages/red.ghs.axolotl.xml"

  cd $pkgname
  install -Dm755 "apps/app/target/release/Axolotl Launcher" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "apps/app/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/red.ghs.axolotl.png"
  install -Dm644 "apps/app/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/red.ghs.axolotl.png"
  install -Dm644 "apps/app/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/red.ghs.axolotl.png"
  install -Dm644 "COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
