# Maintainer: éclairevoyant

pkgname=basez
pkgver=1.6.2
pkgrel=3
pkgdesc='En/decodes base16/32/64, including RFC-compliant URL, MIME, PEM encodings'
arch=(x86_64)
url="http://www.quarkline.net/$pkgname"
depends=(glibc)
makedepends=(help2man)
license=(GPL3 CCPL:by-sa BSD)
source=("$url/download/$pkgname-$pkgver.tar.gz"{,.sig}
        "$pkgname.sha256sum::$url/download/sha256checksums"
        "$pkgname.sha256sum.sig::$url/download/sha256checksums.sig"
        $pkgname-Makefile.patch)
sha256sums=('2a9f821488791c2763ef0120c75c43dc83dd16567b7c416f30331889fd598937'
            'SKIP'
            '2f055c0f842094d29ccd1bdb56053bd980480fa8b4784f6cc3a630b4d474a308'
            'SKIP'
            '3e65ba68e04385331b8f5c1fd2208b9c85e0ffd3873c910c197d84ef418bbb8d')
validpgpkeys=('2C5CF8210CDF553B9521DE76223AE055BD94E154') # Milan Kupcevic <milan@debian.org>

prepare() {
	sha256sum -c $pkgname.sha256sum --ignore-missing

	cd $pkgname-$pkgver
	patch -Np1 -i ../$pkgname-Makefile.patch
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --disable-base32-command --disable-base64-command
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
