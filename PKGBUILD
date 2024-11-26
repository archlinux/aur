# Maintainer: Douglas Creager <dcreager at dcreager dot net>
# Co-Maintainer: shtrophic <aur at shtrophic dot net>
# Contributor: andreafeletto

pkgname=gmid
pkgver=2.1.1
pkgrel=3
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64' 'aarch64')
url='https://gmid.omarpolo.com'
license=('ISC')
makedepends=('signify')
depends=('libevent')
conflicts=('gmid-git' 'gmid-bin')
_signkey=gmid-2.1.pub
source=(
	"https://ftp.omarpolo.com/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.sha256.signature::https://ftp.omarpolo.com/$pkgname-$pkgver.sha256.sig"
	"https://github.com/omar-polo/$pkgname/releases/download/$pkgver/$_signkey"
	"gmid.service"
	"gmid.conf"
)
sha256sums=('9eb0fe4272616e71ef28adb1a10808adb58db01626acc39fddebf58e0a0ac4bf'
            'SKIP'
            'SKIP'
            '61450ba6fb7283b03f099e5172cf4e64bf40093ad2bd126b7915940d40922c9a'
            '4d943727a57dbf5f246963c0f90ccc54919cc2296538457e6b16f29f7580d9d6')

prepare() {
	signify -C -p $_signkey -x "$pkgname-$pkgver.sha256.signature"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	MANDIR='usr/share/man' ./configure --prefix='usr'
	make
}

package() {
	cd "$srcdir"
	install -Dm644 gmid.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 gmid.conf -t "$pkgdir/usr/lib/sysusers.d"

	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md ChangeLog contrib/{Dockerfile,gencert,mime.types,renew-certs} -t "$pkgdir/usr/share/doc/$pkgname"
	install -d "$pkgdir/usr/share/vim/vimfiles"
	cp -r contrib/vim/* "$pkgdir/usr/share/vim/vimfiles"
	install -Dm644 contrib/README "$pkgdir/usr/share/doc/$pkgname/CONTRIB.md"

	install -Dm644 "$srcdir/$_signkey" "$pkgdir/usr/share/doc/$pkgname/gmid.pub"
}
