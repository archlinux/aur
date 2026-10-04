# Maintainer: thadah <thadahdenyse@protonmail.com>
pkgname=sable-next-git
pkgver=nightly.0.0.2.nightly.261003230818.f486b02b3d05
pkgrel=1
pkgdesc="Sable rewrite in Rust and Svelte"
url=" https://next.sable.moe"
license=('AGPL-3.0-or-later')
arch=('x86_64')
depends=(
  'alsa-lib'
  'gtk3'
  'libcups'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'nspr'
  'nss'
)
makedepends=(
  'ccache'
  'cmake'
  'mise'
  'xdotool'
  'wget'
)
options=(!lto !debug)
provides=('sable-next')
conflicts=('sable-next')
source=("${pkgname}::git+https://git.sable.moe/SableClient/sable-next.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  mise install
  mise run setup        # pnpm install + git hooks

  mise run tauri:setup  # Shared Rust/system dependencies, including Linux packages
  mise run tauri:icons  # Regenerate native icons after changing the logo SVG

  # https://git.sable.moe/SableClient/sable-next/src/commit/d7fdf75ac807b76045b4d05056038822e08f7b46/.forgejo/workflows/tauri-build.yml#L256
  mise exec -- pnpm tauri:cef build --config src-tauri/tauri.nightly.conf.json
  mise run cef:package "${pkgver}" "Sable Next Nightly"
}

  

package() {
  cd "${pkgname}/target/release/bundle/deb"

  bsdtar -xf "sable-next-${pkgver}-linux-x86_64.deb" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  # Install license
  install -Dm644 "${pkgdir}/opt/sable-next/CEF-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/CEF-LICENSE.txt"
}
