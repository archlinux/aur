# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus' 'libarchive'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara' 'capstone')
makedepends=('git' 'cmake'
             'llvm' 'librsvg' 'nlohmann-json'
             'python' 'cli11' 'dotnet-runtime')
optdepends=('dotnet-runtime: support for .NET scripts')
provides=('imhex-patterns')
conflicts=('imhex-patterns-git')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git#commit=5786fabceeaee4d892f3c7a16b243796244cdddc"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp#commit=f01f810714443d0f10c333d4d1d9c0383be41375"
        # "capstone::git+https://github.com/capstone-engine/capstone#commit=097c04d9413c59a58b00d4d1c8d5dc0ac158ffaa"
        "libromfs::git+https://github.com/WerWolv/libromfs#commit=0a72f7bb33d87c4fb2709b6b94bf83518ab0022d"
        "libwolv::git+https://github.com/WerWolv/libwolv#commit=d25459dfa8e706af938427e979e454a8326c5984"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage#tag=ImHex-v$pkgver"
        "imhex-patterns::git+https://github.com/WerWolv/ImHex-Patterns#tag=ImHex-v$pkgver"
        0001-fix-cmake-Fix-when-multiple-.NET-packages-are-instal.patch
        0002-fix-main-Handle-different-LLVM-version.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f35c206bbda1a3d9a593e09ef30d19f46083d51985088b771e64f36cb6c53666'
            '436d89ec4a7aea948ccd1cb5d5cc6783079705107c6ad767e8dbe1208d395ed7')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'd67844dccd070ba302599c85e9a7c5269fa1d6d592b3919148f13a640ac1bd002103b75c8a721c9de40d0a96c3169ef383fe59f96d43bb5bb6f3e573ca39c5fa'
        '90c1872766e16e76509b378437ceb8f8f0638c31cbacba29fc153a4a9046b79af1083751a8a1f73c42662bf2bf2484601c4dc4533bdf4fc0b40c4306b98a1c78')
options=(!lto !strip)

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp; do
    git config submodule.lib/third_party/$name.url "$srcdir/$name"
  done
  for name in libromfs libwolv pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in capstone fmt yara/yara; do
    git config --remove submodule.lib/third_party/$name
  done
  git -c protocol.file.allow=always submodule update

  for name in libwolv; do
    git -C lib/external/pattern_language \
      config submodule.external/$name.url "$srcdir/$name"
  done
  git -C lib/external/pattern_language -c protocol.file.allow=always \
    submodule update

  git apply \
    "$srcdir/0001-fix-cmake-Fix-when-multiple-.NET-packages-are-instal.patch" \
    "$srcdir/0002-fix-main-Handle-different-LLVM-version.patch"
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
    -D IMHEX_STRICT_WARNINGS=OFF \
    -D IMHEX_BUNDLE_DOTNET=OFF \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=ON \
    -D USE_SYSTEM_CLI11=ON \
    -D IMHEX_VERSION="$pkgver"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Patterns
  install -dm0755 "$pkgdir/usr/share/imhex"
  cp -r -t "$pkgdir/usr/share/imhex" \
    "$srcdir/imhex-patterns"/{constants,encodings,includes,magic,patterns,themes,tips}

  # Desktop file(s)
  install -Dm0644 "$pkgname/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/imhex.svg"
  for size in 32 48 64 128 256; do
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -a -f png -w $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/imhex.png" \
      "$pkgname/resources/icon.svg"
  done

  # Documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgname/README.md"
}
