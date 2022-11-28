# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=drops
pkgname="$_pkgname-git"
pkgver=1.0.beta.2.r0.g185cf4b
pkgrel=2
pkgdesc='A sample player instrument LV2/VST2 plugin and stand-alone JACK program (git version)'
arch=('x86_64')
url='https://github.com/clearly-broken-software/drops'
license=('GPL3')
depends=(gcc-libs libgl libglvnd)
makedepends=(git jack2 libsndfile)
groups=(lv2-plugins pro-audio vst-plugins)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}")
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/clearly-broken-software/${_pkgname}.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'nanosvg::git+https://github.com/memononen/nanosvg.git'
        'sfizz::git+https://github.com/sfztools/sfizz.git'
        'abseil-cpp::git+https://github.com/abseil/abseil-cpp.git'
        'vst3_base::git+https://github.com/steinbergmedia/vst3_base.git'
        'vst3_pluginterfaces::git+https://github.com/steinbergmedia/vst3_pluginterfaces.git'
        'vst3_public_sdk::git+https://github.com/steinbergmedia/vst3_public_sdk.git'
        'vstgui4::git+https://github.com/sfztools/vstgui.git'
        'dr_libs::git+https://github.com/mackron/dr_libs.git'
        'stb_vorbis::git+https://github.com/sfztools/stb_vorbis.git'
        'libaiff::git+https://github.com/sfztools/libaiff.git'
        'sfzt_auwrapper::git+https://github.com/sfztools/sfzt_auwrapper.git'
        'filesystem::git+https://github.com/gulrak/filesystem.git'
        'simde::git+https://github.com/simd-everywhere/simde.git'
        )
md5sums=('SKIP'
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
         'SKIP'
         'SKIP')

pkgver() {
  cd $_pkgname

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule.sfizz.url "$srcdir"/sfizz
  git config submodule.dpf.url "$srcdir"/dpf
  git config submodule.external.url "$srcdir"/nanosvg
  git -c protocol.file.allow=always submodule update

  cd sfizz
  git submodule init
  git config submodule.external/abseil-cpp.url "$srcdir"/abseil-cpp
  git config submodule.external/filesystem.url "$srcdir"/filesystem
  git config submodule.external/simde.url "$srcdir"/simde
  git config submodule.external/st_audiofile/thirdparty/dr_libs.url "$srcdir"/dr_libs
  git config submodule.external/st_audiofile/thirdparty/libaiff.url "$srcdir"/libaiff
  git config submodule.external/st_audiofile/thirdparty/stb_vorbis.url "$srcdir"/stb_vorbis
  git config submodule.vst/external/sfzt_auwrapper.url "$srcdir"/sfzt_auwrapper
  git config submodule.vst/external/VST_SDK/VST3_SDK/base.url "$srcdir"/vst3_base
  git config submodule.vst/external/VST_SDK/VST3_SDK/pluginterfaces.url "$srcdir"/vst3_pluginterfaces
  git config submodule.vst/external/VST_SDK/VST3_SDK/public.sdk.url "$srcdir"/vst3_public_sdk
  git config submodule.vst/external/VST_SDK/VST3_SDK/vstgui4.url "$srcdir"/vstgui4
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pkgname
  make
}

package() {
  depends+=(libjack.so libsndfile.so)
  cd $_pkgname
  install -s -vDm 755 bin/drops -t "$pkgdir"/usr/bin
  install -vDm 644 bin/drops.lv2/*.ttl -t "$pkgdir"/usr/lib/lv2/drops.lv2
  install -vDm 755 bin/drops.lv2/*.so -t "$pkgdir"/usr/lib/lv2/drops.lv2
  install -vDm 755 bin/drops-vst.so -t "$pkgdir"/usr/lib/vst
}
