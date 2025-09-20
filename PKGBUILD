# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=r-quick-share
_pkgname=rquickshare
pkgver=0.11.5
pkgrel=2
pkgdesc="Rust implementation of NearbyShare/QuickShare from Android for Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/Martichou/rquickshare"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'pnpm'
  'protobuf'
)
source=("${_pkgname}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a82d63412703aa42c343619806cc0dec28ffcf164fb04c5b0bfd17b22257af3')

prepare() {
  cd "${_pkgname}-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable

  pushd core_lib
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
  popd

  pushd app/main/src-tauri
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

  # Don't bundle AppImage
  sed -i 's/"targets": "all"/"targets": "deb"/g' tauri.conf.json
  popd

  pushd app/main
  pnpm install
  popd
}

build() {
  cd "${_pkgname}-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  pnpm store prune

  pushd app/main
  pnpm build
  popd
}

check() {
  cd "${_pkgname}-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable

  pushd core_lib
  cargo test
  popd

  pushd app/main
  pnpm check
  popd
}

package() {
  cd "${_pkgname}-$pkgver/app/main/src-tauri"
  install -Dm755 "target/release/${_pkgname}" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 icons/${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
  done
  install -Dm644 icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  local deb_arch
  if [ "$CARCH" = "x86_64" ]; then
    deb_arch="amd64"
  elif [ "$CARCH" = "aarch64" ]; then
    deb_arch="arm64"
  fi

  install -Dm644 "target/release/bundle/deb/RQuickShare_${pkgver}_${deb_arch}/data/usr/share/applications/RQuickShare.desktop" -t \
    "$pkgdir/usr/share/applications/"

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="${_pkgname}" \
    "$pkgdir/usr/share/applications/RQuickShare.desktop"
}
