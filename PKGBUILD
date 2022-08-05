# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.20.0
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
        0001-makepkg-Remove-bad-clone-detection.patch
        0002-makepkg-Fix-compiler-verification-and-compiler-flags.patch
        0003-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch
        0004-fix-Deduplicate-resources-directories.patch)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '4285566643'
        '986904530'
        '1406824922'
        '2015427973')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6a17c5ad10204712c711ae624af238f11eb62eb8c1f28f3a828b76766b00e635'
            '8591f2f4cae81806337fd9955d5c1e75966c18fdd43274547be9c47b8045c144'
            '02e7f4d014313fcace2f135db2a2e14c86ab06c599b29f53828a176ee70164a3'
            'd73ccbb2061f5c85d2e2421b84aaa3a06fdf0ae2779df964ff2638da236d2da3')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '9e4c8bd097cbe473dad0b29e2b2f014679e3a9b69adbe6879a8847556bc2a399626789f90cad8011978019f426f076958a11efef4bf46e61485de989e1d1a4dc'
        '400de6348a571c6c9f01a208e87ceeb68815c22110f4d84bc742f5836b6f4aa20a7d244be0b1b138089dcc0bbb01aec4ed6526ff736ab32d476ccedc0b9d013b'
        'c4a8fb1c482c7d8f44702cb6a3841bfd92d6ae55912a7dcead8033e3977799afe37718e0887197c9b41a73da237c9865ab01cb1a5e0952f593354d3e102f3c77'
        '6e1cdaf3dee8c9a4b74f5d101a9b80eef556f284fe5d95b4a5c178f0d67b8da8f0b8623dd49ee0b7e1cedb60bb0e5d74c43f75e1687b2fd8837cc77ba8834807')
options=(!lto)

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
    "$srcdir/0001-makepkg-Remove-bad-clone-detection.patch" \
    "$srcdir/0002-makepkg-Fix-compiler-verification-and-compiler-flags.patch" \
    "$srcdir/0003-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch" \
    "$srcdir/0004-fix-Deduplicate-resources-directories.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-inconsistent-missing-override"

  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D IMHEX_OFFLINE_BUILD=ON \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_CURL=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=OFF \
    -D PROJECT_VERSION="$pkgver"
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
