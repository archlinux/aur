# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname='skia-sharp58'
pkgver='1.58.1.1'
_major='58'
_minor='1'
_release='1'
_depot_tools_commit='ecf3dbe'
_skia_commit='79502c2'
pkgrel='1'
pkgdesc='The Skia 2D Graphics library from Google exposed to .NET languages and runtimes across the board'
arch=('i686' 'x86_64')
url='https://github.com/mono/SkiaSharp'
license=('MIT')
depends=('fontconfig' 'gcc-libs' 'glibc'
         'libfreetype.so')
makedepends=('clang' 'git' 'python2')
provides=('libSkiaSharp.so')
source=("skia-sharp-${pkgver}.tar.gz::https://github.com/mono/SkiaSharp/archive/v${pkgver}.tar.gz"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools#commit=${_depot_tools_commit}"
        "git+https://github.com/mono/skia.git#commit=${_skia_commit}")
sha256sums=('512e7736eddd84bcddf5e5879595d31f1c5503b2f2670b05fee8ff7244e3f824'
            'SKIP'
            'SKIP')

prepare() {
  cd SkiaSharp-${pkgver}

  rmdir externals/{depot_tools,skia}
  ln -sf ${srcdir}/{depot_tools,skia} externals/
  ln -sf /usr/bin/python2 externals/depot_tools/python

  cd externals/skia

  python2 tools/git-sync-deps
}

build(){
  pushd SkiaSharp-${pkgver}/externals/skia

  [[ $CARCH == 'i686' ]] && export ARCH='x86'
  [[ $CARCH == 'x86_64' ]] && export ARCH='x64'
  export PATH="${srcdir}/depot_tools:$PATH"
  export VERSION="1.${_major}.${_minor}.${_release}"
  export SUPPORT_GPU='0'
  export PYTHON='/usr/bin/pyton2'

  CFLAGS="$CFLAGS -DSKIA_C_DLL -Wno-cast-qual -Wno-unused-template -Wno-zero-as-null-pointer-constant -Wno-inconsistent-missing-destructor-override"
  LDFLAGS="$LDFLAGS -lfreetype"

  target_os='linux'
  target_cpu="$ARCH"
  extra_cflags=""
  for cflag in $CFLAGS; do
    extra_cflags+="\"${cflag}\","
  done
  extra_ldflags=""
  for ldflag in $LDFLAGS; do
    extra_ldflags+="\"${ldflag}\","
  done

  bin/gn gen out/${target_os}/${target_cpu} --args="target_os=\"${target_os}\" target_cpu=\"${target_cpu}\" cc=\"clang\" cxx=\"clang++\" extra_cflags=[${extra_cflags}] extra_ldflags=[${extra_ldflags}] skia_enable_gpu=false skia_enable_tools=false skia_use_icu=false skia_use_sfntly=false is_official_build=true is_component_build=false is_debug=false"
  ninja -C out/${target_os}/${target_cpu}

  popd
  pushd SkiaSharp-${pkgver}/native-builds/libSkiaSharp_linux

  make

  popd
}

package() {
  cd SkiaSharp-${pkgver}/native-builds/libSkiaSharp_linux

  install -dm 755 "${pkgdir}"/usr/{lib/skia-sharp58,share/licenses/skia-sharp58}
  install -m 755  bin/$ARCH/libSkiaSharp.so.${_major}.${_minor}.${_release} -t "${pkgdir}"/usr/lib/skia-sharp58/
  ln -s libSkiaSharp.so.${_major}.${_minor}.${_release} "${pkgdir}"/usr/lib/skia-sharp58/libSkiaSharp.so.${_major}
  ln -s libSkiaSharp.so.${_major} "${pkgdir}"/usr/lib/skia-sharp58/libSkiaSharp.so
  install -m 644 ../../LICENSE.md -t "${pkgdir}"/usr/share/licenses/skia-sharp58/
}

# vim: ts=2 sw=2 et:
