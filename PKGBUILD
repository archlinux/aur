# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.13.1
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
        '2731343777'
        '1065450062'
        '1475329516'
        '4178124713')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'cd76811ae9ba4dec024789df7911bcde62068ca8bd7bc4b7b4929becab4a2cbe'
            'ed7ec4af837d18800ce8b79098568447931f9265e9c88734441f8644124b6dc2'
            '108dbeb30c796cc1a29a51462ee169162859d076a9916db4e47e2c34361c9b26'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'f4c0c5018b14083c568a1b22fe546c146b267afb327240f94488d55cac14d321b2d18a949b0e2f2635641dbaca7c0a85f60de125219f563a38f1a11efb333b42'
        'd80571606e5dac33720d0af44f100b6355c592626b6ef22033556020aff1c00b9b18864c0c9aa3f0a46ec8c371240eba63eb9878916d7cc0ed54114d3ffd09dd'
        '65f84db4f5fcc30e0da3b3ab69f4c1dcc550f211755cd571249b5018cb835849ed575a5b852ee3f27f9a41ea679a757a238a9368b8d45ff8f89901b04423beda'
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
