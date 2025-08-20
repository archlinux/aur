# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Phil A. <flying-sheep@web.de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=Rack
pkgname=vcvrack
pkgver=2.6.4
pkgrel=2
pkgdesc='Open-source Eurorack modular synthesizer simulator'
url='https://vcvrack.com/'
license=(LicenseRef-custom GPL-3.0-or-later)
arch=(aarch64 x86_64)
_plugin_name=Fundamental
_plugin_ver=2.6.4
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
  'git+https://github.com/VCVRack/rtaudio'
  'git+https://github.com/codeplea/tinyexpr'
  "git+https://github.com/libsndfile/libsamplerate#tag=$_libsamplerate_ver"
  "git+https://github.com/VCVRack/$_plugin_name#tag=v$_plugin_ver"
  'arm64-yield.patch'
  'plugins.patch'
  'wayland.patch'
  'wmclass.patch'
  'vcvrack.sh'
  'vcvrack.desktop'
  'vcvrack.xml'
  'profile.sh'
  'trademark.eml'
)
sha256sums=('567087144fd3e94a049da6c499684d382f51d3e8612537321d5bdb9c7a6e29c2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c80f10c74848d15d9499ff602ba1b10fcfc77d87f5f578ecc4378590ef533b87'
            'd932eb4a698a968e40261d395ef4513ef0493f3797c3e49198c86bf9cda3b0fb'
            '9c981aabae8f93d09cf94aeaf904b8855abe9a94e30b32cbb6f77b00c460e3d7'
            'f030e6253b075efb9d3347599b5ce5df404c68a673f1a4fc7589d141cfb06a38'
            '256c1b66caf5cee7744b8f6b392dccea670d7cf0f243607e83330e7f6282f0c8'
            'a00a568bc582aa18b053987c31437585779e03b85b246157325624782cc5b829'
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

  # fix missing __yield in gcc/arm64
  patch -p1 -i ../arm64-yield.patch
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
  cp -va template.vcv Core.json cacert.pem res translations -t "$pkgdir"/usr/lib/$pkgname

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
