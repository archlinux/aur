# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=lv2
pkgname=swh-plugins.lv2
pkgver=1.0.16
pkgrel=2
pkgdesc="LV2 port of Steve Harris' plugins suite"
arch=(x86_64 aarch64)
url='http://plugin.org.uk/'
license=(GPL3)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(fftw libxslt)
checkdepends=(lilv lv2lint)
optdepends=('lv2-host: for running the plugins')
provides=(swh-plugins)
source=("$pkgname-$pkgver.tar.gz::https://github.com/swh/$_name/archive/refs/tags/v$pkgver.tar.gz"
        "fix-segfaults.patch::https://patch-diff.githubusercontent.com/raw/swh/$_name/pull/18.patch")
sha256sums=('bc24512de6e2fb7a493226e2e01a80ba8462a318b15c3b0fd0cd914b018c3548'
            '901bf0bb87d0cba518661f80bf64dc1e467629a59622a80b90c437674ada9f0c')

prepare() {
  cd $_name-$pkgver
  # https://github.com/swh/lv2/pull/18
  patch -p1 -i ../fix-segfaults.patch
}

build() {
  cd $_name-$pkgver
  make
  # prevent lilv errors during check by removing unbuilt plugins
  for _dir in plugins/*.lv2; do
    if [ ! -e $_dir/manifest.ttl ]; then
      rm -rf $_dir
    fi
  done
}

check() {
  _lv2path="$srcdir"/$_name-$pkgver/plugins
  for _plugin in $(LV2_PATH="$_lv2path" lv2ls); do
    LV2_PATH="$_lv2path":/usr/lib/lv2 lv2lint -Mpack -q \
      -t "Plugin Symbols" \
      -t "Plugin Version *" \
      -t "Port Properties" \
      -t "Port Range" \
      $_plugin
  done
}

package() {
  depends+=(libfftw3f.so)
  cd $_name-$pkgver
  make PREFIX="$pkgdir"/usr install-system
}
