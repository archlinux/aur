# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>
pkgname=pipeline-gtk
pkgver=3.2.0
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=('GPL-3.0-or-later')
depends=(
  'clapper-enhancers'
  'gtk4'
  'libadwaita'
  'libclapper'
  'libclapper-gtk'
  'openssl'
  'sqlite'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
conflicts=('tubefeeder')
source=("$url/-/archive/$pkgver/pipeline-$pkgver.tar.gz")
sha256sums=('dfb1689c00cb89305bb1d7853f442159e97f4ac8e402a785591a4b9241ab5528')

prepare() {
  cd pipeline-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
	arch-meson pipeline-$pkgver build
	meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}
