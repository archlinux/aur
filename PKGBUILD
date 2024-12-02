# Maintainer: Chris Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>

_name=ysfx_saike_mod
_plugin_name=ysfx-s
_reponame=ysfx
pkgname=${_name//_/-}-git
pkgver=0.0.27.r11.g11b5fec
pkgrel=1
pkgdesc='Hosting library and plugin for JSFX (saike mod, git version)'
arch=(x86_64)
url='https://github.com/JoepVanlier/ysfx'
license=(Apache-2.0)
groups=(clap-plugins pro-audio vst3-plugins)
depends=(gcc-libs glibc)
makedepends=(cmake fontconfig freetype2 git)
optdepends=(
  'clap-host: for loading the CLAP format plugin'
  'vst3-host: for loading the VST3 format plugin'
)
provides=(${_name//_/-})
conflicts=(${_name//_/-})
source=(
  "$_reponame::git+https://github.com/JoepVanlier/$_reponame.git"
  'dr_libs::git+https://github.com/mackron/dr_libs.git'
  'clap::git+https://github.com/free-audio/clap.git'
  'clap-helpers::git+https://github.com/free-audio/clap-helpers.git'
  'clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions.git'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_reponame
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_reponame
  git submodule init
  git submodule set-url thirdparty/dr_libs "$srcdir"/dr_libs
  git submodule set-url thirdparty/clap-juce-extensions "$srcdir"/clap-juce-extensions
  git -c protocol.file.allow=always submodule update

  cd thirdparty/clap-juce-extensions
  git submodule init
  git submodule set-url clap-libs/clap "$srcdir"/clap
  git submodule set-url clap-libs/clap-helpers "$srcdir"/clap-helpers
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S $_reponame \
        -B $pkgname-build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DYSFX_PLUGIN_COPY=OFF
  cmake --build $pkgname-build
}

package() {
  depends+=(libfontconfig.so libfreetype.so)
  DESTDIR="$pkgdir" cmake --install $pkgname-build
  install -vDm 755 \
    $pkgname-build/ysfx_plugin_instrument_artefacts/Release/VST3/"$_plugin_name instrument.vst3"/Contents/$CARCH-linux/"$_plugin_name instrument.so" \
    -t "$pkgdir"/usr/lib/vst3/"$_plugin_name instrument".vst3/Contents/$CARCH-linux
  install -vDm 755 \
    "$pkgname-build/ysfx_plugin_artefacts/Release/VST3/$_plugin_name FX.vst3/Contents/$CARCH-linux/$_plugin_name FX.so" \
    -t "$pkgdir/usr/lib/vst3/$_plugin_name FX.vst3/Contents/$CARCH-linux"
  install -vDm 755 \
    "$pkgname-build/ysfx_plugin_artefacts/Release/CLAP/$_plugin_name FX.clap" \
    -t "$pkgdir"/usr/lib/clap
  install -vDm 644 $_reponame/README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # rename files which would conflict with ysfx package
  mv "$pkgdir"/usr/include/{$_reponame,$_plugin_name}.h
  mv "$pkgdir"/usr/lib/lib{$_reponame,$_plugin_name}.a
}
