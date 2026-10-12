# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>
pkgname=pipeline-gtk
pkgver=4.1.1
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
  'yt-dlp'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=('tubefeeder')
source=("$url/-/archive/$pkgver/pipeline-$pkgver.tar.gz")
sha256sums=('2f62ed3a6f6606faa4c1d6dc87f9e5cfd37b6ab155df4d08019a0debc7e437ed')

prepare() {
  cd pipeline-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  export GETTEXT_SYSTEM=true
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
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
