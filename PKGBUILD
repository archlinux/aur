# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=rezonateur
pkgver=0.1.0
pkgrel=3
pkgdesc='A virtual-analog 3-band resonator effect LV2/VST2 plugin and JACK client'
arch=(aarch64 x86_64)
url='https://github.com/jpcima/rezonateur'
license=(Boost)
depends=(cairo gcc-libs)
makedepends=(jack mesa)
groups=(pro-audio lv2-plugins vst-plugins)
optdepends=(
  'jack: for running the JACK stand-alone application'
  'lv2-host: for loading the LV2 plugin'
  'vst-host: for loading the VST2 plugin'
)
_dpf_commit='05d91f5852f4bccfd2bce1d4d2e2b3036e29db03'
source=("https://github.com/jpcima/rezonateur/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        'rezonateur-no-opengl-build.patch::https://github.com/jpcima/rezonateur/commit/82b731344a961e210c27107786d0c7a4787f77cc.patch'
        'rezonateur-include-stdexcept.patch::https://github.com/jpcima/rezonateur/commit/58ccec5483198cb973be01d4151648b4b70db222.patch'
        "${pkgname}-Makefile.base.mk::https://raw.githubusercontent.com/DISTRHO/DPF/$_dpf_commit/Makefile.base.mk")
sha256sums=('466624147a22299c045e94b385b4f615f16dc91fcb208494c420bedb8e64fac9'
            'f987c0e7be3b1e1f4934cf9cc54a6a2cb3118b3f00595b2b7011800ad2c70e83'
            'dcdbdffd3d3d9e5bd5a59e2983e3b4415da7f7a1f63aeac1bfb3dae7d8749af7'
            'ef890c65422c8c73ffea7687a45317689378ff2b0f3ccadd497ca1cdc77e08a4')

prepare() {
  cd $pkgname-$pkgver
  # don't build unneeded DPF/DGL OpenGL version
  patch -N -r - -p 1 -i "$srcdir"/rezonateur-no-opengl-build.patch
  # fix for missing include with gcc versions
  patch -N -r - -p 1 -i "$srcdir"/rezonateur-include-stdexcept.patch
  # Update DPF base makefile to fix aarch64 build
  cp -f "$srcdir"/$pkgname-Makefile.base.mk dpf/Makefile.base.mk
  # use included patch to fix bypass param in bundled DPF version
  cd dpf
  patch -N -r - -p 1 -i ../resources/patch/DPF-bypass.patch || return 0
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  # LV2 bundles
  install -Dm644 bin/$pkgname.lv2/*.ttl -t \
    "$pkgdir"/usr/lib/lv2/$pkgname.lv2
  install -Dm755 bin/$pkgname.lv2/*.so -t \
    "$pkgdir"/usr/lib/lv2/$pkgname.lv2
  install -Dm644 bin/$pkgname-stereo.lv2/*.ttl -t \
    "$pkgdir"/usr/lib/lv2/$pkgname-stereo.lv2
  install -Dm755 bin/$pkgname-stereo.lv2/*.so -t \
    "$pkgdir"/usr/lib/lv2/$pkgname-stereo.lv2
  # VST2 shared libraries
  install -Dm755 bin/$pkgname{-stereo,}-vst.so -t "$pkgdir"/usr/lib/vst
  # Stand-alone JACK client binaries
  install -Dm755 bin/$pkgname{-stereo,} -t "$pkgdir"/usr/bin
}
