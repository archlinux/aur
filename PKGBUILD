# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=aika
pkgdesc='Fast and efficient command line audio player'
pkgver=0.0.4
pkgrel=1
arch=(x86_64)
license=(AGPL-3.0-or-later)
url=https://fossil.cyberia9.org/aika
source=("$url/uv/$pkgname-$pkgver.tar.bz2")
sha256sums=('3d7a74902e19461f8af0c4c0375f4972f57bffc36f75b64bcf02e4c175217c97')
depends=(
	libao
	libxmp
	mpg123
	opus
	slang
	wavpack
	zeromq
	zlib
	zstd
)
makedepends=(
	asciidoc
	fossil
	fpc
	rake
)

export USER=nobody

build () {
	cd "$pkgname-$pkgver"
	./configure.rb --prefix=/usr --plugindir=lib/aika/plugins --mandir=share/man
	FPC_OPTS='-CpCOREAVX2 -CfSSE64' \
	NO_FOSSIL_NET=1 rake usevendored
	NO_FOSSIL_NET=1 rake release
}

package () {
	cd "$pkgname-$pkgver"
	rake install DESTDIR="$pkgdir"
}
