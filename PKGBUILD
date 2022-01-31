# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.14.0
pkgrel=2
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'mbedtls' 'libssh2'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme' 'openssl'
         'yara' 'fmt')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "capstone::git+https://github.com/capstone-engine/capstone#branch=next"
        0001-makepkg-Remove-external-dependencies-check.patch
        0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch
        0003-Fix-capstone-include-path.patch
        imhex.desktop)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '3961896925'
        '114465395'
        '2337567663'
        '4178124713')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '04bf8dca14ddf7d5e21ca5b657673e2a18b61d4209945322e8cae66d1bcc7fe3'
            'c6438cba236ddc69b31a69a800f9db9f842babf48484376f86745495daea9265'
            '34cb39c53cdfcadce4b556fed1ced1a4280f2fb2a37db724cf112fd896965145'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '8bbbb346abfab740e102720ba84eca9b8b3dc7925874d4623042a2d027d6b7644592e118c4f5ade8498f3232cc9bf393da208a97492b5a5de5d02a393be1f40e'
        'cc62ff2933d9cff5a501ee8b76e7d2f89676b1e3030b87157b3a655806bd0a95eb0ce022ab651cb91b40345e2c4b548b02b5ae8b270f4611596d95f96b197a80'
        'a1b6fd1bf30fa982580790e4593cffb0670471be9df9eb2ac2415a5be22cd6c140b5ca46019a09f11815b1a1022b823f2f1771a150e5760a5d37f7513f2c36cf'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in yara/yara fmt curl; do
    git config --remove-section submodule.lib/external/$name
  done
  git submodule update

  git apply \
    "$srcdir/0001-makepkg-Remove-external-dependencies-check.patch" \
    "$srcdir/0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch" \
    "$srcdir/0003-Fix-capstone-include-path.patch"
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
