pkgname=ibdump
_commit=e656df3a89c823fcfebc58961ecd4ce8fa6533d4
pkgver=6.1.0.r35.ge656df3
pkgrel=1
pkgdesc="InfiniBand and RoCE RDMA packet capture tool for Mellanox"
url="https://github.com/Mellanox/ibdump"
license=(GPL2 custom:BSD)
arch=(x86_64)
depends=(libibverbs)
makedepends=(git)
source=("git+https://github.com/Mellanox/ibdump#commit=$_commit"
	unbork.diff)
sha256sums=('SKIP'
            '1b951beecf20d488e97bdbcc80e414eb1898e2cd994ec579f3a56b52edd55d3c')

pkgver() {
	cd ibdump
	git describe --tags | sed 's/^ibdump-//; s/-/.r/; s/[-_]/./g'
}

prepare() {
	cd ibdump
	patch -Np1 < ../unbork.diff
	rm -f gitversion.h
	make gitversion.h
}

build() {
	cd ibdump
	make WITHOUT_FW_TOOLS=yes
}

package() {
	cd ibdump
	install -D -m 0755 ./ibdump "$pkgdir"/usr/bin/ibdump
	install -D -m 0644 ./LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -D -m 0644 ./README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
