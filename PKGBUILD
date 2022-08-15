# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.21.1
pkgrel=2
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
        0001-makepkg-Fix-compiler-flags.patch
        0002-makepkg-Fix-compiler-check.patch
        0003-fix-Deduplicate-resources-directories.patch
        0004-makepkg-Fix-build-with-clang.patch
        0005-fix-Some-occurrences-of-undefined-behaviour.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '7cfdbcb6352991fb6291e05b9962121fc7bce4462dfc09353830fa826f8d5383'
            '8cd77697c42945f207092175728468613992ca33d47974132cc39c378ea16e00'
            '0be236fcd1a1d67eed8bfcb3950c04e1040e783acd60893e72756f8e19b7fc40'
            '64d198eff9b9d7129bcbde1c0035d6d45d97454ccf2102190c163846622c5bb5'
            'cf4162fc661eb3684e060126d02b9ca68f40ed67cfff3fee2e7e01a900c525da')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '13b7ec6ecb7043f672b1ddf6ead34d2f523ffa1509916c496105c3a0a675783ca10d90f5c0c8662da750a769fb3f1b76914918b60317c90bacf21c207f04b100'
        '624197c84cd3f812453b471632d24c7cf446da8be31b8997892bb96148dfba480fbf748c05629886a3de846ace9725331e192fdf0d43e72d4850606b40da8401'
        'ab99e00d4db4c65eda48be90f0eb7c42e2032b593ab0d4219980210c8d1aa6d8f61efef867b9d87def427ab0e3404d4aa358f7870c581ebdc48c06e25e6524d4'
        '56775e9156b9a029b40268ddacc41d6a184d4d42bd000a464a8f6de7429ef07b83cf87e48b45ec78394a602a5228769a6535caa321589de3cab88caf8ae436a9'
        'be5b9f3299337139a00819bdc87ec321a1ea961f2eea54877e9f9bfaea7b365dd772d5b85d44357c6054b57df0a2232f53e535d9b5ead9b1c2e7a0eb9a138c08')
options=(!lto !strip)

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
    "$srcdir/0001-makepkg-Fix-compiler-flags.patch" \
    "$srcdir/0002-makepkg-Fix-compiler-check.patch" \
    "$srcdir/0003-fix-Deduplicate-resources-directories.patch" \
    "$srcdir/0004-makepkg-Fix-build-with-clang.patch" \
    "$srcdir/0005-fix-Some-occurrences-of-undefined-behaviour.patch"
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
    -D IMHEX_VERSION="$pkgver"

  make -C build
}

package() {
  # Executable
  install -Dm0755 build/imhex "$pkgdir/usr/bin/imhex"

  # Shared lib and plugins
  install -Dm0755 -t "$pkgdir/usr/lib" build/lib/libimhex/libimhex.so

  for plugin in builtin; do
    install -Dm0755 -t "$pkgdir/usr/lib/imhex/plugins" "build/plugins/$plugin.hexplug"
  done

  install -dm0755 "$pkgdir/usr/share/imhex"

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
