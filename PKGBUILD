# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.17.0
pkgrel=2
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'libssh2'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme' 'openssl'
         'fmt')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
optdepends=('imhex-patterns-git: ImHex base patterns')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "capstone::git+https://github.com/capstone-engine/capstone#branch=next"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage"
        "yara::git+https://github.com/VirusTotal/yara#tag=v4.2.0"
        0001-makepkg-Remove-external-stuff.patch
        0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch
        0003-fix-Random-build-errors-with-GCC-12.1.0.patch
        0004-fix-Build-errors-with-GCC-12.1.0.patch
        imhex.desktop)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '3698762529'
        '2095494781'
        '2042532667'
        '1480655224'
        '4178124713')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6601ff91c7145bffffe65b09af9e233f5cc40515ad301dc7a54514e36a462a34'
            '9b25d6f29bf3479d078379150ad4dae6b2a131772392020d01646ab4e580a299'
            'c8d644062110085080ca42de12006505533dd228bfa57e49b644531fd5960427'
            '809ad8b6d3417e5d916c3eca6238713ca8ddfcd024b37d14e8b7abdde143e681'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '0562218d49298cdd454c4c9dd6e320dfd53d4618e610ed00fd67b05f97a94ece7b4619afe6b9cee07e2f77f9ec53c33ed6b606e198103670b38da3fdac30e83f'
        '48b6c4b9e30cbf5cbbf41dcfff768bc4b2a8e09386817fa847f6b8539d70faaaae603d999670c4858027304780469bc233a82b68a7922326e88c4907a93ed7ed'
        'b1785000b477627677d0205535815392dedc940fb918a3fc3ed08fd4a514acfe139eca8a5945a22988bbd56d7d87c236e5b04fa20c8ea175c8351ea4ce10cb90'
        'de299359682d7339782c2924c1f9cc4a56b31ecddab1fadef68668fb36b572e20199fbdf17b81f9ecbd24739924c492459e58d582aab5a4e0d7dc194cee7a68e'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')
options=(lto)

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  git config submodule.lib/external/yara/yara.url "$srcdir/yara"
  for name in fmt curl; do
    git config --remove-section submodule.lib/external/$name
  done
  git submodule update

  git apply \
    "$srcdir/0001-makepkg-Remove-external-stuff.patch" \
    "$srcdir/0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch" \
    "$srcdir/0003-fix-Random-build-errors-with-GCC-12.1.0.patch" \
    "$srcdir/0004-fix-Build-errors-with-GCC-12.1.0.patch"
}

build() {
  # We force GCC for now as libromfs build with clang is broken.

  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=OFF \
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
    install -Dm0755 -t "$pkgdir/usr/share/imhex/plugins" "build/plugins/$plugin/$plugin.hexplug"
  done

  # Desktop file(s)
  install -Dm0644 -t "$pkgdir/usr/share/applications" imhex.desktop
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
