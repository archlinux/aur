# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.21.1
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
        0001-makepkg-Fix-compiler-flags.patch
        0002-makepkg-Fix-compiler-check.patch
        0003-fix-Deduplicate-resources-directories.patch
        0004-makepkg-Fix-build-with-clang.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a75f6b2c5193c937aa692d4c787fe9438b7ff2258eb185d40f6a273fd4b27103'
            'a8e03e3528cbc81d725ff26eb4e41a6db38178f4db1700c8c6e9063076d3256f'
            '9df4ae1d85df0d9612d7cc0f029ca27da19fe9c43ad2609f84c39f2f2ad27cf2'
            'fb15c08769ae5c8f31a113204fd0cb8b0e5ee8defc3c8f773e2a1a2e06c1abd4')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '44609518926b99d480373fff1164804329979eed5c3cf9cf0645896c774c4bd382a73d04dfb7a86ff33a30a816c22f8b7f9f5adf3bad11403b8484638cfdf9e0'
        '4474e4566253b32b22270b0ef32353b536bc8f7a08b2405e32a6ed270a6283b168978c500bf0921ded1e1884adf87bc01d1c98b3b58c893549aea4108d4a50bd'
        '1792a1bcb469c821c0ee8f82bbd6515e9d7d3a925967573a858364b7eabc4411e596670639fb1be915ca804827e3b14dd1703d2868571b604e022989c694bd23'
        '9d30839adf346de25a8ef49837b0c78e8bc2d07737216759889b5f7df7ac1e66f1acb33bc207d4d81ee2db4033a4feabbb67aafa8188b8b273ece93f0f499601')
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
    "$srcdir/0001-makepkg-Fix-compiler-flags.patch" \
    "$srcdir/0002-makepkg-Fix-compiler-check.patch" \
    "$srcdir/0003-fix-Deduplicate-resources-directories.patch" \
    "$srcdir/0004-makepkg-Fix-build-with-clang.patch"
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
    -D IMHEX_VERSION="$pkgver"

  make -C build
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
