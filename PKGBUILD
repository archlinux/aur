# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.19.2
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'libssh2' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara')
makedepends=('git' 'cmake' 'llvm' 'nlohmann-json' 'librsvg' 'python')
optdepends=(
  'imhex-patterns-git: ImHex base patterns'
)
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git#tag=v$pkgver"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "capstone::git+https://github.com/capstone-engine/capstone#branch=next"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage#tag=ImHex-v$pkgver"
        0001-makepkg-Remove-external-stuff.patch
        0002-archlinux-compat-Remove-unused-mbedTLS-code-from-lib.patch
        0003-fix-Deduplicate-resources-directories.patch)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '559898873'
        '540260233'
        '1832599645')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '244a57aff73da60f6e20f7a5086b3fea3d34bf30d39d1de247e1ab9cb631bec8'
            '9fee7806ded795954b8f5131d1799dc2a15011af22b44be4f83e84fe7bf02060'
            '255b25c94298b06b1ec725e05a3e113a533d0001dae28909b8c34fc621081b6b')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'c808b3b0dd174cd1233e949aed76e34cd21f432ca1b27fb582b9da279f025384ceab38fa8af797aec422e2d0e8941476a804b7f462ddb25c0439e1b0f96ce861'
        'a7532a182bce2fc946f117d20e0da499e0cdc7ef8fe1df4ff9fa77d6c6b0bb682f669ccf5a7e18792c74bcf9998fd86b0e2043f129bde069de29f01a8f58fd12'
        'a7669b46e4e6a0da883ca556a36d37c71be5420f376a9a684a3499dfc1bb32e667fe76d4177a85f2af1d9eeafaecbe8ae57a13ce1ddff593e38bf5f097fbb4a8')
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
    "$srcdir/0003-fix-Deduplicate-resources-directories.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-inconsistent-missing-override"

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
    install -Dm0755 -t "$pkgdir/usr/share/imhex/plugins" "build/plugins/$plugin.hexplug"
  done

  # Desktop file(s)
  install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname/dist/imhex.desktop"
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
