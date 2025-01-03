# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Phil A. <flying-sheep@web.de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=Rack
pkgname=vcvrack
pkgver=2.6.0
pkgrel=2
pkgdesc='Open-source Eurorack modular synthesizer simulator'
url='https://vcvrack.com/'
license=(LicenseRef-custom GPL-3.0-or-later)
arch=(aarch64 x86_64)
_plugin_name=Fundamental
_plugin_ver=2.6.1
_plugin_pkg=$pkgname-${_plugin_name,,}
depends=(glfw jansson)
makedepends=(alsa-lib cmake curl gendesk git glew jack jq libarchive libpulse libxrandr openssl
  rtmidi simde speexdsp zstd)
provides=("$_plugin_pkg=$_plugin_ver")
conflicts=($_plugin_pkg)
groups=(pro-audio)
source=(
  "$_name::git+https://github.com/VCVRack/$_name#tag=v$pkgver"
  'filesystem.git::git+https://github.com/gulrak/filesystem'
  'fuzzysearchdatabase.git::git+https://bitbucket.org/j_norberg/fuzzysearchdatabase'
  'nanosvg.git::git+https://github.com/memononen/nanosvg'
  'nanovg.git::git+https://github.com/VCVRack/nanovg'
  'osdialog.git::git+https://github.com/AndrewBelt/osdialog'
  'oui-blendish.git::git+https://github.com/VCVRack/oui-blendish'
  'pffft.git::git+https://bitbucket.org/jpommier/pffft'
  'rtaudio.git::git+https://github.com/VCVRack/rtaudio'
  'tinyexpr.git::git+https://github.com/codeplea/tinyexpr'
  "$_plugin_pkg-$_plugin_ver.tar.gz::https://github.com/VCVRack/$_plugin_name/archive/v$_plugin_ver.tar.gz"
  'plugins.patch'
  'wayland.patch'
  'wmclass.patch'
  'vcvrack.sh'
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
            'SKIP'
            'SKIP'
            '4ca39ba45cd1a365ccc081f479a040178eac16d7d8b51f6fa49ff64b790c1d50'
            '3ad0ea63ce2d5bf62b27e7b51a6d098040435636939d36a584a9b609578a9c9e'
            '22dd80c4d3a95d1ecd409c81c58682a8c7071ea0f74ca9ad0c90c95b9f7714fe'
            'f1abd73a4de8a97328ff0111fb59ab9f0bde42b2b8f0d2a2ee7fb964e47dbe5e'
            '5d30bfcce54219d5b95f1cafebae64503fbf4a46d10432c1e9a3c5cd78977096'
            'e1da6ccf04bae3a2101151fec7ddd32e48ff92b0a1146b559fd3221c778d521f'
            '1159629aa90abb7c972c0f630d55d018b88a6b3bc3ff0bb9466cc06982f38641')

prepare() {
  cd $_name
  # setup submodules
  for _module in filesystem fuzzysearchdatabase nanosvg nanovg osdialog oui-blendish pffft tinyexpr; do
    git submodule init dep/$_module
    git config submodule.dep/$_module.url "$srcdir/$_module.git"
  done
  # original submodule commit was removed by rebase
  git submodule update --init -f dep/rtaudio
  git -c protocol.file.allow=always submodule update

  # add target to only build included dependencies
  echo 'includes: $(nanovg) $(nanosvg) $(osdialog) $(oui-blendish) $(fuzzysearchdatabase) $(ghcfilesystem) $(pffft) $(rtaudio) $(tinyexpr)' >> dep/Makefile

  # support building plugins and loading system-wide plugins
  patch -p1 -i ../plugins.patch
  # set proper window manager class
  patch -p1 -i ../wmclass.patch
  # fix for wayland
  patch -p1 -i ../wayland.patch

  gendesk -f -n \
    --pkgname $pkgname \
    --pkgdesc "$pkgdesc" \
    --name "VCV Rack" \
    --categories "AudioVideo;Audio"
}

build() {
  cd $_name
  _ldflags="-Wl,--whole-archive \
    dep/lib/librtaudio.a \
    -Wl,--no-whole-archive \
    -shared -ldl \
    $(pkg-config --libs glew \
    glfw3 jansson libcurl openssl \
    libarchive libzstd speexdsp \
    samplerate rtmidi \
    alsa jack libpulse libpulse-simple)"
  VERSION=$pkgver make -C dep includes
  VERSION=$pkgver make LDFLAGS+="$_ldflags" STANDALONE_LDFLAGS="$LDFLAGS"
  cd ../$_plugin_name-$_plugin_ver
  VERSION=$_plugin_ver RACK_DIR=../$_name \
    LDFLAGS+=" $(pkg-config --libs samplerate)" make dist
}

package() {
  depends+=(libcurl.so libGLEW.so libarchive.so libcrypto.so librtmidi.so
    libsamplerate.so libspeexdsp.so zenity)
  cd $_name
  install -vDm755 Rack -t "$pkgdir"/usr/lib/$pkgname
  install -vDm755 libRack.so -t "$pkgdir"/usr/lib
  install -vDm755 "$srcdir"/vcvrack.sh "$pkgdir"/usr/bin/$pkgname
  install -vDm644 template.vcv Core.json cacert.pem -t "$pkgdir"/usr/lib/$pkgname

  # resources
  cp -dr --preserve=mode res -t "$pkgdir"/usr/lib/$pkgname

  # headers (required for plugins)
  for _path in {app,dsp,engine,plugin,simd,ui,widget,window}; do
    install -vDm644 include/$_path/* \
      -t "$pkgdir"/usr/include/$pkgname/$_path
  done
  install -vDm644 include/*.hpp -t "$pkgdir"/usr/include/$pkgname
  install -vDm644 dep/include/*.h -t "$pkgdir"/usr/include/$pkgname/dep
  # Makefile snippets required for plugins
  install -vDm644 {arch,compile,dep,plugin}.mk -t "$pkgdir"/usr/share/$pkgname

  # xdg desktop integration
  install -vDm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm644 res/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  # licenses
  install -vDm644 LICENSE.md "$srcdir"/trademark.eml -t "$pkgdir"/usr/share/licenses/$pkgname

  # Fundamental plugin
  cd ../$_plugin_name-$_plugin_ver
  install -d "$pkgdir"/usr/lib/$pkgname/plugins
  cp -a dist/$_plugin_name -t "$pkgdir"/usr/lib/$pkgname/plugins

  # RACK_DIR environment variable
  install -vDm644 "$srcdir"/profile.sh "$pkgdir"/etc/profile.d/$pkgname.sh
}
