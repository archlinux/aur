# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.21.0
pkgrel=2
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
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '1066455740'
        '3728933864'
        '3790563809'
        '3339828254')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '872a53436a9da0bcc37ecdca4d9d424cfe6be2a025f6e52f554893caba1a0e24'
            '77bbee581bfdfcbca3c500aaeb5dc7a73e34aa242058ffea4ada32d9a84d21e4'
            'ebb93f6cd2f60dddeae1a1d2437587a32d5ab9e17dafd74bbea1545834e515e8'
            '6131226f02f39d5161d4da92c55a622b617310c3296abe6c964f8658b61a4667')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '20cb9b639996d3ae5c8b85e81cefd370a17f2a6e23e5bc29c642a24bb8ab3bc1ba3577d295817f632b48bc7109a330aa6ba86f3369e6630c64c04a75dc580bb2'
        '5cd535a49c396d0c05f6b6e832c04b28ebe51314331406be0159fc1a3301c0512330411707f8e302967d8bc7a62216b6ce583fd6224447a5251b9b74c2d731cc'
        '18a081bbea1c6dc5b59243654a7b959140a4280c7736c8df8d720d5d3fcbfef4d5fa6c99635287b06ddf6411059071c8c9463e6ead74d411f95011e415e7c438'
        '11715a412414d9e6a31791508c45449f8a0570f9cfc51fcfcbff5b1bb4be765272c95b63fb22128be7e7e7066904802ede826230865decae5eef7837b13be531')
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
