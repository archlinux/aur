#!i/hint/bash
# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=google-breakpad-fixed
pkgver=v2024.02.01
pkgrel=1
_lssver=v2024.2.01
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
options=('staticlibs' '!strip')
conflicts=(
	'google-breakpad-git'
)

provides=(
	'google-breakpad'
)

source=(
	"${pkgname}-${pkgver}.tar.gz::https://chromium.googlesource.com/breakpad/breakpad/+archive/refs/heads/main.tar.gz"
	"lss-${_lssver}.tar.gz::https://chromium.googlesource.com/linux-syscall-support/+archive/refs/heads/main.tar.gz"
)
# noextract=("lss-${_lssver}.tar.gz")
sha256sums=(
	'SKIP'
	'SKIP'
)

prepare() {
	mkdir -p src/third_party/lss
	bsdtar -xf lss-${_lssver}.tar.gz -C src/third_party/lss
}

build() {
	echo "Configuring"
	autoreconf
	./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname}
	echo "Building"
	make
}

package() {
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
