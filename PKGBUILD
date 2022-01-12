# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.13.2
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'mbedtls' 'libssh2' 'capstone'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme' 'openssl'
         'yara' 'fmt')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        0001-warnings-fix-format-security-warnings.patch
        0002-makepkg-Remove-external-dependencies-check.patch
        0003-archlinux-compat-Replace-mbedTLS-by-OpenSSL-for-CURL.patch
        imhex.desktop)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '958875474'
        '2410660081'
        '3400210263'
        '4178124713')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8f08f1d8d63ccea33268ccb21df75649b3bbb513f862f9410c68256376aba9af'
            '23f0266303a3b2e0f651d62799aabed1f495a7e0f10cb8b308811298a3ca9447'
            'bf9136bcce90a25a49f71a34fca33dd19290280408666239bbea01a12201a1e8'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '92294cc844b8d53ce7bf3a3fc2e3b93f4cad0b9b7b160a33967cadd5185238f30f525ae98977035dd75e2f6df072306fbe0302cfabc6cd66bc0f413a0060fcba'
        'f6de5713a871d5a7b5976bb8d70eb2dff355a82cc2a1088b95d90b8237ca6f80b9fb58cad6ad7d3a97e1d9207ab2418181dbf6c86ec6cbd7ca144136ee67f71c'
        '28d4610f9daed3f9e15785be4281f918636d5b7a93bdd1cb32c0d4d52d1f76ab225234a48c5c498a04e7c1271b56e090f7d665ac160dc1bf22dcccbc591a2e83'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs; do
    git config submodule.external/$name.url "$srcdir/$name"
  done
  for name in yara/yara fmt curl capstone; do
    git config --remove-section submodule.external/$name
  done
  git submodule update

  git apply \
    "$srcdir/0001-warnings-fix-format-security-warnings.patch" \
    "$srcdir/0002-makepkg-Remove-external-dependencies-check.patch" \
    "$srcdir/0003-archlinux-compat-Replace-mbedTLS-by-OpenSSL-for-CURL.patch"
}

build() {
  # We force GCC for now as libromfs build with clang is broken.

  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D CMAKE_C_COMPILER="gcc" \
    -D CMAKE_CXX_COMPILER="g++" \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_CURL=ON \
    -D USE_SYSTEM_CAPSTONE=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=ON \
    -D PROJECT_VERSION="$pkgver"
  cmake --build build
}

package() {
  # Executable
  install -Dm0755 build/imhex "$pkgdir/usr/bin/imhex"

  # Shared lib and plugins
  install -Dm0755 -t "$pkgdir/usr/lib" build/plugins/libimhex/libimhex.so

  for plugin in builtin; do
    install -Dm0755 -t "$pkgdir/usr/share/imhex/plugins" "build/plugins/$plugin/$plugin.hexplug"
  done

  # Desktop file(s)
  install -Dm0644 -t "$pkgdir/usr/share/applications" imhex.desktop
  install -Dm0644 "$pkgname/res/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/imhex.svg"
  for size in 32 48 64 128 256; do
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -a -f png -w $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/imhex.png" \
      "$pkgname/res/icon.svg"
  done

  install -Dm0644 "$pkgname/res/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/imhex.svg"

  # Misc files
  install -Dm0644 -t "$pkgdir/usr/share/imhex/resources" "$pkgname/res/resources"/*

  # License
  install -Dm0644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgname/README.md"
}
