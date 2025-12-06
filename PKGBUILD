# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal' 'fontconfig'
         'fmt' 'yara' 'capstone')
makedepends=('git' 'cmake'
             'llvm' 'librsvg' 'nlohmann-json' 'libxrandr'
             'python' 'cli11' 'dotnet-runtime')
optdepends=('dotnet-runtime: support for .NET scripts')
provides=('imhex-patterns')
conflicts=('imhex-patterns-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WerWolv/ImHex/releases/download/v$pkgver/Full.Sources.tar.gz"
        "imhex-patterns-$pkgver.tar.gz::https://github.com/WerWolv/ImHex-Patterns/archive/refs/tags/ImHex-v$pkgver.tar.gz")
sha256sums=('dc4bb8e6a3800d59da284b92f56ca9816a32790aa11121a9a143b1a078c5d8d6'
            'eb211d696f409f3747942d6f7139e56dae76c3c073e1fee0471a3e7ed82b5f28')
b2sums=('f04fad694b841e0d63e2ccf2efb3a249213231c8b08fd5cfb8582c5fe901e262d8f48eede81254d0f1ec3d539eb9621b5142e607c5738ee9c04c8ea903eb9f55'
        '4e5706fd22c2cc16e8486b87bd3df50ef68c6aa4448a2790be99f6623e75ce744f2201e75a03b61bf6145efd3dacbc3287e388e6dfb47897edd3d0d8ed9f99d1')
options=(!lto)

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-inconsistent-missing-override"

  cmake -B build -S "$_pkgname" \
    -Wno-dev \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
  test -e "$srcdir/ImHex-Patterns" && rm "$srcdir/ImHex-Patterns"
  ln -s "$srcdir/ImHex-Patterns-ImHex-v$pkgver" "$srcdir/ImHex-Patterns"

  DESTDIR="$pkgdir" cmake --install build

  # Remove updater
  rm "$pkgdir/usr/bin/imhex-updater"

  # Patterns
  install -dm0755 "$pkgdir/usr/share/imhex"
  cp -r -t "$pkgdir/usr/share/imhex" \
    "$srcdir/ImHex-Patterns-ImHex-v$pkgver"/{constants,encodings,includes,magic,nodes,patterns,plugins,scripts,tests,themes,tips,yara}

  # Desktop file(s)
  install -Dm0644 "$_pkgname/resources/icon.svg" "$pkgdir/usr/share/pixmaps/imhex.svg"

  # Documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$_pkgname/README.md"
}
