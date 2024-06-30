# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mesonlsp
pkgver=4.2.0
pkgrel=1
pkgdesc='Meson language server'
arch=('x86_64')
url=https://github.com/JCWasmx86/mesonlsp
license=('GPL-3.0-or-later')
depends=(
  'curl'
  'git'
  'libarchive'
  'mercurial'
  'patch'
  'pkgconf'
  'subversion'
  'tomlplusplus'
  'tree-sitter'
  'util-linux-libs'
)
makedepends=(
  'gtest'
  'meson'
  'ninja'
  'nlohmann-json'
  'python-lsprotocol'
  'python-pygls'
)
source=(
  "git+$url.git#tag=v$pkgver"
  'git+https://github.com/JCWasmx86/tree-sitter-meson#commit=09665faff74548820c10d77dd8738cd76d488572'
  'git+https://github.com/JCWasmx86/tree-sitter-ini#commit=20aa563306e9406ac55babb4474521060df90a30'
  'sha256::git+https://github.com/amosnier/sha-2#commit=49265c656f9b370da660531db8cc6bf0a2e110a6'
  'git+https://github.com/ada-url/ada#tag=v2.7.4'
  'git+https://github.com/JCWasmx86/muon#commit=62af239567ec3b086bae7f02d4aed3a545949155'
)
b2sums=('f989225eceda8a1b5032f24926e0fc408c91230560ea66501e0a1f4792508ba3b2ec48040703bb02174dd3baec50987fc3adb539f950b2ef07b538cdb595e310'
        '517c4fbd80ab65375e5ebe13b57e65dc64460dda6a7d68a9998617bce94064e7fdd81c5428c55e31e785ae9b9d548dbff0818daad94fa1ffb256fe9a86804c6d'
        'c7cb7dde86a27a8f8de2856fa04350b053a85080dc4314434739ff8f657f9b369e0b996e2ecae093de9b903e77ef3b2874a6f864d81ceba0bfa8d0a064859579'
        'e4e59dcd348ea3ec9fc6ce7f62f944b8f5b40370c5738e6453e45aa201eadb9eb0b58d9d08e7068b8b1a4a6c90e94d58fb7df81337124c8e96e6e418fce488ae'
        'a1bb73cac9898267aec9b019857581f2895351f3014727a297654a3c55a32d69e480e93c53a0089f342268049e0f23e9ba6c0ae1cefa703795e2655eacc74f8a'
        '4086ad4496ff621f7dcfdf349e6ae81fb6a11744a2374690f75688827dab499bda93066434328281225ad97c03962748924d9b34945d540ad8cc1e5537af6fb4')

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
