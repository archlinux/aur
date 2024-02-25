# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Phil A. <flying-sheep@web.de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=Rack
pkgname=vcvrack
pkgver=2.4.1
pkgrel=3
pkgdesc='Open-source Eurorack modular synthesizer simulator'
url='https://vcvrack.com/'
license=(custom CCPL GPL3)
arch=(x86_64 aarch64)
_plugin_name=Fundamental
_plugin_ver=2.6.0
_plugin_pkg=$pkgname-${_plugin_name,,}
depends=(glfw-x11 jansson)
makedepends=(alsa-lib cmake curl gendesk git glew jack jq libarchive libpulse openssl rtmidi simde
  speexdsp zstd)
provides=("$_plugin_pkg=$_plugin_ver")
conflicts=($_plugin_pkg)
groups=(pro-audio)
_tag=8c6f41b778b4bf8860b89b36d5503fd37924077f
source=(
  "$_name::git+https://github.com/VCVRack/$_name#tag=$_tag"
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
  'vcvrack.sh'
  'profile.sh'
  'trademark.eml'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1e3662c1f5cf57e484e7f605028fbe032e1eab541b73e10453d36df400e68ae0'
            'daaf645f3b321449f72ae1c05d1fb285fee4c570f629d4cd9322a885fd059858'
            '21ac35c6ad4e5a29c32939b17baaf7ac1936077eda2214e28675eefcf2021db8'
            'e1da6ccf04bae3a2101151fec7ddd32e48ff92b0a1146b559fd3221c778d521f'
            '1159629aa90abb7c972c0f630d55d018b88a6b3bc3ff0bb9466cc06982f38641')

pkgver() {
  cd $_name
  git describe --tags | tr -d v
}

prepare() {
  cd $_name
  # setup submodules
  for _module in filesystem fuzzysearchdatabase nanosvg nanovg osdialog oui-blendish pffft rtaudio tinyexpr; do
    git submodule init dep/$_module
    git config submodule.dep/$_module.url "$srcdir/$_module.git"
  done
  git -c protocol.file.allow=always submodule update

  # add target to only build included dependencies
  echo 'includes: $(nanovg) $(nanosvg) $(osdialog) $(oui-blendish) $(fuzzysearchdatabase) $(ghcfilesystem) $(pffft) $(rtaudio) $(tinyexpr)' >> dep/Makefile

  # support building plugins and loading system-wide plugins
  patch -p1 -i ../plugins.patch

  gendesk -f -n \
    --pkgname $pkgname \
    --name "VCV Rack" \
    --exec Rack \
    --pkgdesc "$pkgdesc" \
    --genericname "Virtual modular synthesizer" \
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
  # Rack does not start with glfw-wayland
  depends+=(libcurl.so libGLEW.so libarchive.so libcrypto.so librtmidi.so
    libsamplerate.so libspeexdsp.so zenity)
  cd $_name
  install -vDm755 Rack -t "$pkgdir"/usr/lib/$pkgname
  install -vDm755 libRack.so -t "$pkgdir"/usr/lib
  install -vDm755 "$srcdir"/vcvrack.sh "$pkgdir"/usr/bin/Rack
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
