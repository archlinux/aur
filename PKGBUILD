# Maintainer: SpotlightKid <aur -at- chrisarndt -dot de>
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Jean Pierre Cimalando <jp-dev@inbox.ru>

# Based on official PKGBUILD by dvzrv at
# https://gitlab.archlinux.org/archlinux/packaging/packages/sfizz/

_pkgname=sfizz
_gitname=$_pkgname-ui
pkgbase=$_pkgname-git
pkgname=(
  sfizz-git
  sfizz-{lib,lv2,standalone,vst3}-git
  pd-sfizz-git
)
pkgver=1.2.2.r0.ga6b38b8
pkgrel=1
pkgdesc="SFZ based sampler (git version)"
url="https://sfz.tools/sfizz"
arch=(x86_64)
license=(BSD)
makedepends=(
  abseil-cpp
  cairo
  cmake
  cxxopts
  gcc-libs
  ghc-filesystem
  git
  glibc
  jack
  freetype2
  libx11
  libxkbcommon
  libxkbcommon-x11
  lv2
  pango
  pugixml
  simde
  vst3sdk
  xcb-util
  xcb-util-cursor
  xcb-util-keysyms
)
checkdepends=(
  lv2lint
  catch2
)
source=(
  $_gitname::git+https://github.com/sfztools/sfizz-ui#branch=develop
  library::git+https://github.com/sfztools/sfizz
  git+https://github.com/mackron/dr_libs
  git+https://github.com/sfztools/libaiff
  git+https://github.com/sfztools/stb_vorbis
  wavpack::git+https://github.com/dbry/WavPack.git
)
sha512sums=('SKIP'
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
        'SKIP')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

pkgver() {
  cd $_gitname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_gitname
  git submodule init
  git config submodule.library.url "$srcdir"/library
  git -c protocol.file.allow=always submodule update ./library
  # Use latest HEAD of sfizz library repo, because that's what the previous
  # version of the PKGBUILD (inadvertently) did.
  git -c protocol.file.allow=always submodule update --remote --merge ./library

  cd library
  git submodule init
  for module in dr_libs libaiff stb_vorbis wavpack; do
    git config submodule.external.st_audiofile.thirdparty.$module.url "$srcdir"/$module
    git -c protocol.file.allow=always submodule update ./external/st_audiofile/thirdparty/$module
  done

  # symlink tests data to top-level location so that tests can get to them (we build out of tree)
  ln -svf "$srcdir"/library/tests "$srcdir"
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_CXX_STANDARD=17
    -D PLUGIN_PUREDATA=ON
    -D SFIZZ_TESTS=ON
    -D SFIZZ_USE_SYSTEM_ABSEIL=ON
    -D SFIZZ_USE_SYSTEM_CATCH=ON
    -D SFIZZ_USE_SYSTEM_CXXOPTS=ON
    -D SFIZZ_USE_SYSTEM_GHC_FS=ON
    -D SFIZZ_USE_SYSTEM_LV2=ON
    -D SFIZZ_USE_SYSTEM_PUGIXML=ON
    -D SFIZZ_USE_SYSTEM_SIMDE=ON
    -D SFIZZ_USE_SYSTEM_VST3SDK=ON
    -S $_gitname
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build/library --output-on-failure
  lv2lint -Mpack -I build/$_pkgname.lv2 "http://sfztools.github.io/sfizz"
}

package_sfizz-git() {
  depends=(
    $_pkgname-{lib,lv2,standalone,vst3}-git
    pd-$_pkgname-git
  )
  provides=($_pkgname)
  conflicts=($_pkgname)

  DESTDIR="$pkgdir" cmake --install build

  (
    cd "$pkgdir"

    _pick $_pkgname-lib-git usr/include
    _pick $_pkgname-lib-git usr/lib/lib$_pkgname.so*
    _pick $_pkgname-lib-git usr/lib/pkgconfig/$_pkgname.pc

    _pick $_pkgname-lv2-git usr/lib/lv2

    _pick $_pkgname-standalone-git usr/bin
    _pick $_pkgname-standalone-git usr/share/man/man1

    _pick $_pkgname-vst3-git usr/lib/vst3

    _pick pd-$_pkgname-git usr/lib/pd
  )
}

package_pd-sfizz-git() {
  pkgdesc+=" - pd external"
  groups=(
    pd-externals
    pro-audio
  )
  depends=(
    abseil-cpp
    gcc-libs
    glibc
    pd
    pugixml
  )
  provides=(pd-$_pkgname)
  conflicts=(pd-$_pkgname)

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $_gitname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_gitname/{AUTHORS,CONTRIBUTING,GOVERNANCE,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}

package_sfizz-lib-git() {
  pkgdesc+=" - library"
  depends=(
    abseil-cpp
    gcc-libs
    glibc
    pugixml
  )
  provides=($_pkgname-lib lib$_pkgname.so)
  conflicts=($_pkgname-lib)

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $_gitname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_gitname/{AUTHORS,CONTRIBUTING,GOVERNANCE,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}

package_sfizz-lv2-git() {
  pkgdesc+=" - LV2 plugin"
  groups=(
    lv2-plugins
    pro-audio
  )
  depends=(
    abseil-cpp
    cairo
    fontconfig
    gcc-libs
    glib2
    glibc
    libxcb
    libxkbcommon
    libxkbcommon-x11
    lv2-host
    pango
    pugixml
    ttf-roboto
    xcb-util
    xcb-util-cursor
    zenity
  )
  provides=($_pkgname-lv2)
  conflicts=($_pkgname-lv2)

  mv -v $pkgname/* "$pkgdir"
  # devendor ttf-roboto
  ln -svf /usr/share/fonts/TTF/Roboto-Regular.ttf \
    "$pkgdir"/usr/lib/lv2/$_pkgname.lv2/Contents/Resources/Fonts
  install -vDm 644 $_gitname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_gitname/{AUTHORS,CONTRIBUTING,GOVERNANCE,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}

package_sfizz-standalone-git() {
  pkgdesc+=" - standalone"
  groups=(
    pro-audio
  )
  depends=(
    abseil-cpp
    gcc-libs
    glibc
    pugixml
  )
  optdepends=(
    'jack: for sfizz_jack'
  )
  provides=($_pkgname-standalone)
  conflicts=($_pkgname-standalone)

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $_gitname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_gitname/{AUTHORS,CONTRIBUTING,GOVERNANCE,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}

package_sfizz-vst3-git() {
  pkgdesc+=" - VST3 plugin"
  groups=(
    pro-audio
    vst3-plugins
  )
  depends=(
    abseil-cpp
    cairo
    fontconfig
    gcc-libs
    glib2
    glibc
    libxcb
    libxkbcommon
    libxkbcommon-x11
    pango
    pugixml
    ttf-roboto
    vst3-host
    xcb-util
    xcb-util-cursor
    zenity
  )
  provides=($_pkgname-vst3)
  conflicts=($_pkgname-vst3)

  mv -v $pkgname/* "$pkgdir"
  # devendor ttf-roboto
  ln -svf /usr/share/fonts/TTF/Roboto-Regular.ttf \
    "$pkgdir"/usr/lib/vst3/$_pkgname.vst3/Contents/Resources/Fonts/
  install -vDm 644 $_gitname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_gitname/{AUTHORS,CONTRIBUTING,GOVERNANCE,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname/
}
