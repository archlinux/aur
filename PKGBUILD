# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="OneTrick CRYPTID"
pkgname=ot-cryptid
pkgver=1.0.1
pkgrel=2
pkgdesc='FM drum synthesizer with a Yamaha DX-7 emulation sound engine'
arch=(aarch64 x86_64)
url='https://punklabs.com/ot-cryptid'
license=(GPL3)
depends=(gcc-libs glibc libglvnd libx11 libxcb libxcursor xcb-util-wm)
makedepends=(alsa-lib cargo jack python rust)
optdepends=(
  'jack: for running the stand-alone app'
  'clap-host: for loading the CLAP format plugin'
  'vst3-host: for loading the VST3 format plugin'
)
groups=(clap-plugins pro-audio vst3-plugins)
source=("$pkgname-$pkgver.zip::https://punklabs.com/content/projects/$pkgname/downloads/${_name/ /-}-$pkgver-Source.zip")
sha256sums=('3856c2f7a3c47f66d8b7878dfe7704ba6d48e23f83db9ba137f1c625fef355fd')
noextract=("$pkgname-$pkgver.zip")

prepare() {
  mkdir -p $pkgname-$pkgver
  bsdtar -xf "$srcdir"/$pkgname-$pkgver.zip -C $pkgname-$pkgver
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo xtask bundle onetrick_cryptid --release
}

package() {
  cd $pkgname-$pkgver
  # standalone
  install -Dm755 target/bundled/"$_name" "$pkgdir"/usr/bin/ot-cryptid
  # CLAP plugin bundle
  install -Dm644 target/bundled/"$_name".clap -t "$pkgdir"/usr/lib/clap
  # VST3 plugin bundle
  install -Dm644 target/bundled/"$_name".vst3/Contents/$CARCH-linux/"$_name".so \
    -t "$pkgdir"/usr/lib/vst3/"$_name".vst3/Contents/$CARCH-linux
  # documentation
  install -vDm 644 {CHANGELOG,NOTICES,README}.txt -t "$pkgdir"/usr/share/doc/$pkgname
}
