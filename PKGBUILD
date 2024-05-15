# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=airwin2rack
_plugin_name="Airwindows Consolidated"
pkgname=airwindows-consolidated-git
pkgver=2.12.0.r221.33650be
pkgrel=2
pkgdesc="Airwindows effects as a single plugin or stand-alone program with documentation"
arch=(x86_64)
url='https://github.com/baconpaul/airwin2rack'
license=(MIT GPL-3.0-only)
groups=(
  pro-audio
  clap-plugins
  lv2-plugins
  vst3-plugins
)
depends=(gcc-libs glibc)
makedepends=(alsa-lib brotli bzip2 cmake freetype2 git glib2 graphite pcre2 zlib)
optdepends=(
  'jack: for running the stand-alone version as a JACK client'
  'clap-host: for loading the CLAP format plugin'
  'lv2-host: for loading the LV2 format plugin'
  'vst3-host: for loading the VST3 format plugin'
)
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=("$_reponame::git+$url.git"
        'airwindows::git+https://github.com/airwindows/airwindows')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_reponame
  local ver=$(grep version plugin.json | cut -d '"' -f 4)
  printf "$ver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_reponame
  git submodule init libs/airwindows
  git submodule set-url libs/airwindows "$srcdir"/airwindows
  git -c protocol.file.allow=always submodule update libs/airwindows

  # This downloads JUCE and clap juce extensions
  # so we do it in the prepare step
  cmake \
    -B "$srcdir"/$pkgname-build \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_JUCE_PLUGIN=TRUE \
    -DCOPY_PLUGIN_AFTER_BUILD=FALSE
}

build() {
  cmake --build $pkgname-build --target awcons-products
}

package() {
  depends+=(libasound.so libbrotlicommon.so libbz2.so libfreetype.so
            libglib-2.0.so libgraphite2.so libharfbuzz.so libpcre2-8.so
            libpng16.so libbz2.so)
  cd $pkgname-build/awcons-products
  # Stand-alone
  install -vDm 755 "$_plugin_name" -t "$pkgdir"/usr/bin
  # CLAP plugin
  install -vDm 755 "$_plugin_name".clap -t "$pkgdir"/usr/lib/clap/
  # LV2 plugin
  install -vDm 644 "$_plugin_name".lv2/*.ttl \
    -t "$pkgdir"/usr/lib/lv2/"$_plugin_name".lv2
  install -vDm 755 "$_plugin_name".lv2/*.so \
    -t "$pkgdir"/usr/lib/lv2/"$_plugin_name".lv2
  # VST3 plugin
  install -vDm 644 "$_plugin_name".vst3/Contents/Resources/* \
    -t "$pkgdir"/usr/lib/vst3/"$_plugin_name".vst3/Contents/Resources
  install -vDm 755 "$_plugin_name".vst3/Contents/$CARCH-linux/*.so \
    -t "$pkgdir"/usr/lib/vst3/"$_plugin_name".vst3/Contents/$CARCH-linux

  cd "$srcdir"/$_reponame
  # License
  install -vDm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
  # Documentation
  install -vDm 644 doc/manualdaw.md doc/daw.png -t "$pkgdir"/usr/share/doc/$pkgname
}
