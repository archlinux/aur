# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Phil A. <flying-sheep@web.de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=Rack
pkgname=vcvrack
pkgver=2.6.0
pkgrel=7
pkgdesc='Open-source Eurorack modular synthesizer simulator'
url='https://vcvrack.com/'
license=(LicenseRef-custom GPL-3.0-or-later)
arch=(aarch64 x86_64)
_plugin_name=Fundamental
_plugin_ver=2.6.1
_plugin_pkg=vcvrack-free
_libsamplerate_ver=0.1.9
depends=(glfw jansson nanosvg)
makedepends=(alsa-lib autoconf cmake curl ghc-filesystem git glew jack jq libarchive libpulse
  libxrandr openssl rtmidi simde speexdsp zstd)
provides=("$_plugin_pkg=$_plugin_ver" vcvrack-sdk)
groups=(pro-audio)
source=(
  "git+https://github.com/VCVRack/$_name#tag=v$pkgver"
  'git+https://bitbucket.org/j_norberg/fuzzysearchdatabase'
  'git+https://github.com/VCVRack/nanovg'
  'git+https://github.com/AndrewBelt/osdialog'
  'git+https://github.com/VCVRack/oui-blendish'
  'git+https://bitbucket.org/jpommier/pffft'
  'git+https://github.com/cbix/rtaudio#branch=fix/vcvrack-submodule'
  'git+https://github.com/codeplea/tinyexpr'
  "git+https://github.com/libsndfile/libsamplerate#tag=$_libsamplerate_ver"
  "git+https://github.com/VCVRack/$_plugin_name#tag=v$_plugin_ver"
  'arm64-objcopy.patch'
  'plugins.patch'
  'wayland.patch'
  'wmclass.patch'
  'vcvrack.sh'
  'vcvrack.desktop'
  'vcvrack.xml'
  'profile.sh'
  'trademark.eml'
)
sha256sums=('8edf15caed42cc69037e0424bfb574bb9e12aa28c2887be9022fb6c91d571848'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c80f10c74848d15d9499ff602ba1b10fcfc77d87f5f578ecc4378590ef533b87'
            'f79c5873d7d60c942d941700c9b1cddcedb0c1da6dd1196851aefc5c419dcd14'
            '78752a93fb9ceb01c59808989ef77951d3cfdc50ed93b4f20383efbcbf0a1926'
            'fd696d72b88f9ca70247671882883fd6cfcc2bf46965d3c512e8c7f512c587d7'
            'd3bb2bfa0378df7787db001388df4c6956790b3e6abd7d8be0a7ef0c54c386ac'
            'f1abd73a4de8a97328ff0111fb59ab9f0bde42b2b8f0d2a2ee7fb964e47dbe5e'
            '5d30bfcce54219d5b95f1cafebae64503fbf4a46d10432c1e9a3c5cd78977096'
            '50387308a3e93c35c26686c6268e6d6e0a4e4a959c62f7d57b0e02cfeb0de814'
            '9b3fe6dd26f8c82925e6b9de3edf71d23438f46a2ffd3fc3ae087006d1a29f0d'
            'e1da6ccf04bae3a2101151fec7ddd32e48ff92b0a1146b559fd3221c778d521f'
            '1159629aa90abb7c972c0f630d55d018b88a6b3bc3ff0bb9466cc06982f38641')

prepare() {
  cd $_name
  # setup submodules
  for _module in fuzzysearchdatabase nanovg osdialog oui-blendish pffft rtaudio tinyexpr; do
    git submodule init dep/$_module
    git config submodule.dep/$_module.url "$srcdir"/$_module
  done
  git -c protocol.file.allow=always submodule update

  # libsamplerate needs static linking for some modules to load
  ln -sf "$srcdir"/libsamplerate dep/libsamplerate-$_libsamplerate_ver

  # fix binary objects on aarch64
  patch -p1 -i ../arm64-objcopy.patch
  # support building plugins and loading system-wide plugins
  patch -p1 -i ../plugins.patch
  # set proper window manager class
  patch -p1 -i ../wmclass.patch
  # fix for wayland
  patch -p1 -i ../wayland.patch
}

build() {
  cd $_name

  # build deps
  autoreconf -f -i dep/libsamplerate-$_libsamplerate_ver
  _static_deps=(lib/lib{rtaudio,samplerate}.a)
  make -C dep ${_static_deps[@]} \
    include/{nanovg.h,blendish.h,osdialog.h,pffft.h,tinyexpr.h,FuzzySearchDatabase.hpp}

  # build Rack
  _ldflags=(-Wl,--whole-archive -static-libstdc++ ${_static_deps[@]/#/dep/}
    -Wl,--no-whole-archive -shared -ldl
    $(pkg-config --libs glew glfw3 jansson libcurl openssl libarchive libzstd \
      speexdsp rtmidi alsa jack libpulse libpulse-simple)
  )
  make LDFLAGS+="${_ldflags[*]}" \
    EXTRA_CXXFLAGS="-I/usr/include/nanosvg" \
    STANDALONE_LDFLAGS="$LDFLAGS"

  # build plugin
  cd ../$_plugin_name
  RACK_DIR=../$_name make dist
}

package() {
  depends+=(libarchive.so libasound.so libcrypto.so libcurl.so libGL.so libGLEW.so libjack.so
    libpulse-simple.so libpulse.so librtmidi.so libspeexdsp.so zenity)
  cd $_name
  install -vDm755 Rack -t "$pkgdir"/usr/lib/$pkgname
  install -vDm755 libRack.so -t "$pkgdir"/usr/lib
  install -vDm755 "$srcdir"/vcvrack.sh "$pkgdir"/usr/bin/$pkgname
  cp -va template.vcv Core.json cacert.pem res -t "$pkgdir"/usr/lib/$pkgname

  # SDK
  install -vDm644 dep/include/*.h -t "$pkgdir"/usr/include/$pkgname/dep
  cp -va include/* -t "$pkgdir"/usr/include/$pkgname
  install -vDm644 *.mk -t "$pkgdir"/usr/share/$pkgname
  install -vDm644 "$srcdir"/profile.sh "$pkgdir"/etc/profile.d/$pkgname.sh

  # desktop integration
  install -vDm644 "$srcdir"/$pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -vDm644 "$srcdir"/$pkgname.xml -t "$pkgdir"/usr/share/mime/packages
  install -vDm644 res/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # licenses
  install -vDm644 LICENSE.md "$srcdir"/trademark.eml -t "$pkgdir"/usr/share/licenses/$pkgname

  # plugin
  cd ../$_plugin_name
  install -d "$pkgdir"/usr/lib/$pkgname/plugins
  cp -va dist/$_plugin_name -t "$pkgdir"/usr/lib/$pkgname/plugins
}
