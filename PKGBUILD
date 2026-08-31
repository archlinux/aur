# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# AUR static pkg: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=pv-static
pkgver=1.11.0
pkgrel=2
pkgdesc='monitor progress of data through a pipeline'
arch=(x86_64 aarch64)
url="https://www.ivarch.com/programs/pv.shtml"
# _url="https://codeberg.org/a-j-wood/$pkgname"
# _url="https://github.com/a-j-wood/$pkgname"
license=('GPL-3.0-or-later')
makedepends=(musl gcc make)
provides=(pv)
conflicts=(pv)
_archive="${pkgname%-*}-$pkgver"
source=("${url%/*}/sources/$_archive.tar.gz")
        #"$_archive.tar.gz.sig::${url%/*}/sources/$_archive.tar.gz.txt"
        #"https://www.ivarch.com/personal/public-key.txt")
# source=("$_url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('fc02c9fc2b82b20a92cc8d98f844be63f22abd98751a8e4abc875e1d803662eb')
            #'SKIP'
            #'6c8dfecfc81c901404013798978c18d9c53a72e065824b4d96ee7ea1c9156477')
#validpgpkeys=(D8FF44A79CC8A61EF694FA7EB883E01314DA8E84  # https://ivarch.com/public-key.txt
              #2189D5C29F041F2277AFD50AC1596BA33FC56F51  # andrew.wood@ivarch.com
              #4267B4F90F2678A112169BD61D1EF7581B45E9A0) # https://codeberg.org/a-j-wood.gpg
build() {
	cd "$_archive"
  export CC=musl-gcc CFLAGS="$CFLAGS -Os"
  export LDFLAGS="$LDFLAGS -static -fno-link-libatomic"
	./configure --prefix=/usr --enable-static --enable-shared=no
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
  strip $pkgdir/usr/bin/pv
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" docs/COPYING
}
