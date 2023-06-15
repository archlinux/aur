# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.29.0
pkgrel=3
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'libssh2' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara')
makedepends=('git' 'cmake' 'llvm' 'nlohmann-json' 'librsvg' 'python')
provides=('imhex-patterns')
conflicts=('imhex-patterns-git')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git#tag=v1.0.3"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp#commit=f01f810714443d0f10c333d4d1d9c0383be41375"
        "libromfs::git+https://github.com/WerWolv/libromfs#commit=80b9adea2003eb01fa4cf2ecb0d77f2d9c0dd32a"
        "capstone::git+https://github.com/capstone-engine/capstone#commit=e9fd6f4800be1584124e9eee92cf15ab947d33ec"
        "libwolv::git+https://github.com/WerWolv/libwolv#commit=49489507989d767d131342cf3e2c192288cecf14"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage#tag=ImHex-v$pkgver"
        "imhex-patterns::git+https://github.com/WerWolv/ImHex-Patterns#tag=ImHex-v$pkgver"
        0001-makepkg-Fix-compiler-check.patch
        0002-fix-Force-entropy-and-type-distribution-graphs-to-al.patch
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
            '69c53a429d7b6bbe47c1602ff6cfaac6d28d495f96604b5395f0a0d12154c61b'
            '8429bf0b8f2b2631a21baccc094e85d0634941f3d8b818cbb4d75aef7529a2cd'
            '16316b5a6354156bc0ce53a3e81d80ef990af7e3626b7ea4348b866bb339ef13'
            'ddbfeda031ccc161d3e3f3918207d6f7132cec72ff554ef82910da70214280ce')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'a09884dea7ee74dc75abd9437e2329ee454cdc4cd90dbe388d671d73ed3f6dd56ef9992c4cd0dd2937cc8eb0b67539791bd64ec76c6bb6c25a959691ba1cfb41'
        '34a08efbc1d3e78ab6d4babe49f3bb735f8a99ba03c1aa7a208abcd31f84576562f653ecc2057515468600f584d9d1ebc27071976f83fff989a75634b98efccf'
        'ed86730af8972c6b92408f8e829d0d16ab863b23ffcd51d234371f89ce8e2194083215a1a37b3cd324ddc1c767770a1c43369d90be49fc632b4917df7d542529'
        '6ad02f4bcfe406b23ae724e20766dbf4d32b88d63e83663baad191390002907a04c7ccd86c3640a651a46aa6db2f0889e27c5c26f4851730dc2edccf914d2ba2')
options=(!lto !strip)

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone libwolv pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in fmt curl yara/yara; do
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
    "$srcdir/0001-makepkg-Fix-compiler-check.patch" \
    "$srcdir/0002-fix-Force-entropy-and-type-distribution-graphs-to-al.patch"

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
