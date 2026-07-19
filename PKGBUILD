# Maintainer: demir <iron-actress-music@duck.com>

pkgname="zedless-git"
pkgver=1.4.4.r239.g69e8ee6
pkgrel=7
pkgdesc="Zed fork focused on privacy and being local-first"
url="https://github.com/zedless-editor/zedless"
license=("AGPL-3.0-or-later" "APACHE-2.0" "GPL-3.0-or-later")
source=(
  "git+https://github.com/zedless-editor/zedless.git"
  "zed-1.4.4.tar.gz::https://github.com/zed-industries/zed/archive/refs/tags/v1.4.4.tar.gz"
)
sha512sums=(
  "SKIP"
  "6dcd150e83bbb1476bb8c894a6b2c45ee2b70d1bd03c56e73fc85cff74b01d3ed6486d90d63859bc4c0f961abd8bc35f9e85f75ea122d5ac5369daec9537e9eb"
)
arch=("x86_64")
depends=(
  alsa-lib
  curl
  fontconfig
  freetype2
  git
  glib2
  glibc
  jq
  libgcc
  libglvnd
  libgit2
  libstdc++
  libx11
  libxcb
  libxext
  libxkbcommon
  libxkbcommon-x11
  openssl
  sqlite
  vulkan-icd-loader
  wayland
  zlib
  zstd
)
makedepends=(
  ast-grep
  cargo-about
  clang
  cmake
  gettext
  mold
  musl
  pkgconf
  protobuf
  python-toml
  rustup
  vulkan-headers
  vulkan-validation-layers
)
optdepends=(
  "clang: improved C/C++ language support"
  "eslint: improved Javascript language support"
  "pyright: improved Python language support"
  "rust-analyzer: improved Rust language support"
)
conflicts=("zed" "zed-preview" "zed-preview-bin" "zedless" "zedless-bin")
provides=("zedless")
options=("!lto")

_binname=zedless
_appid=org.zedless.Zedless
_zed_version=1.4.4
_remote_target=x86_64-unknown-linux-musl

pkgver() {
  cd "zedless"
  printf '1.4.4.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "zedless"
  rm -rf source
  cp -a "${srcdir}/zed-1.4.4" source
  chmod -R u+w source
  python patch.py

  cd source
  export RUSTUP_TOOLCHAIN=stable
  rustup target add --toolchain stable "${_remote_target}"
  # The Zedless patcher removes crates and rewrites workspace manifests, so the
  # upstream Zed lockfile must be regenerated for the patched workspace.
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --target "${_remote_target}"
  sed -i "s/CARGO_ABOUT_VERSION=\"0.8.2\"/CARGO_ABOUT_VERSION=\"$(cargo about --version | awk '{print $2}')\"/" script/generate-licenses
  ALLOW_MISSING_LICENSES=1 ./script/generate-licenses
  export APP_NAME="Zedless"
  export APP_CLI="${_binname}"
  export DO_STARTUP_NOTIFY="true"
  export APP_ARGS="%U"
  export APP_ICON="zedless"
  envsubst < "crates/zed/resources/zed.desktop.in" > ${_appid}.desktop
}

build() {
  cd "zedless/source"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export ZED_UPDATE_EXPLANATION='Updates are handled through AUR'
  # This is the application/protocol version, not the AUR VCS revision.
  export RELEASE_VERSION="${_zed_version}"
  export PROTOC=/usr/bin/protoc
  export PROTOC_INCLUDE=/usr/include
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --package zed --package cli
  # Build this separately to avoid unifying remote-server-only features into
  # the editor. A static musl binary remains usable on older remote distros;
  # a native Arch build would require the remote host to provide Arch's glibc.
  unset LIBSQLITE3_SYS_USE_PKG_CONFIG ZSTD_SYS_USE_PKG_CONFIG
  RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C target-feature=+crt-static" \
    cargo build --frozen --release --target "${_remote_target}" --package remote_server
}

package() {
  cd "zedless/source"
  local remote_server_version="${_zed_version}+stable.$(git rev-parse HEAD)"
  install -D --mode=0755 "target/release/cli" "${pkgdir}/usr/bin/${_binname}"
  ln -s "${_binname}" "${pkgdir}/usr/bin/zeditor"
  install -D --mode=0755 "target/release/zedless" "${pkgdir}/usr/lib/zedless/zedless-editor"
  install -D --mode=0755 "target/${_remote_target}/release/remote_server" \
    "${pkgdir}/usr/bin/zed-remote-server-stable-${remote_server_version}"
  ln -s "zed-remote-server-stable-${remote_server_version}" \
    "${pkgdir}/usr/bin/zed-remote-server-stable-${_zed_version}+stable"
  install -D --mode=0644 --target-directory "${pkgdir}/usr/share/applications/" "${_appid}.desktop"
  install -D --mode=0644 "crates/zed/resources/app-icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zedless.png"
  install -D --mode=0644 "crates/zed/resources/app-icon@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/zedless.png"
  install -D --mode=0444 --target-directory "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-*
  install -D --mode=0444 --target-directory "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
