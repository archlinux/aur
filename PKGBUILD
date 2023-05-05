# Maintainer: SpotlightKid <aur -at- chrisarndt -dot de>
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Jean Pierre Cimalando <jp-dev@inbox.ru>

# TODO:
# - adjust common dependencies, to avoid unneeded ones
# - project license and doc files destinations (now only in lib package)
# - tell users on a pinned comment how to configure yay/whatever to skip tests?

_pkgname=sfizz
pkgbase=$_pkgname-git
pkgname=($_pkgname{,-{clients,lib,lv2,pd,vst3}}-git)
pkgver=1.2.1.r2.g6cd063da
pkgrel=1
pkgdesc="SFZ based sampler (git version)"
url="https://sfz.tools/sfizz"
arch=(x86_64)
license=(
  custom:BSD-2-Clause
  custom:ISC
)
makedepends=(
  cmake
  cxxopts
  freetype2
  ghc-filesystem
  git
  jack
  lv2
# simde
# vst3sdk
  xcb-util-keysyms
)
checkdepends=(lv2lint catch2)
source=("$_pkgname"::"git+https://github.com/sfztools/sfizz#branch=develop")
sha512sums=('SKIP')
b2sums=('SKIP')

_common_depends=(
  abseil-cpp
  gcc-libs
  glibc
)

_lv2_vst_vst3_depends=(
  cairo
  fontconfig
  libx11
  libxkbcommon
  libxkbcommon-x11
  pango
  pugixml
  ttf-roboto
  xcb-util
  xcb-util-cursor
  zenity
)

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
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule update --init --recursive

  # symlink tests data to top-level location so that tests can get to them (we build out of tree)
  ln -svf "$srcdir"/$_pkgname/tests "$srcdir"/tests
}

build() {
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
# Enabled by default, here for reference
#   -D SFIZZ_JACK=ON
#   -D SFIZZ_LV2=ON
#   -D SFIZZ_LV2_UI=ON
#   -D SFIZZ_VST=ON
    -D SFIZZ_PUREDATA=ON
    -D SFIZZ_TESTS=ON
    -D SFIZZ_USE_SYSTEM_CATCH=ON
    -D SFIZZ_USE_SYSTEM_ABSEIL=ON
    -D SFIZZ_USE_SYSTEM_CXXOPTS=ON
    -D SFIZZ_USE_SYSTEM_GHC_FS=ON
    -D SFIZZ_USE_SYSTEM_LV2=ON
    -D SFIZZ_USE_SYSTEM_PUGIXML=ON
# Wait for working simde 0.7.4+
#   -D SFIZZ_USE_SYSTEM_SIMDE=ON
#
# Keep this bundled as well for a while, will not hurt anyone :)
#   -D SFIZZ_USE_SYSTEM_VST3SDK=ON
#
# Same c++ standard version as for abseil-cpp:
# https://github.com/archlinux/svntogit-community/blob/packages/abseil-cpp/trunk/PKGBUILD#L28
    -D CMAKE_CXX_STANDARD=17
    -W no-dev
    -B build
    -S $_pkgname
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
  lv2lint -Mpack -I build/$_pkgname.lv2 "http://sfztools.github.io/sfizz"
}

package_sfizz-git() {
  depends=(
    $_pkgname-{clients,lib,lv2,pd,vst3}-git=$pkgver
  )
  provides=($_pkgname lib$_pkgname.so)
  conflicts=($_pkgname)

  DESTDIR="$pkgdir" cmake --install build

  (
    cd "$pkgdir"
    # have find-libdeps resolve dependencies properly:
    # https://gitlab.archlinux.org/archlinux/devtools/-/issues/102
    find usr/lib -type f \( -iname "*.clap" -or -iname "*.so" \) -exec chmod +x {} \;
    _pick $_pkgname-clients-git usr/bin/
    _pick $_pkgname-clients-git usr/share/man/
    _pick $_pkgname-lv2-git     usr/lib/lv2/
    _pick $_pkgname-pd-git      usr/lib/pd/
    _pick $_pkgname-vst3-git    usr/lib/vst3/
    _pick $_pkgname-lib-git     usr/include/
    _pick $_pkgname-lib-git     usr/lib/
  )
}

package_sfizz-lib-git() {
  pkgdesc+=' - Engine library'
  groups=(pro-audio)
  depends=(
    "${_common_depends[@]}"
    pugixml
  )
  mv -v $_pkgname-lib-git/* "$pkgdir"
  install -vDm 644 "$srcdir/$_pkgname"/LICENSE \
    -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -vDm 644 "$srcdir/$_pkgname"/{AUTHORS,CONTRIBUTING,GOVERNANCE,README}.md \
    -t "$pkgdir/usr/share/doc/$_pkgname/"
}

package_sfizz-clients-git() {
  pkgdesc+=' - JACK and render clients'
  groups=(pro-audio)
  depends=(
    "${_common_depends[@]}"
    jack
    $_pkgname-lib-git=$pkgver
  )
  mv -v $_pkgname-clients-git/* "$pkgdir"
}

package_sfizz-lv2-git() {
  pkgdesc+=" - LV2 plugin"
  groups=(pro-audio lv2-plugins)
  depends=(
    "${_common_depends[@]}"
    "${_lv2_vst_vst3_depends[@]}"
    lv2-host
    $_pkgname-lib-git=$pkgver
  )
  mv -v $_pkgname-lv2-git/* "$pkgdir"
  # Devendor ttf-roboto
  ln -svf /usr/share/fonts/TTF/Roboto-Regular.ttf \
    "$pkgdir/usr/lib/lv2/$_pkgname.lv2/Contents/Resources/Fonts/"
}

package_sfizz-pd-git() {
  pkgdesc+=" - Pure Data plugin"
  groups=(pro-audio)
  depends=(
    "${_common_depends[@]}"
    pd
    $_pkgname-lib-git=$pkgver
  )
  mv -v $_pkgname-pd-git/* "$pkgdir"
}

package_sfizz-vst3-git() {
  pkgdesc+=" - VST3 plugin"
  groups=(pro-audio vst3-plugins)
  depends=(
    "${_common_depends[@]}"
    "${_lv2_vst_vst3_depends[@]}"
    vst3-host
    $_pkgname-lib-git=$pkgver
  )
  mv -v $_pkgname-vst3-git/* "$pkgdir"
  # Devendor ttf-roboto
  ln -svf /usr/share/fonts/TTF/Roboto-Regular.ttf \
    "$pkgdir/usr/lib/vst3/$_pkgname.vst3/Contents/Resources/Fonts/"
}
