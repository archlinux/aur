#Maintainer: Dan Ziemba <zman0900@gmail.com>

_pkgbasename=cyphertite
pkgname=$_pkgbasename-external-libs
pkgver=2.0.0
pkgrel=1
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
         'openssl>=1.0.1.c'
         'sqlite>=3.0.0'
)
makedepends=('libclens')
conflicts=('cyphertite')
provides=('cyphertite')

source=(https://opensource.conformal.com/snapshots/cyphertite/cyphertite-$pkgver.tar.gz
        cyphertite-dynamic-link.patch)
sha1sums=('91dc3ac37f6f9f0190c83d15d1e20785953a0783'
          '2f90214c2827dd7e66bcffe7724d0415a2411822')

prepare() {
	cd "$_pkgbasename-$pkgver"
	patch -u -p0 -i $srcdir/cyphertite-dynamic-link.patch
}

build() {
	cd "$_pkgbasename-$pkgver"
	make LOCALBASE=/usr obj

	msg "Building ctutil..."
	make -C ctutil LOCALBASE=/usr

	msg "Building libcyphertite..."
	make -C libcyphertite LOCALBASE=/usr

	msg "Building cyphertite..."
	make -C cyphertite LOCALBASE=/usr
}

package() {
	cd "$_pkgbasename-$pkgver"
	make -C cyphertite LOCALBASE=/usr DESTDIR="$pkgdir" install

	mkdir -p $pkgdir/usr/share/licenses/$_pkgbasename
	cat <<EOF >$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE
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
