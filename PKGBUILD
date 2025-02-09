# Maintainer: iTrooz <aur@itrooz.fr>
# Actual Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

# Old Maintainer: Seth Buccella <sethfb at gmail dot com>
# Old Contributor: Alex Sarum <rum.274.4 at gmail dot com>

# NOTE : This PKGBUILD is a copy of https://aur.archlinux.org/packages/imhex (maintained by KokaKiwi) with trivial modifications to fetch the latest commit.

pkgname=imhex-git
pkgver=1.36.0.r386.gea3d4b41a
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara' 'capstone')
makedepends=('git' 'cmake'
             'llvm' 'nlohmann-json' 'librsvg'
             'python' 'cli11' 'dotnet-runtime')
optdepends=('dotnet-runtime: support for .NET scripts')
provides=('imhex' 'imhex-patterns')
conflicts=('imhex' 'imhex-patterns-git')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git"
        "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
        "xdgpp::git+https://git.sr.ht/~danyspin97/xdgpp"
        "libromfs::git+https://github.com/WerWolv/libromfs"
        "libwolv::git+https://github.com/WerWolv/libwolv"
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage"
        "ImHex-Patterns::git+https://github.com/WerWolv/ImHex-Patterns"
        "disassembler::git+https://github.com/WerWolv/Disassembler"
        "edlib::git+https://github.com/Martinsos/edlib"
        "lunasvg::git+https://github.com/sammycage/lunasvg"
        "plutovg::git+https://github.com/sammycage/plutovg"
        "jthread::git+https://github.com/josuttis/jthread"
        "throwing_ptr::git+https://github.com/rockdreamer/throwing_ptr"
        "HashLibPlus::git+https://github.com/WerWolv/HashLibPlus")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')
options=(!lto !strip)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  git submodule init

  # ImHex third_party submodules
  for name in nativefiledialog xdgpp lunasvg edlib HashLibPlus; do
    git config submodule.lib/third_party/$name.url "$srcdir/$name"
  done

  # ImHex third_party nested submodules
  for name in jthread; do
    git config submodule.lib/third_party/$name/$name.url "$srcdir/$name"
  done

  # ImHex external submodules
  for name in libromfs disassembler pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done

  # ImHex system libraries used - remove submodules
  for name in capstone fmt yara/yara; do
    git config --remove-section submodule.lib/third_party/$name
  done
  git -c protocol.file.allow=always submodule update

  # PatternLanguge submodules
  for name in libwolv throwing_ptr; do
    git -C lib/external/pattern_language \
      config submodule.external/$name.url "$srcdir/$name"
  done
  git -C lib/external/pattern_language -c protocol.file.allow=always \
    submodule update

  # lunasvg submodules
  for name in plutovg; do
    git -C lib/third_party/lunasvg \
      config submodule.$name.url "$srcdir/$name"
  done
  git -C lib/third_party/lunasvg -c protocol.file.allow=always \
    submodule update
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
    -D IMHEX_STRICT_WARNINGS=OFF \
    -D IMHEX_BUNDLE_DOTNET=OFF \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=ON \
    -D USE_SYSTEM_CLI11=ON \
    -D IMHEX_VERSION="$pkgver"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Remove updater
  rm "$pkgdir/usr/bin/imhex-updater"

  # Patterns
  install -dm0755 "$pkgdir/usr/share/imhex"
  cp -r -t "$pkgdir/usr/share/imhex" \
    "$srcdir/ImHex-Patterns"/{constants,encodings,includes,magic,nodes,patterns,plugins,scripts,tests,themes,tips,yara}

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
