# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mesonlsp
pkgver=4.3.7
pkgrel=5
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
b2sums=('c1c93e6cc5c2dc9602b65c7fcc8c5156226a1e023430f0117bbb5dead4dbbe17bb1792187a8934f16970b446d0aca3666b3b80c3d181fbf0c338579e8b8b87dc'
        'a1bb73cac9898267aec9b019857581f2895351f3014727a297654a3c55a32d69e480e93c53a0089f342268049e0f23e9ba6c0ae1cefa703795e2655eacc74f8a'
        'e4e59dcd348ea3ec9fc6ce7f62f944b8f5b40370c5738e6453e45aa201eadb9eb0b58d9d08e7068b8b1a4a6c90e94d58fb7df81337124c8e96e6e418fce488ae'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd $pkgname
  git cherry-pick --no-commit 8edb5af16db9d7651a88ae19d0574195a02e40b6
}

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
