# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.30.1
pkgrel=4
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara')
makedepends=('git' 'cmake' 'llvm' 'nlohmann-json' 'librsvg' 'python')
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
        0001-makepkg-Fix-compiler-check.patch
        0002-fix-CI-being-broken-on-Arch-Linux.patch
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
            '90b83d03d5ef38f44aec8335857e47c786450c652766e720d5d98ad3cebc409d'
            '9264c83e389dfa0d0310a4081a51fff96788309a406fad5d4ccb19ea36bdd758'
            '9450b68e9fa61ade7ca64251bd1c1e3ed281ccae3795d933f7212ea7927770ab'
            'e55aecea0c46a0d7627476c43767de827e253399dee588ddfb4cb70853bceb8a')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '3face06d85b0b071952be1a31ad674fdf55027b05bb07609854bd4480d75958707fcf29ca9fa8b4bec307d5bf8ec4c5122df248cca406b4119a7a0ee5ef6ff56'
        'bcdc990dcea05b04a2fc57928b6146e5c7993f56d268b19b3927771e1e2ebd6bd8683c860085c0811bd235c27209a19ec0394b65edefa12e2c20e9e3674f7c8b'
        '61be56bfa2fc9dc5e4a8e5af1c82852326c662fffcc98c094aaa68945cb00c21f856e0c3bba6b815fe584bc65bad564ddda632486021943ab939e829cf9ad892'
        'f9067bd94f1c7ed4551fe31408eebc151884a20f292a48bf23f2c4fc963b3af076c464f8fcbfb97cd3c713b4088a66e5cef8b41c2ce94e39af04e5dc5c1f377d')
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
    "$srcdir/0002-fix-CI-being-broken-on-Arch-Linux.patch"

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
