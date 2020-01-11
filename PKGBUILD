# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>

pkgname=earlyoom
pkgver=1.3
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
backup=("etc/default/earlyoom")
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
	"earlyoom.1.gz"
)
sha512sums=('c5de742289e82c2098bd88c61dcb3e20eb022905a015b4894c95a4de3978ce18d794a9e7c17c97851ca9f8888728908f7bf978c014b3b69799bffa8b546d258a'
            '3c2d14866a70a7f1711fe85e444e64ab4b1191e3e0fb4aaf730e424d951e3bcf823c5b22153ad8c7bb0c9231b0878eadbcea56967e91230da698432c6783b478')

prepare() {
    cd "$pkgname-$pkgver"
    # remove useless command for Arch package
    sed -i "/systemctl/d;/chcon/d" Makefile
}

build() {
	cd "$pkgname-$pkgver"

	# earlyoom tries to get the version number from the git repo, but we're packaging tarballs here, so that would fail.
	make VERSION=$pkgver earlyoom
}

package() {
        # install the pregenerated manpage, to avoid the pandoc makedepends
	install -Dm644 earlyoom.1.gz "${pkgdir}/usr/share/man/man1/earlyoom.1.gz"
	
	cd "$pkgname-$pkgver"	
	make install-bin install-default earlyoom.service DESTDIR="${pkgdir}" PREFIX="/usr"
	
	install -Dm 644 earlyoom.service "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
}
