# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Mathias Buhr <napcode@aparatus.de>

_name=OctaSine
pkgname=${_name,,}
pkgver=0.9.1
pkgrel=1
pkgdesc='A four-operator stereo FM synthesizer VST2 plugin'
arch=(aarch64 x86_64)
url='https://www.octasine.com/'
license=(AGPL3)
groups=(clap-plugins pro-audio vst-plugins)
depends=(gcc-libs glibc libx11 libxcb xcb-util-wm)
makedepends=(libglvnd libxcursor python rust)
optdepends=(
  'clap-host: for loading the CLAP plugin'
  'vst-host: for loading the VST2 plugin'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/greatest-ape/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b67fe619d799b4200956304edd3bc7f01952319fcb1a11c0109662eb23e24f75')

build() {
  cd $_name-$pkgver
  cargo xtask bundle -p octasine --release --features "vst2"
  cargo xtask bundle -p octasine --release --features "clap"
}

check() {
  cd $_name-$pkgver
  cargo test -p octasine
}

package() {
  depends+=(libGL.so)
  cd $_name-$pkgver
  # Use 'OctaSine' instead of 'octasine' as the basename for the plugins
  # since that's what previous versions used, so that existing projects will still work.
  install -Dm755 target/bundled/$pkgname.so "$pkgdir"/usr/lib/vst/$_name.so
  install -Dm755 target/bundled/$pkgname.clap "$pkgdir"/usr/lib/clap/$_name.clap
  install -Dm644 *.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 images/* -t "$pkgdir"/usr/share/doc/$pkgname/images
}
