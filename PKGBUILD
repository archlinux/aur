# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-ttools-meson-git
_srcname=aegisub-ttools
pkgver=3.2.2.r713.c88f918be
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support (TypesettingTools fork)'
arch=('x86_64')
url='http://www.aegisub.org'
license=('GPL' 'BSD')
depends=('boost-libs'
         'fontconfig' 'icu' 'libgl' 'wxgtk3' 'zlib' 'libass.so'
         # optional by the build system, but don't make much sense to exclude
         'alsa-lib' 'libffms2.so' 'fftw' 'hunspell' 'uchardet' 'glibc' 'libiconv'
         # 'gcc-libs' 'glibc' # part of 'base'
         # 'luajit' # Arch's luajit isn't compiled in 5.2 mode
         )
makedepends=('boost' 'git' 'intltool' 'lua' 'mesa' 'meson')
# 'libiconv' is on the AUR, but uses an expired GPG signing key,
# which makes building quite inconvenient over using the vendored one.
provides=('aegisub')
conflicts=('aegisub' 'aegisub-git')
source=(
  "$_srcname::git+https://github.com/TypesettingTools/Aegisub.git"
  "luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
  "gtest-1.14.0.tar.gz::https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz"
  "gtest_1.14.0-1_patch.zip::https://wrapdb.mesonbuild.com/v2/gtest_1.14.0-1/get_patch"
)
noextract=(
  "gtest-1.14.0.tar.gz"
  "gtest_1.14.0-1_patch.zip"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
  '2e693c7d3f9370a7aa6dac802bada0874d3198ad4cfdf75647b818f691182b50'
)

pkgver() {
  cd "$_srcname"

  tag='v3.2.2'
  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_srcname"

  # for patch in ../*.patch; do
  #   echo "  applying patch: $patch"
  #   patch -u -p1 < "$patch"
  # done

  # Cleanup previous builds
  rm -vf subprojects/luajit subprojects/packagecache/gtest-1.14.0.tar.gz subprojects/packagecache/gtest_1.14.0-1_patch.zip

  # Initialize subproject wraps for luajit
  ln -vs ../../luajit subprojects/luajit
  meson subprojects packagefiles --apply luajit

  # and gtest
  mkdir -vp subprojects/packagecache
  ln -vs ../../../gtest-1.14.0.tar.gz subprojects/packagecache/gtest-1.14.0.tar.gz
  ln -vs ../../../gtest_1.14.0-1_patch.zip subprojects/packagecache/gtest_1.14.0-1_patch.zip

  arch-meson builddir \
    -Dportaudio=disabled \
    -Dopenal=disabled
}

build() {
  cd "$_srcname"

  ninja -C builddir
}

package() {
  cd "$_srcname"

  DESTDIR="${pkgdir}" ninja -C builddir install
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
