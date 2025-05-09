# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient-git
_pkgname=OTPClient
pkgver=4.1.0.r0.g5925281
pkgrel=1
pkgdesc="A simple GTK+ v3 TOTP/HOTP client"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'jansson' 'libcotp' 'zbar' 'protobuf' 'protobuf-c' 'qrencode' 'libayatana-appindicator')
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
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DSHARE_INSTALL_PREFIX:PATH=/usr/share \
    -DENABLE_MINIMIZE_TO_TRAY=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
