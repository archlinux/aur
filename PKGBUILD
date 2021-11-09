# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.10.1
pkgrel=3
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'mbedtls' 'libssh2'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme'
         'yara' 'fmt')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
  "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
  "git+https://git.sr.ht/~danyspin97/xdgpp"
  imhex.desktop
  0001-Fix-crash-on-pattern-load-319.patch
  0002-patterns-Limit-number-of-characters-displayed-in-a-s.patch
  0003-Fix-infinite-loop-on-signal-handling.patch)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        '4178124713'
        '3591955572'
        '35583119'
        '1275958398')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6'
            'cbe6a0f3623503be2c57905a2ed405ae3001ff5d8a8a708492f488f89672726c'
            'ba9794ebef4cec1085fe597f6b6e997e85ca9d839b084722729c7471d1117383'
            '43a3ad9a9bc05382dde3da52d6f065f0c770457e47629eb0363eb6968fa317c4')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc'
        '761635626e86b05bb03584219ef38e12abec1d2ef9dc78453ae0304fcbedbaa7c8f4859e5db8b89e08104bc94bcdd10d22de318628725cb8a0bde099f9a8ea25'
        'b83335ebf63db82605aac11b26fe87a09db8bd6b80d780bda168c10df6669c31554b6919c53b46db664a3f6f0748d220d007042fb7b2c20743581c6b64217c90'
        '8ffcb4fe81d5290a53d95498ae64c18f158fc4312140d6ae23bd802ee5346de477c4c9fa2adc0db039dd1c2733d8268294dcee82c81066aac8d4e3018a6607dd')

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp; do
    git config submodule.external/$name.url "$srcdir/$name"
  done
  for name in yara/yara fmt curl; do
    git config --remove-section submodule.external/$name
  done
  git submodule update

  git apply \
    "$srcdir/0001-Fix-crash-on-pattern-load-319.patch" \
    "$srcdir/0002-patterns-Limit-number-of-characters-displayed-in-a-s.patch" \
    "$srcdir/0003-Fix-infinite-loop-on-signal-handling.patch"
}

build() {
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
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
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
