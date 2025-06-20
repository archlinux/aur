# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mesonlsp
pkgver=4.3.7
pkgrel=6
pkgdesc='Meson language server'
arch=(x86_64)
url=https://github.com/JCWasmx86/mesonlsp
license=(GPL-3.0-or-later)
depends=(
  curl
  gcc-libs
  git
  glibc
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
  git+https://github.com/JCWasmx86/muon#commit=428964c92454b8a994e224a13f8aad913271f10c
  git+https://github.com/JCWasmx86/tree-sitter-ini#commit=848b6269f7039739aebd169fbd3d5e6e34bef661
  git+https://github.com/JCWasmx86/tree-sitter-meson#commit=09665faff74548820c10d77dd8738cd76d488572
  0001-Remove-tests-broken-by-missing-GitHub-repos.patch
)
b2sums=('c1c93e6cc5c2dc9602b65c7fcc8c5156226a1e023430f0117bbb5dead4dbbe17bb1792187a8934f16970b446d0aca3666b3b80c3d181fbf0c338579e8b8b87dc'
        'a1bb73cac9898267aec9b019857581f2895351f3014727a297654a3c55a32d69e480e93c53a0089f342268049e0f23e9ba6c0ae1cefa703795e2655eacc74f8a'
        'e4e59dcd348ea3ec9fc6ce7f62f944b8f5b40370c5738e6453e45aa201eadb9eb0b58d9d08e7068b8b1a4a6c90e94d58fb7df81337124c8e96e6e418fce488ae'
        '7c1abefdac2cf13b5dcb1ee2eb2f2fd141ae9bcf23a3adb574a543a34391bc3f7aed4c1019684f11a294312db2fedcb2df8c7b8e1b3800ea23649f632f667a28'
        '83f0e5b4c34b6e5ac95aa8b610ea3a992edcab711a0174e77a64fee7c27f7b3a51450ce9b376cbac0c93b1aa7271017788b54805158552028bfe204fbd6d1558'
        '517c4fbd80ab65375e5ebe13b57e65dc64460dda6a7d68a9998617bce94064e7fdd81c5428c55e31e785ae9b9d548dbff0818daad94fa1ffb256fe9a86804c6d'
        'f912ff13e7f178ef83bc691ab4d4a99e9b9b6654da6f91f740bee3b31d2b1815707cc608c9a32a9220beb528976e9d8005d075e181361e1b45082d476582ea8c')

prepare() {
  cd $pkgname

  # Fix build with recent muon
  git cherry-pick -n 8edb5af16db9d7651a88ae19d0574195a02e40b6 \
                     851eb422851406ca4221e7bd866cd97b51c9ac06

  # Make tests pass
  git apply -3 ../0001-Remove-tests-broken-by-missing-GitHub-repos.patch
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
