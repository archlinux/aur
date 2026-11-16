# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient-git
_pkgname=OTPClient
pkgver=5.3.2.r0.gee8fbf0
pkgrel=1
pkgdesc="easy-to-use GTK4 TOTP/HOTP client"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'glib2'
  'gtk4'
  'jansson'
  'libadwaita'
  'libcotp'
  'libgcc'
  'libgcrypt'
  'libpng'
  'libsecret'
  'protobuf'
  'protobuf-c'
  'qrencode'
  'util-linux-libs'
  'zbar'
)
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64'  ## Paolo Stivanin
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

pkgver() {
  git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake \
    -B build \
    -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DSHARE_INSTALL_PREFIX:PATH=/usr/share \
    -DENABLE_MINIMIZE_TO_TRAY=ON \
    -Wno-dev
  cmake --build build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
