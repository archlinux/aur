pkgname=macopix-cloudef
pkgver=1.7.4+cloudef8
pkgrel=2
pkgdesc="Mascot Constructive Pilot for X – Cloudef's fork"
url="https://github.com/Cloudef/macopix-fork"
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
depends=(gtk2 openssl)
makedepends=(git)
provides=(macopix=$pkgver)
conflicts=(macopix)
source=("git+https://github.com/Cloudef/macopix-fork"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-HxB-euc-ja-0.30.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-marimite-euc-ja-2.20.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-cosmos-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-mizuiro-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-pia2-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-tsukihime-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-triangle_heart-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-comic_party-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-kanon-euc-ja-1.02.tar.gz"
	"http://rosegray.sakura.ne.jp/macopix/macopix-mascot-one-euc-ja-1.02.tar.gz")
sha256sums=('SKIP'
            '3e8ca25e163a97fca12e1a134943a7815e245c779ff88e9444b7af5ee117f4fb'
            'dd64c0834032dd37b83dc5f660dc813fcb0c514f3331f942afc61ff483126418'
            'e39ef6da31f8f8c4c9c8a50fe0e1e00800fe7258b51d1cb4a9b6512962f8a3aa'
            'f57a40f8b107f862162ce40d07f2237670b850af353b4b3ca880e7190e4e104f'
            'b3ae2b2480173673010f91fd0864249e05bd990af9af9fccddd43a2bd829d76b'
            '6dcf1add046046f45ad9b23ed174b22537e23cfa3686b6bc84f607bd34a7ea8e'
            '5849b6e40a8037e0739b523aed7b597cb2464418bb922d7917dd95c7ed65cdef'
            '3dbdcd20f2f1f99062263b70bcef92e31f81b1e3e6c62ac0de8f71df83cb1983'
            '3b2b1d6cbc5f413404680866e2e4506e6ec081af7f90dfa015f5674c8454729b'
            'd365e516557fd6f3826d9086f7348c3e444256371cac87f901078ece7c118454')

pkgver() {
	cd macopix-fork
	echo 1.7.4+cloudef$(git rev-list --count HEAD)
}

build() {
	cd macopix-fork
	./configure --prefix=/usr
	make CFLAGS+=" -fcommon" LDFLAGS+=" -lX11"
}

package() {
	cd macopix-fork
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/usr/share/macopix/pixmap

	if [[ ${INSTALL_MASCOTS:-y} == y ]]; then
		for _dir in ../macopix-mascot-*/; do
			cd $_dir
			cp -av *.menu *.mcpx "$pkgdir"/usr/share/macopix/
			cp -av *.png "$pkgdir"/usr/share/macopix/pixmap/
		done
	fi
}
