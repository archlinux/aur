# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.32.2
pkgrel=2
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara' 'capstone')
makedepends=('git' 'cmake'
             'llvm' 'librsvg' 'nlohmann-json'
             'python' 'cli11' 'dotnet-runtime')
optdepends=('dotnet-runtime: support for .NET scripts')
provides=('imhex-patterns')
conflicts=('imhex-patterns-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WerWolv/ImHex/releases/download/v$pkgver/Full.Sources.tar.gz"
        "imhex-patterns-$pkgver.tar.gz::https://github.com/WerWolv/ImHex-Patterns/archive/refs/tags/ImHex-v$pkgver.tar.gz"
        0001-fix-cmake-Fix-when-multiple-.NET-packages-are-instal.patch
        0002-fix-main-Handle-different-LLVM-version.patch)
sha256sums=('44564e7326e056f9ee698ae972bb0fb624716052466f0f504404e3f366c4c9ed'
            'c2bf92cf468498ccc8a27ff6c3284f59946b0cc064fe41c37885a31018360ad0'
            '3b27f99abc4040630f53cb098b67d4a8086d87c9c2c6e0a6a29afd83dcd6ec3a'
            '6cd6297b2269a7299f81781e9f4bcaa4b78bc69d757d2eafab10433daee6ed48')
b2sums=('75d595e5acb05429b114f4d4c61981080797f7b88d41a219c93f6512c4b204dd164a8886c00af4ee539cb7d6f7baaa49084b349806357fb872a1ebb30e82cfba'
        'b171669c17c0a7aef0ba65b66c2f68f7581a8e11d61365363fd28cfedfa2658c8833181d5e8a4c789ff011c5afadafec8149b43852319cae161c9bb5c26be2ec'
        '4c1c0451e3c4033ed331f6339342926f1ee25b6097cc9bf540f6944f089a3db2eaa42237a673522dbcfe37540b9be9563a12b5aa146d5c5e873cce36ca637b99'
        '0e6fdf7cb14df8c2983822c5bc52c080d68fbc57d995cc9e24c6a84589e2dd904e48e4657a27155dcab9048a720f5d60e8fc2d70ab5d8d42b3186703a878a960')
options=(!lto !strip)

prepare() {
  cd "$_pkgname"

  patch -Np1 -i "$srcdir/0001-fix-cmake-Fix-when-multiple-.NET-packages-are-instal.patch"
  patch -Np1 -i "$srcdir/0002-fix-main-Handle-different-LLVM-version.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-inconsistent-missing-override"

  cmake -B build -S "$_pkgname" \
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
    "$srcdir/ImHex-Patterns-ImHex-v$pkgver"/{constants,encodings,includes,magic,nodes,patterns,plugins,scripts,tests,themes,tips,yara}

  # Desktop file(s)
  install -Dm0644 "$_pkgname/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/imhex.svg"
  for size in 32 48 64 128 256; do
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -a -f png -w $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/imhex.png" \
      "$_pkgname/resources/icon.svg"
  done

  # Documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$_pkgname/README.md"
}
