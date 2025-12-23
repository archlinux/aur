# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.38.1
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
sha256sums=('cd3531066a41dde1f0751e5d3146a936897df35ad5ba1fa49a9f3ace88e6901d'
            '3aae4c0970bc1b85bf4dc566bdf31de33c7dce593375645600549643ce6f9841')
b2sums=('481ba12521704923e5ea2588a2d046f7a5bac6a6e539ef14047243e4232452dd3ce2d999aa00593435dccf30726fcb84f91971589c3aa5b0c24e1794c48578fe'
        'a838e6d3add02351a7c2a1f465b305c9430d7acab969f6890d4d65574ea5870383b2a9c9e92fe08fbada79ac858da5b5e34ba81d4ce2c39a843546a5d8242fe6')
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
