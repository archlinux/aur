# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-ttools-meson-git
_srcname=aegisub-ttools
pkgver=3.2.2.r672.5bde34ff3
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
  "gtest-1.8.1.zip::https://github.com/google/googletest/archive/release-1.8.1.zip"
  "gtest-1.8.1-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip"
)
noextract=(
  "gtest-1.8.1.zip"
  "gtest-1.8.1-1-wrap.zip"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7'
  'f79f5fd46e09507b3f2e09a51ea6eb20020effe543335f5aee59f30cc8d15805'
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

  # Initialize subproject wraps for luajit
  ln -s ../../luajit subprojects/luajit
  meson subprojects packagefiles --apply luajit
  # and gtest
  mkdir subprojects/packagecache
  ln -s ../../../gtest-1.8.1.zip subprojects/packagecache/gtest-1.8.1.zip
  ln -s ../../../gtest-1.8.1-1-wrap.zip subprojects/packagecache/gtest-1.8.1-1-wrap.zip

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
