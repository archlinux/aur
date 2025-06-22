# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>
pkgname=pipeline-gtk
pkgver=2.6.0
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=('GPL-3.0-or-later')
depends=(
  'clapper-enhancers'
  'libadwaita'
  'libclapper-gtk'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
conflicts=('tubefeeder')
source=("$url/-/archive/$pkgver/pipeline-$pkgver.tar.gz")
sha256sums=('983ffafc941996b9232d9e4ba7dd1979905fc8025a12b441a745d344f02e3a56')

prepare() {
  cd pipeline-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
