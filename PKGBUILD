# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=stone-phaser
_plugin_uri="http://jpcima.sdf1.org/lv2/$pkgname"
pkgver=0.1.2
pkgrel=3
pkgdesc='A classic analog phaser effect LADSPA, LV2 and VST2 plugin'
arch=(x86_64 aarch64)
url='https://github.com/jpcima/stone-phaser'
license=(Boost)
depends=(cairo glibc gcc-libs)
makedepends=(libglvnd)
checkdepends=(lv2lint)
optdepends=(
  'ladspa-host: for LADSPA plugin'
  'lv2-host: for LV2 plugin'
  'vst-host: for VST plugin'
)
groups=(ladspa-plugins lv2-plugins pro-audio vst-plugins)
_dpf_commit='05d91f5852f4bccfd2bce1d4d2e2b3036e29db03'
source=("https://github.com/jpcima/stone-phaser/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-Makefile.base.mk::https://raw.githubusercontent.com/DISTRHO/DPF/$_dpf_commit/Makefile.base.mk")
sha256sums=('cd19c588469125e4aff3add2a570b4b2d9dc98ef37ccc2785636a0b52df86ddf'
            'ef890c65422c8c73ffea7687a45317689378ff2b0f3ccadd497ca1cdc77e08a4')

prepare() {
  cd $pkgname-$pkgver/dpf
  patch -N -r - -p 1 -i ../resources/patch/DPF-bypass.patch
  cd ..
  # Update DPF base makefile to fix arm64 build
  cp -f "$srcdir"/$pkgname-Makefile.base.mk dpf/Makefile.base.mk
}

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  lv2lint -Mpack -q \
    -s lv2_generate_ttl \
    -t "Plugin Author Email" \
    -t "UI Idle Interface" \
    -I "bin/$pkgname.lv2/" "$_plugin_uri"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
