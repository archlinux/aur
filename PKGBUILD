# Maintainer:  dreieck
# Contributor: Michael Dilger <mike@mikedilger.com>
# Contributor: soloturn@gmail.com

_basename=gossip
_pkgname="${_basename}"
pkgname="${_pkgname}-unstable-git"
pkgver=0.10.0.unstable.r2864.20240310.205f2a6a
pkgrel=1
pkgdesc="Nostr client, written in rust, egui based. Latest git checkout from 'unstable' branch."
arch=(
  'x86_64'
  'i686'
  'i586'
  'i486'
  'i386'
)
url="https://github.com/mikedilger/${_basename}"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-utils: For a standardised way of making use of the bundled .desktop file.'
)
makedepends=(
  'cargo'
  'git'
  'mold'
  'optipng'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-unstable=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_basename}::git+https://github.com/mikedilger/gossip.git#branch=unstable"
  "${_basename}.desktop"
)
sha256sums=(
  'SKIP'
  'be3cc93e8702bc635a85ee5b6e3c3142b0f1cb5f3e99a37d703ae85b94175f59'  # $_basename.desktop
)

prepare() {
  cd "${srcdir}/${_basename}"
  if [ -n "${_MAKEPKGCACHE}" ]; then
    _CACHELOCATION="${_MAKEPKGCACHE}"
  else
    _CACHELOCATION="${srcdir}"
  fi
  export CARGO_HOME="${_CACHELOCATION}/.cargo"
  export RUSTUP_HOME="${_CACHELOCATION}/.rustup"

  cargo fetch -v
}

pkgver() {
  cd "${srcdir}/${_basename}"

  # _ver="$(git describe  --tags | sed -E 's|-g[0-9a-fA-F]*$||' | sed -E 's|^[vV]||' | tr '-' '+')"
  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' 'gossip-lib/Cargo.toml' | tail -n1 | awk -F= '{print $2}' | tr -d \"\'[[:space:]] | tr - .)"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_basename}"
  if [ -n "${_MAKEPKGCACHE}" ]; then
    _CACHELOCATION="${_MAKEPKGCACHE}"
  else
    _CACHELOCATION="${srcdir}"
  fi
  export CARGO_HOME="${_CACHELOCATION}/.cargo"
  export RUSTUP_HOME="${_CACHELOCATION}/.rustup"

  export RUSTUP_TOOLCHAIN=stable
  CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold -C target-cpu=native --cfg tokio_unstable"
  cargo build --offline --release --features=lang-cjk #,video-ffmpeg

  optipng -o7 "logo/gossip.png"
}

package() {
  cd "${srcdir}/${_basename}"
  install -Dvm755 "target/release/${_basename}" "${pkgdir}/usr/bin/gossip"

  install -Dvm644 "logo/gossip.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gossip.svg"
  install -Dvm644 "logo/gossip.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gossip.png"
  install -Dvm644 "${srcdir}/${_basename}.desktop" "${pkgdir}/usr/share/applications/gossip.desktop"

  install -Dvm644 "README.md"   "${pkgdir}/usr/share/doc/${_basename}/README.md"
  install -Dvm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
