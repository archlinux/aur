# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.24.3
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'libssh2' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara')
makedepends=('git' 'cmake' 'llvm' 'nlohmann-json' 'librsvg' 'python')
optdepends=(
  'imhex-patterns-git: ImHex base patterns'
)
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "capstone::git+https://github.com/capstone-engine/capstone#branch=next"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage#tag=ImHex-v$pkgver"
        0001-makepkg-Fix-compiler-check.patch
        0002-fix-Deduplicate-resources-directories.patch
        0003-build-Fix-build-with-clang.patch
        pl-0001-Use-C-23-standard.patch
        pl-0002-makepkg-Remove-extraneous-compiler-flags.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c2a46722e0169e4d4f95e76ec6a0232ff54e7d7399cb8c2a76dc502268cf9dff'
            '6b0fea58a0b8e501681a0fc90af0bc0d91ebe00096bdd32c4e09e4cac610499f'
            'f8a7d20cf5787d823a47e4664dc5b85be73de26aaff2292522e6d8da6a542b14'
            '8502d17aa838a601ba6cf5b613c1613033dd07b73d7b6ca8c0a912f90717f6d6'
            '48fe8ec54aca8eea1bac5a2bf6f4ab79f7f376b52c644d91a97a7dc0412755df')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'bfe7e3b148a82613832aaa686c0ad2a62a04474807c8e05b0df79ce4a47819bd0ec9c63ee112028e4d7cda23233c98b15aa19b3d634f9edd33730011016f3e7d'
        '48b2fa8f928aab89a4398bd210103c74fb319a27c2abe099df6f24fe7d18ce6426c733eef893dd6ace9cf263523b5bfee6e65a20b7e9de72f1a0db5070476af5'
        '87fb6437af144f839a084c766537102fc7789b0a8287b7315ccf9f830d53fb4fc5276441359ce082b5695c0cfef89f8962806702b2f1f9aa8e3e0a40b79628ac'
        '6e87704c3066a8d5dbe3955647eac8193826a46ff3130e505324b158e0276deab04e9ff9766fe5d3ad33448ba2695126efe3339cd1d64dc7926c6eb843253aca'
        '266c7c77aadca11302ee6e6742e7a9a0dc05becfdc996353ae51308d7305fabb51377d03dd05708e07b9ffc286b7309554da3d905c90b0d82511194a2911c59c')
options=(!lto !strip)

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in fmt curl yara/yara; do
    git config --remove-section submodule.lib/external/$name
  done
  git submodule update

  git apply \
    "$srcdir/0001-makepkg-Fix-compiler-check.patch" \
    "$srcdir/0002-fix-Deduplicate-resources-directories.patch" \
    "$srcdir/0003-build-Fix-build-with-clang.patch"

  git -C lib/external/pattern_language apply \
    "$srcdir/pl-0001-Use-C-23-standard.patch" \
    "$srcdir/pl-0002-makepkg-Remove-extraneous-compiler-flags.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-inconsistent-missing-override"

  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D IMHEX_OFFLINE_BUILD=ON \
    -D IMHEX_IGNORE_BAD_CLONE=ON \
    -D IMHEX_STRIP_RELEASE=OFF \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_CURL=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=OFF \
    -D LIBPL_ENABLE_CLI=OFF \
    -D IMHEX_VERSION="$pkgver"

  cmake --build build
}

package() {
  # Executable
  install -Dm0755 build/imhex "$pkgdir/usr/bin/imhex"

  # Shared lib and plugins
  install -Dm0755 -t "$pkgdir/usr/lib" build/lib/libimhex/libimhex.so

  for plugin in builtin; do
    install -Dm0755 -t "$pkgdir/usr/lib/imhex/plugins" "build/plugins/$plugin.hexplug"
  done

  install -dm0755 "$pkgdir/usr/share/imhex"

  # Desktop file(s)
  install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname/dist/imhex.desktop"
  install -Dm0644 "$pkgname/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/imhex.svg"
  for size in 32 48 64 128 256; do
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -a -f png -w $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/imhex.png" \
      "$pkgname/resources/icon.svg"
  done

  # License
  install -Dm0644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgname/README.md"
}
