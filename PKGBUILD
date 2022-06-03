# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.18.2
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'libssh2'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme' 'openssl'
         'fmt' 'yara')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
optdepends=('imhex-patterns-git: ImHex base patterns')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "capstone::git+https://github.com/capstone-engine/capstone#branch=next"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage"
        0001-makepkg-Remove-external-stuff.patch
        0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch
        0003-fix-Build-errors-with-GCC-12.1.0.patch
        imhex.desktop)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '3374949146'
        '3561209881'
        '1302454653'
        '4178124713')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0bfff0f03fa8ffe312162e7d43c0c0feb8aaa332e15c497c95fffc6704169c8f'
            '82a1b0e4e1f02a998eb178dfc0cf75ad9c6b4ca9819cbe0f90d3c65ed07a367d'
            'cee653d96a96df1792977ab1509cd7cb94c2d10b20540a7ffca75f8e0ebcc847'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'fe6432359f2ab2b7ad9d7541e96d46ab3113999c743bd46b021bc67247ea64d9b409b62580a8ffc857cbee7896c6bf0aeae5cb031c14901655d6a2be30ce3aa5'
        'a7e624148a9a0cd7617626fb2c6b07c2c6354bc1b0b09d31c93ea7b5dc9058e11a304da03a9b85d9483aea4b874d2ef3b346fec0da8e8df04fcec8bb9430c266'
        '0de6ce0c2ed58839815571a5f747d8a726893b7daf3898fc338cd46834ce697bb42dd88ea71d5be1fee6c13dabc68f4c431fc67d9339fe7eeda515bb2bb71c14'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')
options=(!lto)

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in fmt curl yara/yara; do
    git config --remove-section submodule.lib/external/$name
  done
  git submodule update

  git apply \
    "$srcdir/0001-makepkg-Remove-external-stuff.patch" \
    "$srcdir/0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch" \
    "$srcdir/0003-fix-Build-errors-with-GCC-12.1.0.patch"
}

build() {
  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
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
