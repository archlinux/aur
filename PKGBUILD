# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# AUR pv-static pkg: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=pv-static
pkgver=1.10.5
pkgrel=1
pkgdesc='A terminal-based tool for monitoring the progress of data through a pipeline'
arch=(x86_64 aarch64)
url="https://www.ivarch.com/programs/$pkgname.shtml"
# _url="https://codeberg.org/a-j-wood/$pkgname"
# _url="https://github.com/a-j-wood/$pkgname"
license=('GPL-3.0-or-later')
depends=(glibc)
provides=(pv)
conflicts=(pv)
_archive="${pkgname%-*}-$pkgver"
source=("${url%/*}/sources/$_archive.tar.gz"
        "$_archive.tar.gz.sig::${url%/*}/sources/$_archive.tar.gz.txt")
# source=("$_url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15'
            'SKIP')
validpgpkeys=(D8FF44A79CC8A61EF694FA7EB883E01314DA8E84  # https://ivarch.com/public-key.txt
              2189D5C29F041F2277AFD50AC1596BA33FC56F51  # andrew.wood@ivarch.com
              4267B4F90F2678A112169BD61D1EF7581B45E9A0) # https://codeberg.org/a-j-wood.gpg

build() {
	cd "$_archive"
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static"
	./configure --prefix=/usr --enable-static --enable-shared=no
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
  strip $pkgdir/usr/bin/pv
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" docs/COPYING
}
