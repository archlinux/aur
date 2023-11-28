# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=string-machine
_plugin_uri="http://jpcima.sdf1.org/lv2/$pkgname"
pkgver=0.1.0
pkgrel=4
pkgdesc='A virtual-analog string ensemble synthesizer LV2 and VST2 plugin'
arch=(x86_64 aarch64)
url='https://github.com/jpcima/string-machine'
license=(Boost)
depends=(glibc gcc-libs libx11)
makedepends=(boost cairo libglvnd)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'lv2-host: for loading the LV2 format plugins'
  'vst-host: for loading the VST2 format plugins'
)
groups=(lv2-plugins pro-audio vst-plugins)
_dpf_commit='05d91f5852f4bccfd2bce1d4d2e2b3036e29db03'
source=("https://github.com/jpcima/string-machine/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-Makefile.base.mk::https://raw.githubusercontent.com/DISTRHO/DPF/$_dpf_commit/Makefile.base.mk"
        'fix-missing-stdint-include.patch')
sha256sums=('5b0d2eb2185199c1de6c7c35700a2caafbc6ba564529a2e7614c15c3aceacc6f'
            'ef890c65422c8c73ffea7687a45317689378ff2b0f3ccadd497ca1cdc77e08a4'
            '9c2d6ba762b64c395cb4eb35393eaaaca560692bf48513d34bf6c81fbe350cf5')

prepare() {
  cd $pkgname-$pkgver
  # Update DPF base makefile to fix arm64 build
  cp -f "$srcdir"/$pkgname-Makefile.base.mk dpf/Makefile.base.mk
  patch -p1 -N -r - -i "$srcdir"/fix-missing-stdint-include.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

# generates too many errors, so ignore check failures
check() {
  cd $pkgname-$pkgver
  lv2lint -Mpack -s lv2_generate_ttl -t "Plugin Author Email" \
    -I "bin/$pkgname.lv2/" "$_plugin_uri" ||
    echo "Ignoring lv2lint errors (known to fail)."
}

package() {
  depends+=(libcairo.so)
  cd $pkgname-$pkgver
  # LV2 bundle
  install -Dm755 bin/$pkgname.lv2/*.so -t \
    "$pkgdir"/usr/lib/lv2/$pkgname.lv2
  install -Dm644 bin/$pkgname.lv2/*.ttl -t \
    "$pkgdir"/usr/lib/lv2/$pkgname.lv2
  # VST shared library
  install -Dm755 bin/$pkgname-vst.so -t "$pkgdir"/usr/lib/vst
}
