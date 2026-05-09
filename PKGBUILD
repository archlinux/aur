# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=mopyrust-git
_pkgname=mopyrust
pkgver=r1.0000000
pkgrel=1
pkgdesc="Native Mopidy client for desktop, written in Rust + Tauri + Svelte"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/mopyrust"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'nodejs'
  'npm'
  'pkgconf'
)
optdepends=('mopidy: server this client connects to')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!lto')
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  npm ci
}

build() {
  cd "${_pkgname}"
  npm run build
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${srcdir}/target/release/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  for size in 32 64 128 256; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
}
