# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.31.0
pkgrel=3
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara')
makedepends=('git' 'cmake'
             'llvm' 'nlohmann-json' 'librsvg'
             'python' 'cli11' 'dotnet-runtime')
optdepends=('dotnet-runtime: support for .NET scripts')
provides=('imhex-patterns')
conflicts=('imhex-patterns-git')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git#commit=800f58283fbc1f3950abd881357fb44c22f3f44e"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp#commit=f01f810714443d0f10c333d4d1d9c0383be41375"
        "libromfs::git+https://github.com/WerWolv/libromfs#commit=80b9adea2003eb01fa4cf2ecb0d77f2d9c0dd32a"
        "capstone::git+https://github.com/capstone-engine/capstone#commit=650e85dcf23b3a3bff69144511533b7339436238"
        "libwolv::git+https://github.com/WerWolv/libwolv#commit=128bed69ea0cf4a904e17f5690aa751b6e4b8568"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage#tag=ImHex-v$pkgver"
        "imhex-patterns::git+https://github.com/WerWolv/ImHex-Patterns#tag=ImHex-v$pkgver"
        0001-fix-cmake-Fix-when-multiple-.NET-packages-are-instal.patch
        pl-0001-Use-C-23-standard.patch
        pl-0002-makepkg-Remove-extraneous-compiler-flags.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6db78e5899e4ed3eb9170cb30f321706e8f8c7531b38ebf43a1e6595e6f9fc18'
            '9fad69a15f24d932353c1500a885640031699265dcced403d2c8e97e581274e3'
            '1d45242b1090daeec4b028e64598b678a2099af4ec82ab71040082c24520f314')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'd393cc7a6aa26fabac6ede2e435b6df1a334c74ba981af902bcfbb77841f89dba2f110c7e025ef20a808d10fda4865c7d1ed28a39debccb1e1f797765c7bb1ee'
        'd9967d5d82b3457fe3065dd3aa69887a4f07d2c74afd686250065bf438677e1b26801c9d2b5795003b22c1224c4447864559248a29bfd34a9af2bb637bc1d515'
        '4b38b83a9c70a05f119e2d7704ca0721ac755dda05f1f23f81e5c2d41751ea2db8212b537db133d5ab75eee7c858f103ca5825ab182b3b53c35e59278fbed527')
options=(!lto !strip)

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone libwolv pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in fmt yara/yara; do
    git config --remove-section submodule.lib/external/$name
  done
  git -c protocol.file.allow=always submodule update

  for name in libwolv; do
    git -C lib/external/pattern_language \
      config submodule.external/$name.url "$srcdir/$name"
  done
  git -C lib/external/pattern_language -c protocol.file.allow=always \
    submodule update

  git apply \
    "$srcdir/0001-fix-cmake-Fix-when-multiple-.NET-packages-are-instal.patch"

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
    -D IMHEX_STRICT_WARNINGS=OFF \
    -D IMHEX_BUNDLE_DOTNET=OFF \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=OFF \
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
