# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mesonlsp
pkgver=4.3.1
pkgrel=1
pkgdesc='Meson language server'
arch=(x86_64)
url=https://github.com/JCWasmx86/mesonlsp
license=(GPL-3.0-or-later)
depends=(
  curl
  git
  libarchive
  mercurial
  patch
  pkgconf
  subversion
  tomlplusplus
  tree-sitter
  util-linux-libs
)
makedepends=(
  gtest
  meson
  ninja
  nlohmann-json
  python-lsprotocol
  python-pygls
)
source=(
  "git+$url.git#tag=v$pkgver"
  git+https://github.com/ada-url/ada#tag=v2.7.4
  sha256::git+https://github.com/amosnier/sha-2#commit=49265c656f9b370da660531db8cc6bf0a2e110a6
  git+https://github.com/JCWasmx86/muon
  git+https://github.com/JCWasmx86/tree-sitter-ini
  git+https://github.com/JCWasmx86/tree-sitter-meson
)
b2sums=('6663ebe3a77538fa44f5d6b413bf77e1376bfb6da43c610cbd19372d2d77f4b4c353ce3a5a24e98dbb24de05c65f2f3ef6d827cede5ee99be4dd139afe9cdf2f'
        'a1bb73cac9898267aec9b019857581f2895351f3014727a297654a3c55a32d69e480e93c53a0089f342268049e0f23e9ba6c0ae1cefa703795e2655eacc74f8a'
        'e4e59dcd348ea3ec9fc6ce7f62f944b8f5b40370c5738e6453e45aa201eadb9eb0b58d9d08e7068b8b1a4a6c90e94d58fb7df81337124c8e96e6e418fce488ae'
        'SKIP'
        'SKIP'
        'SKIP')

build() {
  local meson_options=(
    -D benchmarks=false
    -D use_own_tree_sitter=false
  )

  # Inject subprojects
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
