# Maintainer: iTrooz <itrooz+aur@itrooz.proton.me>
# Actual Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

# Old Maintainer: Seth Buccella <sethfb at gmail dot com>
# Old Contributor: Alex Sarum <rum.274.4 at gmail dot com>

# NOTE : This PKGBUILD is a copy of https://aur.archlinux.org/packages/imhex (maintained by KokaKiwi) with trivial modifications to fetch the latest commit.

pkgname=imhex-git
pkgver=1.25.0.r1.g91a4f52f
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
        "pattern_language::git+https://github.com/WerWolv/PatternLanguage"
        0001-makepkg-Fix-compiler-check.patch
        0002-fix-Deduplicate-resources-directories.patch
        pl-0001-Use-C-23-standard.patch
        pl-0002-makepkg-Remove-extraneous-compiler-flags.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c13f47520affa06b3ab4687d528084ff1f7ecc2cd9600b2e43dae0513727eb5f'
            'b004f268d18c03e2d225179fb52ca02877e93d81d87b4f08344f19ad4ab6fd31'
            '2110b942bba25d6d0b0fe4f4ad2b47c9907ad329a0d064ff86bf54b83965f673'
            '6bf93b82a254f79bdf92aefda4bcf413dcbe26b4b42444f1fd18793ee35cb402')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '75030d92294ff36642acbae000931ee6b8f03ba6e577b66b5c70a058ca9320f521368fbe225b642df1f4138172c24d966c9ec66fd4eb7f9de24ee896e91363cf'
        'ad679ef4fde42ebf9adefec9c3bffb9b640e79f2917141940050e285c79b13e1c7ad58f497db01dd22e56750372545ac544fb4b5400c5d5895461f931365a50e'
        '3c10abfafeb8979924efff0b5d32e543f9ca2fa3eb4216f1c84d8cb5a6ba6c8af4c5b7e3012d4f535d132fe2492c6824473ed309e8ce09d012963de033bf37b5'
        '2c26d8b28212b98b9bb202f86c5ff84ac4bd44732ee3a30bdca91b576f5a64802c454314baff53621aafa08f761871ae95102b1727ba1f5a5d300103895e07a6')
options=(!lto !strip)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  git submodule init
  for name in nativefiledialog xdgpp libromfs capstone pattern_language; do
    git config submodule.lib/external/$name.url "$srcdir/$name"
  done
  for name in fmt curl yara/yara; do
    git config --remove-section submodule.lib/external/$name
  done
  git -c protocol.file.allow=always submodule update

  git apply \
    "$srcdir/0001-makepkg-Fix-compiler-check.patch" \
    "$srcdir/0002-fix-Deduplicate-resources-directories.patch"

  git -C lib/external/pattern_language apply \
    "$srcdir/pl-0001-Use-C-23-standard.patch" \
    "$srcdir/pl-0002-makepkg-Remove-extraneous-compiler-flags.patch"
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
