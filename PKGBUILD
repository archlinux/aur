# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.37.4
pkgrel=2
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
        "imhex-patterns-$pkgver.tar.gz::https://github.com/WerWolv/ImHex-Patterns/archive/refs/tags/ImHex-v$pkgver.tar.gz"
        fmt-update.patch
        patterns-fmt-update.patch)
sha256sums=('711481cc8dfc368d1b88f5d3e8a44d65f23fa43eb9db092599924f3a4cf1aaa2'
            '541eddc8cc427d1aeb749bc455911fccc87f64a7784bd4bbc35ecb7b56c03ad5'
            'cfd6afdea025fdcd215f6a72c8a81853bccc1db01b0920e27c371fa86bca2c41'
            '4eaa595c0a25ae29e998681644b4d8b06df4fc51226639a5c9bb447d990aa95f')
b2sums=('11f93ca310ddec8ec7d074d5450a02f3147d40aaa92387fbe7fce3be08445e129bbd7336d923e971a2f7f2b6df778a6210de73060cb91abe85161e7fd88588b7'
        'c8699f9f26faeae784b4c4cb14b682d0f4d0c544ef8c9596b8688c19e6066d7101a7c32979ee807cd4a05225fe2548a8759b1fd0a07c578ea5c0fcdb9f104e69'
        '95b48f077d47af4b430477e5581f4da3f34e2d27920a038bcd5d4affb812c4de3801aba89053b9ffa394eb501a1c2eede40de0a9d7d940a9be292e3ac74dd2f3'
        '46eea8e7a7133ac2b5d37c02ca892cdbebaf68204947936757708f72e37d3ba332f3cd908a06d0e4bbd4a1a19c2f1f8d6bb6e01606e97dd383584c9f6060f40f')
options=(!lto)

prepare() {
  cd "$_pkgname"

  patch -Np1 -i "$srcdir/fmt-update.patch"

  cd lib/external/pattern_language

  patch -Np1 -i "$srcdir/patterns-fmt-update.patch"
}

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
