#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=cyphertite
pkgver=2.0.4
pkgrel=2
pkgdesc="A high-security scalable solution for online backups"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/cyphertite"
license=(ISC)

depends=('libassl'
         'libclog'
         'libexude'
         'libshrink'
         'libxmlsd'
         'curl>=7.15.1'
         'expat'
         'libbsd'
         'libedit'
         'libevent>=2.0.10'
         'openssl>=1.0.1.j'
         'sqlite>=3.0.0'
)
makedepends=('libclens')
replaces=('cyphertite-external-libs')

source=(https://opensource.conformal.com/snapshots/cyphertite/cyphertite-$pkgver.tar.gz
        cyphertite-dynamic-link.patch)
sha1sums=('95941fe3f1e18c7639405b0c0f16409b4ddab91a'
          '2f90214c2827dd7e66bcffe7724d0415a2411822')

prepare() {
	cd "$pkgname-$pkgver"
	patch -u -p0 -i $srcdir/cyphertite-dynamic-link.patch
}

build() {
	cd "$pkgname-$pkgver"
	make LOCALBASE=/usr obj

	msg "Building ctutil..."
	make -C ctutil LOCALBASE=/usr

	msg "Building libcyphertite..."
	make -C libcyphertite LOCALBASE=/usr

	msg "Building cyphertite..."
	make -C cyphertite LOCALBASE=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make -C cyphertite LOCALBASE=/usr DESTDIR="$pkgdir" install

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cat <<EOF >$pkgdir/usr/share/licenses/$pkgname/LICENSE
ISC
.
Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.
.
THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF MIND, USE, DATA OR PROFITS, WHETHER
IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
EOF
}
