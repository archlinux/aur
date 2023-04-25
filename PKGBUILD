# Maintainer: iTrooz <aur@itrooz.fr>
# Actual Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

# Old Maintainer: Seth Buccella <sethfb at gmail dot com>
# Old Contributor: Alex Sarum <rum.274.4 at gmail dot com>

# NOTE : This PKGBUILD is a copy of https://aur.archlinux.org/packages/imhex (maintained by KokaKiwi) with trivial modifications to fetch the latest commit.

pkgname=imhex-git
pkgver=1.28.0.r73.gb0028b0e
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
provides=(imhex)
conflicts=(imhex)
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "capstone::git+https://github.com/capstone-engine/capstone#branch=next"
        "libwolv::git+https://github.com/WerWolv/libwolv"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage"
        0001-makepkg-Fix-compiler-check.patch
        pl-0001-Use-C-23-standard.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '43bdbbb6edf567201fa52f1c695f77fea9a27dd5c62de615ef74d64a5e676a98'
            '4c3e667d40eabe2a5ea724125c69f73bcb6774c01db9ad97bc6b633e1c284fc5')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '99e8c5fb5dc0ad07039731c3245bec097de25e675be0f5c52c799738d794ee26df6506adf34fac42663dd39f1c84e7e1675aac5b2f47ef4f2d5ebb903ad4b3a3'
        'ca3779e974709fa15e55255973eb2ff34fb21251c9f8b00c5b2efcfb175add34b503063984589c8d716b650a9543aa19dc2185b2f531ab8d4363635724114199')
options=(!lto !strip)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
    "$srcdir/0001-makepkg-Fix-compiler-check.patch"

  git -C lib/external/pattern_language apply \
    "$srcdir/pl-0001-Use-C-23-standard.patch"
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
    -D LIBPL_ENABLE_CLI=OFF

  cmake --build build
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
